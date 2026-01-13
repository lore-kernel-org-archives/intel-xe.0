Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655A1CF45CB
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 01:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C40310E190;
	Tue, 13 Jan 2026 01:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRkVHg2k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35A610E190
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 01:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768267822; x=1799803822;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ADdancGPOPWc9D/5/1FtzWL4yUr0d84SzrPJRrQAVQ0=;
 b=SRkVHg2kSNuCzXYvJ41bCx6OgzSLHej55sNw0k2u+LgY0dPpYji3jnKH
 tbW8COvH7zmFley8IY8BojFxL+tS6sM4iIV2V9DeCWqcfLBdxV3xPfuwL
 5g+QhKQyNvktLdZgLKDWXAMjxtAVdl5SR+mvfolU26akNLkIS/9wcb63h
 V7tbzBNz2wh16tLDBtj+Ga54SxOvxN0gUHR3qJVMrUjFB4ze40hCEUbFH
 kJn0ng/zuGj+mEMopv+RVeNNQVALZ57tr9jJhGGSkVyLglDSQGVhkREDr
 7/pr+5LtkgV4Ha1b1JoD0/pzX9vysLJAPxssZvyPEd/VGzVv6BHk/jxo7 w==;
X-CSE-ConnectionGUID: ukoixfRORMWQHe0eEHSUHA==
X-CSE-MsgGUID: bW1yaCzVTx6FT+oZuuzoIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73401285"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="73401285"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 17:30:21 -0800
X-CSE-ConnectionGUID: woI4gc0nTjyPpIMS7q3hSw==
X-CSE-MsgGUID: SE77G6jMSG6XSnyUTGX+rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204885939"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 17:30:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 17:30:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 17:30:20 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 17:30:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGNmQCDohPXLOp4zDnOuHanr+mhaJhoweGcYsr3vtFl5v9tlIg8953IYElq5YcMHsDYCs05tEN9dMuIAxo4Hfn1KiS4DWKoBmtXLAMs+gaqcC4TZLLWQHTfM0tnrKG3bkb/7fxnsSY0xuMvDDOl6XZrnk6HYfDOdAaJL7zL07W6LXfYMkqd5zDZPN4YINKi+bRcxzt3cFDhePODzdA330+gRXCM0Ze3QCNspD52gTQpbZ+AZlnmonS/w/TE6dfi9I5thcaYOGrfsSA3kW1588h/k7XMwW0fq4LRjmNwJrty0P0ASvwueSiARGL5ZLj45CNLd6FgSM9QLO2gJG8t3aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8E5cAGSWjP3amNtM8t61VEmSlzSmoKsBfe56AN9NC4=;
 b=n5UcIYbhLDKrmEzzrFrG9fmhW3cOHA4mOb4qYtMKAJPRcR9zbcT7C86GQ8vWXZT+PXpeXlgbovaRC14LCoYwEdLORYP6x9W3fy+dM4hbyzCoOmduXy+owPwcIZachh3fL9mIPG15O9+69g0JmGowuFnlWA2Cr5k/+QEfIuYWyqIUXhSxp9aCC4KvGtN/8SCwc6kBTgypas7qePTeHSnF7KtaXxqOJql2s2RHtZgFzyk78v4z2DnJlRKuAYDnP2HobgrnD/nBy4bw79pLTts13C58dhuSRlWU8SB1y9QkBB2iCi9bnZ5/AthjVmcOS1qwP4pp+qQiqQznvhwq9M77Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB6001.namprd11.prod.outlook.com (2603:10b6:208:385::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 01:30:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 13 Jan 2026
 01:30:17 +0000
Date: Mon, 12 Jan 2026 17:30:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 04/11] drm/xe: Add vm to exec queues association
Message-ID: <aWWgJnJ0OCz36WeO@lstrano-desk.jf.intel.com>
References: <20260112232730.3347414-1-matthew.brost@intel.com>
 <20260112232730.3347414-5-matthew.brost@intel.com>
 <840197fff028c4de7c80d62e64b963dbef425979.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <840197fff028c4de7c80d62e64b963dbef425979.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:a03:338::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c55455-aca6-4e0f-6d26-08de52434ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?2xXZC9NOAksnn1Si5+q7Djv0ajlCJy0ptflSMvHIknsww3GZ6fD6U7PxyY?=
 =?iso-8859-1?Q?VyjG98hE8SY+1SptarU4CYInacn/WKvFBieLFuPFNj9vJ0MyMyq0IFtD+x?=
 =?iso-8859-1?Q?NKDyUTmgzft+8/y/Kxn4BL+b7/lB4qi2RHI3yzkYVGGVNc5GoxZpKSvS1g?=
 =?iso-8859-1?Q?zLAfDSujGjvr3V5oehl2ES2iuBcabdY4ATW2y3nrogVjLy5wjohGYDnBqL?=
 =?iso-8859-1?Q?Ksvxr1LhLXb0sC1vmtkmXSAjwbyhd9R0N/i3rEYSj8LsW/0uLMie2/E2nZ?=
 =?iso-8859-1?Q?/PtRmAFVEb0nH6MGpNMI+jBDE1BRSakklAqkOk6TNyYZNAN9dwSDoJoxz3?=
 =?iso-8859-1?Q?Luy3KignckuIU9gz0J2Lvju8+JsxllyIa9bnOqEh7vgQvBwaMXvHdk6nDt?=
 =?iso-8859-1?Q?W1dwin8w8f/TV6E09ww+4Lbc5htox2c5qYd14iGbos/Wbm+WwY2stFHAg8?=
 =?iso-8859-1?Q?DXdB3MQunFnAXHqDQtHqLUGmY1gNn3/TQGtg/jc9H3diREtdFau3Nlpitr?=
 =?iso-8859-1?Q?UjGIiAaZAQsxmok45uacdzMbIiuEsF2koq+X1r0Ia5a80uoZRmgAuexNwN?=
 =?iso-8859-1?Q?D4QYvhB8VyC5z8+0BURfEQiDh/6PS9DuJi3iAC2aFPFk3Hkn5K0Yb4phit?=
 =?iso-8859-1?Q?16td6Mr8IzbeNnzVJRsEBNiR43BOsRjGBTgjHTvF5kJ8/MaoKLLw/xoT7S?=
 =?iso-8859-1?Q?9nxDzUM4fYeQ+vCrwFSrXwepjgVfuH5CckwbFPUjnrDmx0yRgGut3QtDdB?=
 =?iso-8859-1?Q?a+7tMPVJSjWLzEHi5GQdZ/vckkH/cz2sMp187BYth3pCVUbkqoO/nik6hR?=
 =?iso-8859-1?Q?sBCmUaLA36SFwIrG92Q56pYe6S1Z15wiFuxvu2TN7VVoA3CI37mJbb0qfy?=
 =?iso-8859-1?Q?BBWKqDj+1pRbyW2heKcdlGrUPY6beohNab4IcSehT/iEg8+8DfRsQQnC8z?=
 =?iso-8859-1?Q?yVaUOnguuFMHnjmD/ewvgo3htHuWLQ4NsjSU+pJvQhWVRbIvtnWmv1tKuD?=
 =?iso-8859-1?Q?rIT7odP/z/v7viW6dmtWOU2aJ5pB64Zr0ED+fHzlmz+p9ZGrGnkviVFemA?=
 =?iso-8859-1?Q?C7KnHpCuFezQj47bcmEE/W3jJ3BiZe1/6awC9cAZIOPp2Dqx3W45/NebyZ?=
 =?iso-8859-1?Q?Y0EIvxG9szEhUtEM7BL+9mun7bfU6waOrZFv1qJj8UKJi9eglWhqz1Gk8M?=
 =?iso-8859-1?Q?JdiJhTIdQSuzkC1zQXj9MZeypxE75ymA1mFx/3xb51ZodrKn+aemw2DFjY?=
 =?iso-8859-1?Q?SLySo5efPEw32BKtng73bWmz2a0qfExVEeMNfGixQTdjP44FW3JDaLDBiR?=
 =?iso-8859-1?Q?Vm+Irnx5NiuxGHmBT75pmjUPbLABFVEzCfQWXhIp91Ae1xd5IrmSVSvBAH?=
 =?iso-8859-1?Q?Qnnq7HQA1ItXBc+5GR2bnRc5P4vWKFQwKUKHAlg+JdB9xSjgwPvqrr91P+?=
 =?iso-8859-1?Q?hNJsWDl98rgZvHhRdfRM9HwBG6o1yAaoXWKBdA9EN7LOF1uV1phtpqBCxt?=
 =?iso-8859-1?Q?Tbsw4G7Bxh0FeUl6GH9A6S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?W4J+wSoxKfd2DUmVfmwlh/f1u36Nu2b2DTuanogTcvW7NO7ohw7zFONSIp?=
 =?iso-8859-1?Q?dYnYPYzNWMNNQMCjsdp5o5fAxytechZo3C8L9OXs4ShCVT9m2Q9NW/cLtG?=
 =?iso-8859-1?Q?NgECmOYYmQAdoLXDv1yueJ+we+T8fav0itV0Wp5+RThWDKC/u+eJiXgQaP?=
 =?iso-8859-1?Q?RIWB731Zd1TbOaCoJj6Xt5K8FMlk8iE28gOfuYqxIUP0gAo/tXMLBSQk72?=
 =?iso-8859-1?Q?0G3f2VffjjS44NPdg6cXRm7oObUcXayYdJtdze/6cXdtxp/bJ8C8tzIeMr?=
 =?iso-8859-1?Q?+NepISFowMCLhUFVEF/jS6jSMzPvdkL3EfskOf1RA4YdcMnqDPbLypwQ3Q?=
 =?iso-8859-1?Q?prtAN3CVkB1Gu1ErvXZI28AT5qwt8KVc7PJPilS6eDddqBkKcnmzCRsvVx?=
 =?iso-8859-1?Q?DM/6ty3mlKOt8xgQNjMesEJ3s3mAzNLCJyS45rbl2VBnV/ANpQnanVkLHW?=
 =?iso-8859-1?Q?Zce2LDGOmZTwVax9ZA0U1t+35sZdiusToYsJsrSH9qD8e+E58StiNfUQ2M?=
 =?iso-8859-1?Q?h/EFsYuh6b6h+x3VMrSdCr58zpnNqN38rFV0ATS0elJbbYNPp9WRoWd6iC?=
 =?iso-8859-1?Q?1M1W3Dt3tuGJrAvthnCFea0OiVobqCyTeSdSDszPR3MCvdW/NlxxXB+5sU?=
 =?iso-8859-1?Q?YcTz0+PWC8FFGTcom+5rv8ZqWS0LURAVHvEdNclTu2ERvBMi06JTmuYYme?=
 =?iso-8859-1?Q?2Z6oaC7nNdFixMVOptHwYRpS1R1fpnodHxWkEeEh6FbNkDk8ISCz9wViPG?=
 =?iso-8859-1?Q?EvOSgD4mNJhCuXuNNj0zZ90ZSLRyPPpcvKDIQ4CH0IigFUxtwA/YXhH2gk?=
 =?iso-8859-1?Q?nYT0cjyHXc8wS0Lmq/nPjrEHqpy7iG4HUEiYKq6Z2a233K8CiN5B2h3nzr?=
 =?iso-8859-1?Q?aGRZ6M7/ZvWcenY1dNo8VOhuJwD7BYYgufSqVZXqYRDcVzi2PvmhQP8N3E?=
 =?iso-8859-1?Q?jDREkVQPkkZhDn65ZvfqIDkaL5lGxNNodh21BI1Ln/cbAKosoWx8TKMMo3?=
 =?iso-8859-1?Q?Qacxv4mUfLY6If1wBjsonVx9IdCPqsxhkwX4vCvKPbfvTO2p6EDXEuICrg?=
 =?iso-8859-1?Q?1ThxPgPtoe9ARWBQG3MdKTQDvI/kmyBP2SYTMFsM84d9y3CqC98CqO9QgQ?=
 =?iso-8859-1?Q?BZD1SFLAzQFhUvLWNmdOJVmei4v6CsNEpLricRxy158W7x4h0BL/IXp5En?=
 =?iso-8859-1?Q?+/7yk1HoNXdWB3SU6xvhJ2mztSwynv/cTIwV0dgkYuRsxHrdD0NKS8pRiw?=
 =?iso-8859-1?Q?pdux7BBEp1nolHXalDeZjPbaVN9aT3hIOGLDyBVp+Sbx5AGzE9H3eU34v1?=
 =?iso-8859-1?Q?jt0kQ0t+V+abXtO0ajNif9aYpBDqhXesDxkIywwktCPZ4ivLcuFdt3lJcu?=
 =?iso-8859-1?Q?9HwqJLIFK1nZbrH0JkNQEM9acbk77rmuRtnFSzrBv91zb/pbTyQloB7c9W?=
 =?iso-8859-1?Q?/rb5R5Sj2CfUG7NUNdarDBAMgjFaC5OtVDhEz695pMKK/qsZMejI30YjmB?=
 =?iso-8859-1?Q?nqv5TyXQ703dPLnnyll8nyBjTpt5X6xUnc6YJUlknjbogSGClnM5I7V8//?=
 =?iso-8859-1?Q?d8jOqemQbFJDU19Ee9E7+ZIAaPdTCu2g5bXLkGlSRCQyBR7uNV8eREYr0h?=
 =?iso-8859-1?Q?xdF9DEtXVgvrKuycYijCBihP7LZ2y10rigKSj/9bAFnY7GwjwnM9pj2aFT?=
 =?iso-8859-1?Q?lWP1PukWRq8SAuMQkQevrfal9CBM/9W23TcPRscsMU0hO3UDtsETzHCZi+?=
 =?iso-8859-1?Q?AiSXprjJTkXLF3v6iYKrSGvnXpdCvHiEda/D1nvnpUjAsYxDXFH9pI3fiS?=
 =?iso-8859-1?Q?m5Q+3FLLXj+Iq6ETCdFnhq0+mRMShOM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c55455-aca6-4e0f-6d26-08de52434ea6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 01:30:17.0566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMbcgdwN8OfOoMYfKYtPvBxeAwx0qmLrUZBvx8cIDIvYWQ96txl7JhIMOg0qhBAiVk+rofM2+cI3hee1LheuAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6001
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 12, 2026 at 06:04:53PM -0700, Summers, Stuart wrote:
> On Mon, 2026-01-12 at 15:27 -0800, Matthew Brost wrote:
> > Maintain a list of exec queues per vm which will be used by TLB
> > invalidation code to do context-ID based tlb invalidations.
> > 
> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.h           |  7 ----
> >  drivers/gpu/drm/xe/xe_device_types.h     |  7 ++++
> >  drivers/gpu/drm/xe/xe_exec_queue.c       |  7 +++-
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
> >  drivers/gpu/drm/xe/xe_vm.c               | 46
> > ++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm.h               |  3 ++
> >  drivers/gpu/drm/xe/xe_vm_types.h         | 13 +++++++
> >  7 files changed, 78 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.h
> > b/drivers/gpu/drm/xe/xe_device.h
> > index 10d04c324257..db939fc82f71 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -62,13 +62,6 @@ static inline struct xe_tile
> > *xe_device_get_root_tile(struct xe_device *xe)
> >         return &xe->tiles[0];
> >  }
> >  
> > -/*
> > - * Highest GT/tile count for any platform.  Used only for memory
> > allocation
> > - * sizing.  Any logic looping over GTs or mapping userspace GT IDs
> > into GT
> > - * structures should use the per-platform xe->info.max_gt_per_tile
> > instead.
> > - */
> > -#define XE_MAX_GT_PER_TILE 2
> > -
> >  static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe,
> > u8 gt_id)
> >  {
> >         struct xe_tile *tile;
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 4dab3057f58d..8db870aaa382 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -79,6 +79,13 @@ enum xe_wedged_mode {
> >  #define XE_GT1         1
> >  #define XE_MAX_TILES_PER_DEVICE        (XE_GT1 + 1)
> >  
> > +/*
> > + * Highest GT/tile count for any platform.  Used only for memory
> > allocation
> > + * sizing.  Any logic looping over GTs or mapping userspace GT IDs
> > into GT
> > + * structures should use the per-platform xe->info.max_gt_per_tile
> > instead.
> > + */
> > +#define XE_MAX_GT_PER_TILE 2
> > +
> >  #define XE_MAX_ASID    (BIT(20))
> >  
> >  #define IS_PLATFORM_STEP(_xe, _platform, min_step, max_step)   \
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index b5737563ee14..ce309d848916 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -154,8 +154,10 @@ static void __xe_exec_queue_free(struct
> > xe_exec_queue *q)
> >         if (xe_exec_queue_is_multi_queue(q))
> >                 xe_exec_queue_group_cleanup(q);
> >  
> > -       if (q->vm)
> > +       if (q->vm) {
> > +               xe_vm_remove_exec_queue(q->vm, q);
> >                 xe_vm_put(q->vm);
> > +       }
> >  
> >         if (q->xef)
> >                 xe_file_put(q->xef);
> > @@ -226,6 +228,7 @@ static struct xe_exec_queue
> > *__xe_exec_queue_alloc(struct xe_device *xe,
> >         q->ring_ops = gt->ring_ops[hwe->class];
> >         q->ops = gt->exec_queue_ops;
> >         INIT_LIST_HEAD(&q->lr.link);
> > +       INIT_LIST_HEAD(&q->vm_exec_queue_link);
> >         INIT_LIST_HEAD(&q->multi_gt_link);
> >         INIT_LIST_HEAD(&q->hw_engine_group_link);
> >         INIT_LIST_HEAD(&q->pxp.link);
> > @@ -1205,6 +1208,8 @@ int xe_exec_queue_create_ioctl(struct
> > drm_device *dev, void *data,
> >         }
> >  
> >         q->xef = xe_file_get(xef);
> > +       if (eci[0].engine_class != DRM_XE_ENGINE_CLASS_VM_BIND)
> > +               xe_vm_add_exec_queue(vm, q);
> 
> This still will hit an issue if we're sending a TLB invalidation before
> we register the context with GuC, just to reiterate... of course we
> agreed to move forward here.
> 

Ah, no. The active vfunc called in last patch prevents against this.

> >  
> >         /* user id alloc must always be last in ioctl to prevent UAF
> > */
> >         err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b,
> > GFP_KERNEL);
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 5fc516b0bb77..d3e2789cf5bc 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -205,6 +205,9 @@ struct xe_exec_queue {
> >                 struct dma_fence *last_fence;
> >         } tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_COUNT];
> >  
> > +       /** @vm_exec_queue_link: Link to track exec queue within a
> > VM's list of exec queues. */
> > +       struct list_head vm_exec_queue_link;
> > +
> >         /** @pxp: PXP info tracking */
> >         struct {
> >                 /** @pxp.type: PXP session type used by this queue */
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index bdb04d6bf39c..3a1a1bd74d8d 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1530,11 +1530,23 @@ struct xe_vm *xe_vm_create(struct xe_device
> > *xe, u32 flags, struct xe_file *xef)
> >         INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> >  
> >         INIT_LIST_HEAD(&vm->preempt.exec_queues);
> > +       INIT_LIST_HEAD(&vm->exec_queues.list);
> >         if (flags & XE_VM_FLAG_FAULT_MODE)
> >                 vm->preempt.min_run_period_ms = xe-
> > >min_run_period_pf_ms;
> >         else
> >                 vm->preempt.min_run_period_ms = xe-
> > >min_run_period_lr_ms;
> >  
> > +       init_rwsem(&vm->exec_queues.lock);
> > +       if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> > +               fs_reclaim_acquire(GFP_KERNEL);
> > +               might_lock(&vm->exec_queues.lock);
> > +               fs_reclaim_release(GFP_KERNEL);
> > +
> > +               down_read(&vm->exec_queues.lock);
> > +               might_lock(&xe_root_mmio_gt(xe)->uc.guc.ct.lock);
> > +               up_read(&vm->exec_queues.lock);
> > +       }
> > +
> >         for_each_tile(tile, xe, id)
> >                 xe_range_fence_tree_init(&vm->rftree[id]);
> >  
> > @@ -4570,3 +4582,37 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct
> > xe_vm *vm, uint64_t start, uint64_t r
> >         return xe_vm_alloc_vma(vm, &map_req, false);
> >  }
> >  
> > +/**
> > + * xe_vm_add_exec_queue() - Add exec queue to VM
> > + * @vm: The VM.
> > + * @q: The exec_queue
> > + */
> > +void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
> > +{
> > +       /* User VMs and queues only */
> > +       xe_assert(vm->xe, !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
> > +       xe_assert(vm->xe, !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
> > +       xe_assert(vm->xe, !(q->flags & EXEC_QUEUE_FLAG_VM));
> > +       xe_assert(vm->xe, !(q->flags & EXEC_QUEUE_FLAG_MIGRATE));
> > +       xe_assert(vm->xe, vm->xef);
> 
> Can you add a check here against has_ctx_tlb_inval? No need to maintain
> this list if the platform doesn't support this invalidation.
> 

Yes, I do that.

> Can we also assert that the q->vm is the same as the vm being passed
> above? We want to make sure we aren't adding a queue from another VM
> here.
> 

Yes, I can also do that.

Matt

> Thanks,
> Stuart
> 
> > +
> > +       down_write(&vm->exec_queues.lock);
> > +       list_add(&q->vm_exec_queue_link, &vm->exec_queues.list);
> > +       ++vm->exec_queues.count[q->gt->info.id];
> > +       up_write(&vm->exec_queues.lock);
> > +}
> > +
> > +/**
> > + * xe_vm_remove_exec_queue() - Remove exec queue from VM
> > + * @vm: The VM.
> > + * @q: The exec_queue
> > + */
> > +void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue
> > *q)
> > +{
> > +       down_write(&vm->exec_queues.lock);
> > +       if (!list_empty(&q->vm_exec_queue_link)) {
> > +               list_del(&q->vm_exec_queue_link);
> > +               --vm->exec_queues.count[q->gt->info.id];
> > +       }
> > +       up_write(&vm->exec_queues.lock);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 6cc98df47291..288115c7844a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -287,6 +287,9 @@ static inline struct dma_resv *xe_vm_resv(struct
> > xe_vm *vm)
> >  
> >  void xe_vm_kill(struct xe_vm *vm, bool unlocked);
> >  
> > +void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue
> > *q);
> > +void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue
> > *q);
> > +
> >  /**
> >   * xe_vm_assert_held(vm) - Assert that the vm's reservation object
> > is held.
> >   * @vm: The vm
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 437f64202f3b..87318a4f5b08 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -298,6 +298,19 @@ struct xe_vm {
> >                 struct list_head pm_activate_link;
> >         } preempt;
> >  
> > +       /** @exec_queues: Manages list of exec queues attached to
> > this VM, protected by lock. */
> > +       struct {
> > +               /** @exec_queues.list: list of exec queues attached
> > to this VM */
> > +               struct list_head list;
> > +               /**
> > +                * @exec_queues.count: count of exec queues attached
> > to this VM,
> > +                * per GT
> > +                */
> > +               int count[XE_MAX_TILES_PER_DEVICE *
> > XE_MAX_GT_PER_TILE];
> > +               /** @exec_queues.lock: lock to protect exec_queues
> > list */
> > +               struct rw_semaphore lock;
> > +       } exec_queues;
> > +
> >         /** @um: unified memory state */
> >         struct {
> >                 /** @asid: address space ID, unique to each VM */
> 
