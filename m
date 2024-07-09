Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E091C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 14:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFBA10E587;
	Tue,  9 Jul 2024 14:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WuDacz6K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2209510E589
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720536325; x=1752072325;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jft10QT3vN1jFEbOE1vK+fUvI1FVdRzJ4OuFMEqyokU=;
 b=WuDacz6K2Hbt1WEeYJERnLsN0BlkYaik43gSEk9KnIYohCqv6Etwq0A4
 WhalJlNWu6QXLSJ6s2NGWSJgPmeHsjgy0ElhJZMQgmEMR/ryYYmbSqFAA
 Vcnigat6IM/Js0PaDuWN3nPht1+tYUaXTM/A9qpGfOcV/dB3nxAhdz6pH
 AHzVxPxQ+LsFGjFCeJkna6b6atdO4qdNKDKZjP89aOlpbPM8I4aluCBZ1
 LwzHG4tH3oL2yyCcAZ/lmrwAhS3aQIPEaSq3wrYiWnLYrDTrBtjzIpLiB
 am6ra+Q3l5dadDIXVhQa5xxKcTLLDzujJ3mWHXXVQejyVGTbf819IIjsW g==;
X-CSE-ConnectionGUID: qwPkSV21SEOijaOJFbhvpw==
X-CSE-MsgGUID: SFlRcUylTK29OAK5XaSBbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28402423"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="28402423"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 07:45:24 -0700
X-CSE-ConnectionGUID: s31C66DDRT2AhWSfrIiiwA==
X-CSE-MsgGUID: EWh9YDQvSGCL5qzH/H6XFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="85411006"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 07:45:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 07:45:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 07:45:24 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 07:45:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYFBdGGD9dt6r57xC0ggcOV2Ir7L0KpBqhXpHbT5EUtvMttHAbb5p//sN6CiK3nd13HfgF/USDDC3cGIm8niEa+g41PumGzh8AB44hu/e7lhdul1NlfBK+GLLlOMEf/Jd7MC+bzA/r+LgCvQGNlZ/xdFIDzcX4Z+/Sb13Gda9/ZNsVtJVo4p9770ASVjQqXVH1+cn4jQQOudFFi8D4nnhRAXMxFzUeWLpFz13y19ni3c8wv5u3tJev6aRZaTZZBVCffhFH5EYlwpKOq6XSej8T6MXPyS5OrDQyHozOpEyyOQofjoTlxVcOyHi0A1gwhEnEJETyHqGsVughhkwQ1fkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jft10QT3vN1jFEbOE1vK+fUvI1FVdRzJ4OuFMEqyokU=;
 b=B5oTHJ7js4qSlTR/Dgoms2PH/+mbeW+QwiZXCtSr/HzfC89HooQDPI82O6bkT7Jmf8+LKE5XzkiJzEMSpK2VfuLSSqPrjoshAJu1OO/H0c8SkQULaqZlIugFdoh83EhgmKFWI/yteGRVk3zFnm19TdLhMeqoAaSs9kZjNa3O1FYdIJOdP2CZ2uj/ylIruhduu1+LgC7lhHxDWLTL8SK9mv2b8NLBQp58tS3Kw3k6wr4QEnuIWiXqFVaklWmDHdI4Xt5/hq6n0iockW3NPEu6uig/S5Zro3+/JpsLyBzHsJAPpgIq5CNWtXq3VhOCyD9zyCbRHMI0u3/WlC2g45EJzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4832.namprd11.prod.outlook.com (2603:10b6:a03:2dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 14:45:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 14:45:21 +0000
Date: Tue, 9 Jul 2024 09:45:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/xe/kunit: Simplify xe_dma_buf live tests code
 layout
Message-ID: <4bwdavqp7dsunfxbb56ygkci2gvfalvpvtdmnv4rddnlf2e5zh@ptlje3yzkxwp>
References: <20240708111210.1154-1-michal.wajdeczko@intel.com>
 <20240708111210.1154-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240708111210.1154-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW2PR16CA0002.namprd16.prod.outlook.com (2603:10b6:907::15)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4832:EE_
X-MS-Office365-Filtering-Correlation-Id: 296c8204-4d08-467e-31f5-08dca025c211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fMp4YiQdjtIl6Q3MDUcPmcOUdf0lr8eo4bLL+UeQd/83pozHenMBCe9BmQ2N?=
 =?us-ascii?Q?Czaia2WLd3XuGRUzTT8d+b9bAi3zZYpZyXGwzaSiO0KgmUqaTpH3mzyDMpvo?=
 =?us-ascii?Q?TRjv45B8R47c/oQvregPy9H/lig+ngwwryUwdTUaHPvtZOP030V2mnA9K72S?=
 =?us-ascii?Q?F7oMbbeDECluwGaewURSULMfQUfjWtbiMoNQEVe4KQtaZNFUhW65DuUy8h8s?=
 =?us-ascii?Q?C5KXgWu0hWsc9YLro3ZdZPX+vx9VkctIlj1OaaauMLosowthjornKVAIMMro?=
 =?us-ascii?Q?pAeSojox1Vg5xKzrJOuvpODn/U1uc2zCuZwLKwBqYW4h/nLzFmYaX2q41mI9?=
 =?us-ascii?Q?+BFVmHgcHcrAWFkff2aCfAtR+hiLH7gB45XNpKmRFqRPyLZ7u5HZmVikzXxW?=
 =?us-ascii?Q?qyYPgb8uO8471Of3HWDPCVJl3j6oQt/ws23UH7vFhMxG297ZKhMXzsKGJGdd?=
 =?us-ascii?Q?97x+kji0Fv8DhLco6pHEspHe9SNXA2jKThO34miM4nFHGs5nMRli50p/9Pq5?=
 =?us-ascii?Q?gYVPz7Db08Mneus+OTor8VKdXez/qxMPU2ZnrDrYflAOXetVLNqlErJsgl+6?=
 =?us-ascii?Q?GEDRy78tJIhLNxJNxYUbzvcS/MfnzIa14a5iulq2zPQGiThoaRD6Ox+YSJPf?=
 =?us-ascii?Q?1PiBnITlbO3J5aT50UW44FQb5o+WTtX3j+CqcfVdcGw1yy9rQxFQZTbcpOrQ?=
 =?us-ascii?Q?CeR1yLvHx5q9sjmXgE42hmytcfeDZn+zFbCSDdMXbygk+ub7ni4wDVNfj/Ao?=
 =?us-ascii?Q?lAlajwoOa1POJbAkyGaRfp43W5JRFSxO7L9gPMYV/tcyFcHdMfKec2loEDQk?=
 =?us-ascii?Q?DL8hOoPIhNg7k4uEip4wYUNf4FpiztyAl7HXogWJCMR/QDyir3WMNrcCSAKq?=
 =?us-ascii?Q?mhkqRddC+bxulUMNbR5PWN0aTzdzVeRp1vRMDTviXfCd8NbfJMItJtQxvXj1?=
 =?us-ascii?Q?MVg35WCh9ffEpIG5dcDZkRkZVX2hVkfjg2gjdPZmO2i0LGYpv8z3UJcZjTVN?=
 =?us-ascii?Q?bZ28hYYGD8MgWt9g99UZ3iyVETGknDj3oifUNwDMLYbR8X7BZRs5xtI6uhm7?=
 =?us-ascii?Q?rX+8XASUVTu7rGnhfLCbHC7NF0xymVi+tT8X2DDqgwaCdOMInt055kYaiAAE?=
 =?us-ascii?Q?vbh7fvDiwaziYKvg4yHk3nSy/prbtBpVAbFWmtVaK3dKtI1qoUT8d8ZOb28W?=
 =?us-ascii?Q?pvQW2lqmHB1OwzoyTa0OExKkSbKilaDbZPXXMvflUKuwgecG7bVJHj9i9Az6?=
 =?us-ascii?Q?BZltJ7kaPWb1vSXwsPJIaG97UJreAxaPQSBywx4nUEwNYZ0ENtB03HfZh6fh?=
 =?us-ascii?Q?XMovMTF7+ff5yoFarz8KgrqPk0tZtiztXjIPOcaOXfvG6w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1Ee0kyBvcN2naY+HKFlLyA52loFb/hmZxfabCa1m1IRhI1ATsjeOvpgcn753?=
 =?us-ascii?Q?YX3/JthmKEi12vAUfRQpC36l/u0vpHX5wPifP36wQvZovd+Wa2URUX9jUqGp?=
 =?us-ascii?Q?TzNHPAHnrCd1l+96JzIDQAuuw/9hNohW2A6EpOOANc4wAbru+EAqahUOJIUP?=
 =?us-ascii?Q?0XqdUfYs+DZ2OE6ehSHvljmzFoHXUZeYQ4U/g/UWUMdYv4k+PQ8rNV62NjKr?=
 =?us-ascii?Q?X1Q6XHj6cn3gvWSN+GOkAWIlSdat8SRKxIkIJj/KhpmhNtweRdpU650fso5c?=
 =?us-ascii?Q?dx3X/AnGr4PjKfPQPYnyZ137axx13dTKdTjKE3fqZigq7SYLbAshyEb023vb?=
 =?us-ascii?Q?dSNCS/GZcAelWywzyIOz1gBvayTiVCQy9sIvclhtX6D40egp5wmLK0nagc8a?=
 =?us-ascii?Q?PSUYjKl0bN65w6hLYWmBy945yqFvJbHZfDNGxOGMtZlq+JLgg2oItwh7pceU?=
 =?us-ascii?Q?lDsKFjDJSjW1UbRi6+xZdzdppa5e7ae89/WwcOCeBcZWMWAlpZkQqStTVTUn?=
 =?us-ascii?Q?I9epuf/u5OdodpKW1pYWaY9HAOzLBzk+GRhu7boPHunyuLbVzuQAsPurHuQX?=
 =?us-ascii?Q?RLkHSdVajFo0t6ypRERN+uCWjjHn+lm0qzQTI2ReelPDvtA8fXdJstMg8w8A?=
 =?us-ascii?Q?21dRqcwV6aYzkEOyaDv7L9kc3G/y4vodNCcKS4b51uISHHRPBwgsFmZl79zg?=
 =?us-ascii?Q?88DG3Z1RPCn9IhTJolDUN6AxkjzFJhgYUTvyokwFaRI+P8E83kpFEUuTT5WO?=
 =?us-ascii?Q?L6v26UEGc6nNYt2l5f1qV6vVBiA+c0am2vlaWzfmDsM8taxjUfa02Q1RqAIZ?=
 =?us-ascii?Q?OalFnYVJJblUSDQ01pzllJhhroiDwOoTRPJDmnEG806cF16LeAJMrWE0Ia3+?=
 =?us-ascii?Q?qQIi2KTyfJMoar8q54P5xpewUnpJWaf1f21SA/VDRBTDESDcjxOSTYyT/Iiq?=
 =?us-ascii?Q?ZIuXkOvH0ego9RKaxbxRe0CWVF56IPn3dOQjN6m3UF0yWedx6d8Q4WEzJnwb?=
 =?us-ascii?Q?Z6PtHWHiZ734Xig7hA879z2jHXVJl6Jb3/AHggIK1cihFhjbnAXsiRSEIP8y?=
 =?us-ascii?Q?owXYM5yPve3730zxqVUEcA5fcD7ajjV+Z7thXNxSH2uFFMV+zF4216U6a6fb?=
 =?us-ascii?Q?uSDPCPJiKyg3OzzeyGpLNo+ebouqHGdkOooJDKMcBrv697VVAtUEnZPit7uV?=
 =?us-ascii?Q?d/bKrYB72p5g4ldcu8eeMUNGPFIRg9ZQZACDVlnq13Clu3x5AI4PvEsDZprk?=
 =?us-ascii?Q?pT6IK6+SYN0jJFqb6gqwxp7+0tknx2Jw6IjATN8iG1tc3WEXAAiZotFYKzSt?=
 =?us-ascii?Q?M9l2XLpwiSCw1Rm45GH100lwqMwZg3kGQH0gSatYDjvjmeQS8rdWA182G4U5?=
 =?us-ascii?Q?SnD1xQHK7BHnwLl0aoF0Afr994/20GN7tdGfZtQTZJavs5swWk4eHH4nSTPb?=
 =?us-ascii?Q?MsPyG6sFzmdH95NlPCFmAQ8ZYszwiHjkLmLpf0rT+vlYQGEHSKRjllc07sPM?=
 =?us-ascii?Q?znHcqAF8/XvDkPIj8q1GXt/50MIaBkmN55WfbyJCNW2gCAGx5lsH2vSCggqw?=
 =?us-ascii?Q?h5laqDsiRMZmt94iEjojPfLYKPSAVlL1EZpZcgafp8q8B1F+Ewey2zUd/O90?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 296c8204-4d08-467e-31f5-08dca025c211
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 14:45:21.1150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0IDTvIBZ67c55tm0a3psdXSSJZVT6h7WafX+q+2RQaxOskH2FkqXuRqtRTs0KXro1s7YANGZaD/R4uEFNFqH9gvjg+hA9zl9gmHDB9dH3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4832
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

On Mon, Jul 08, 2024 at 01:12:08PM GMT, Michal Wajdeczko wrote:
>The test case logic is implemented by the functions compiled as
>part of the core Xe driver module and then exported to build and
>register the test suite in the live test module.
>
>But we don't need to export individual test case functions, we may
>just export the entire test suite. And we don't need to register
>this test suite in a separate file, it can be done in the main
>file of the live test module.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
