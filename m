Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADACCCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 16:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE32510EA52;
	Thu, 16 Oct 2025 16:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMm7NoOw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFDF10EA52
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 16:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760633170; x=1792169170;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KDL/TFlQYxkLPNLV+MSRhhX115QvwMRiHOD46eC6AC0=;
 b=MMm7NoOwF9F0z84BRc0jA2MNM/u2FXQpU8qsATiYCTENEevGQZLEJTe8
 /MULaB7NuUg/FXIHT7gw+0vGw0E079t23XOFjHJSZREtskYv3MRlz5kc1
 XZUSKH/wgef3o/e/g3Hddg49yfrL8zdwhS6oSqNiNUdreFNnCba32rcgv
 c+FxcaMXAXhPn/P95gWcKRGMyK/XASM6kx7/6oIGg1lvuoV0aW/Rjn/bh
 HLbvj2RAHu8kq/IoY24VSx9jFmyRIeQVXfFnFP3I+0rqpfb2lJAoPEPSR
 fl6hXpzhu4cZzXVBC6oWMgGQq8C+zm2LfOkvkTjN2msUuI6Mz3gPtmgo1 g==;
X-CSE-ConnectionGUID: ZR51Lpx2RpeC0TYjiAWl5A==
X-CSE-MsgGUID: C2lj42KETPO5SmJL7kS10A==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73506421"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="73506421"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:46:10 -0700
X-CSE-ConnectionGUID: Lbl7OUAST1CILBO/iZNNXQ==
X-CSE-MsgGUID: 9H5OlA2BR8Cf8QuoxTC7AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186521940"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:46:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 09:46:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 09:46:08 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 09:46:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=od0NI2b0zE0YwrGSPXo5E4PNVB/DF3C7kJoe08olUsmI/hEPNEbnF2KD7snlly+QopF3fW5avuPRhUea4wD/aiTvgW83U9s/McXOJKYYCF2vb0oc0I80F0uYXSzIsf5cxLCE6tMcw7djByfj2FxR66/+ZJ8JfLvbcB0tlRLlSXhAvSwgnXEIQQo5pFRxfUeHiEqXPylMDaKY3/isQwOPGLcAevbTjz8+CIulxrWvsFm1/QjdwPwHJzjr9EJHhHyrZKj+QVW4ebKNRsvYnoJ75KilibUe9aFRo+0EIAIZRaVoucOjkSCfGZJ4A+guLRuGNgk6MkDmWKFn1F7Ok8nrTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKLGsMKgy3STMnXu2MDeBrOpMQ2CSaznHqQli2ucap0=;
 b=M2Y5CzFOF8HO0/nqW8BUKhlxCyO2mv5OcfqZzQjIJmIotbi4hkjV72iCc5fus9qPAELpb7XggySg5Qhkl0pmDFN81CXvXTMT6htLdSzlmoDvv24jgvkMDylGG9gjpkKP76xyw6P2YRD0VqY+LeimauSmNwfAaB4BRUIWAVWwvQfmwVQhOBHITdsmkguW4S5kIbztJsQ7VnOuyYVHu6GCyjqjwP/8aua5EMRM/rdhwjcvxRhOg3wBTEjHZQY9jGn/Wdx2Adl843drcWRooMhfEr5Ej6uzVBZxBGxAmyVyNa628jyPZ4OfgJqqXeXNKplgxfnqy1jGWf10Sq/52UXPTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7626.namprd11.prod.outlook.com (2603:10b6:806:307::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 16:46:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 16:46:06 +0000
Date: Thu, 16 Oct 2025 11:46:04 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 02/22] drm/xe/xe3p_lpm: Add support for media IP
 versions 35.00 & 35.03
Message-ID: <qldcakjrxt3yjnknfvuzq4exh276lri5pn6akffomk6pgkivui@bs7b746i54mi>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-2-b9189b3056a2@intel.com>
 <176063115926.2362.9050946848447442178@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <176063115926.2362.9050946848447442178@intel.com>
X-ClientProxiedBy: BYAPR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::47) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: e51606b9-2969-4bb0-95e8-08de0cd3805d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P380vqFGc2xUVz0ybPaRwVwMq0xLIzhbx6oCVoq63noET0018ke2o1P6r7O0?=
 =?us-ascii?Q?Ft/VdnxlOhnIsWzUa9jGRrfG0D1R5AvvriLjMbIZkzRpLBP6saz6pGrxkWgM?=
 =?us-ascii?Q?7z5rTUwgK11XSIQ3469kUaH6WpB1xFyHC9ujOi9EkBCoSna8Lyw0ROBfP6pK?=
 =?us-ascii?Q?1Q6935+iDaCYKdFOXD7OMWlocu+hIrfSJlJTzzzsFsPC1b+uxeSjgcRv+wNl?=
 =?us-ascii?Q?DVpbFiib2EL5oB0nWgBo7+Jf8yHp+XThy6v9/Ptx4E0DxsR4yt/iEKErOk/Q?=
 =?us-ascii?Q?4KUDWfJad8ggSza2swbuxmQ/hKLkqncDE2odCNMHwwv6EnBylmtgmk8Litdo?=
 =?us-ascii?Q?vY9M2KWN+75PCOq+kiLJhAOwTW2TEJexITlkrCJsjTYvf4uLcIJlCzmwkSGI?=
 =?us-ascii?Q?ZG4C9scfhzLdkBuhALK/WmFtP1Q2YsWhXNr68RwuTo91cIK71K94MVjyQl5P?=
 =?us-ascii?Q?dAAqeLUHmfl/EfZ56bE92ZdmGD5KZ/YCnPUSZQ2d8tNt56xWIYkCwoK61L4H?=
 =?us-ascii?Q?phHMTLzojITG7urlhFEi5+2lf1za5/m88i61w2MOH5j7WhlG2FvszBSllYRw?=
 =?us-ascii?Q?naSHUFDdz4ht7+tgFqwd6ZxcSR5NtN51/vzusgvCvSNkHHW+zeT2dyIgyh/w?=
 =?us-ascii?Q?O47CxLS/9M4ZRbK0cNNTpyGNlLJ/X5IztyT3H+wf1RHQSTlxQ/tt3CV0wStE?=
 =?us-ascii?Q?JvNeecZ4yAQyeKSSLxELTcLS4tJeC23nvGMUByfGCZMKXQiv0Cjx0FKRgCqb?=
 =?us-ascii?Q?34s5qoTTKr+IsOE6i9PwaUnX6lOOxxtmvGyw2ZDfpi9p8pGSQGw6QcsBfUNN?=
 =?us-ascii?Q?JPe2bXJ61APC+UX29JmLi7sF6JxFIvjxf46iA9Dhu6CoTFD23qOkWUTVpsLV?=
 =?us-ascii?Q?5usQ3qca8qDyp2MVQcgQpbl/3LdyqYksjHc72DHxjzbo4pjvJTrV7143uoiw?=
 =?us-ascii?Q?PBFMcuMkYpkbizfHreJfWqdpphNFKKtgUgOUOKRJhXG7l9nnfEqu/8/JDk/8?=
 =?us-ascii?Q?e+W9frtT9sPPvf8VjXI+Ijg8fxy4BK9X+GVvGRAxo8KnRIVejrnf5oTK+P8k?=
 =?us-ascii?Q?kFOJIWjhKmL8IMuu5+u99SNhqbrgjBp2/pSfYen0wASKmUCmsDTKNoJitVAW?=
 =?us-ascii?Q?IgTyfF9IrLK5PymipRhVlUmBAHSURcnoBmPDRCPvzHjdWr3gVU9zHbXF4YSa?=
 =?us-ascii?Q?1wOZjQPfoUfb7cDKra0Kl9/23TSqMwvjy2euMhP+aXBkiOsfabl1nBD1F/Kj?=
 =?us-ascii?Q?sIhyUZsr6B1YRYYoiBjYMFt7ikBtcl/h89hCwX/iRqT1JB8C0Jlelh/MUIhi?=
 =?us-ascii?Q?MhKTwoHuSfdF8j5utJBtjpfyLv9blMfhgNdaxefePi+4KySX69L+SQW/XaBw?=
 =?us-ascii?Q?87kj7eIu20V5wQ9L1cXN5LebjL8/GXKzHjabfWKg0ajrQL20r4iLmwXRmsbG?=
 =?us-ascii?Q?IY3m7wgAr2vMiYR7Efm1+sFESMQbMeEk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2whNBnD3oM4r9qbaWfqvHghlh0QCjuHCpmOpCBxBzbxKo5bHNooB/vv830+m?=
 =?us-ascii?Q?cqqfOm4KuJd1qKNsoaq1JRpeNkyrsznGOxdf9Gajs9yQacKUGvznKdVsvtP/?=
 =?us-ascii?Q?ZW1mdEyPl8obPxtoKsssItNBGO6ZKRES1VRUz+HesuVcrspf9P/VejHfT8WE?=
 =?us-ascii?Q?HPBJkStA1Yz7NDiz5rvMeEQrm2kt9ZouAlg1b6FFyE6zqZPmXTf0Q8YYUvJK?=
 =?us-ascii?Q?JxaPjKNTyJ08kHJlqernk2OdF+vD+Kz370xrXBU3fW6+mLsnLm5z8iVVLQnZ?=
 =?us-ascii?Q?lPfF42lGDqkC7ka9OOdTvPgigUtxdph/7xo3wYzZTDEvVuxOV9rCsBrEDQG7?=
 =?us-ascii?Q?BWzNr61ZWS2IrxjadG78EOB7gTWfoWh7FfsAI2spbSNc8QrZWfOsvofuO1Ol?=
 =?us-ascii?Q?9suXCkQJJK68QpVLBN1cnLSBFYdXm7461qJ1sR7/90ZdukyoXBsxVVsARKWC?=
 =?us-ascii?Q?SUP3/ZS2X+ol1OxGD+dZfKIEdIIKr/1p1uEftRHFAITvhxSfxxBtzQvX0PTB?=
 =?us-ascii?Q?9o92lQyv0RIFIxIUs1W/axxZWUiVoDmv23rMswT2OFolIzAApUJjHgXENldi?=
 =?us-ascii?Q?zM9tI9RtNk4bvZ62Rre5x9V3OY4XM0yKGwd9OiYeM5a8Xiy02DZ26NZqr4vs?=
 =?us-ascii?Q?ua+Z25F7pk2UMwoPH3FTwoOn2RZNanAlsPHKIHZv07c6u0xdcJzVdZ4THId+?=
 =?us-ascii?Q?lywlI5UuED8U8NFWs2aF3X3u3WVaSVfec1ZAGd4w7gQftO7aR4S5cLRYDbuB?=
 =?us-ascii?Q?AMPHZZXcQwcg2cgve/rPXDOXoa7qNIV+dxvZANKwzJzHFbLi6+Inbe21aOZn?=
 =?us-ascii?Q?d9BoO9ZG8tNJC/bOTaL+599MlFm/mv6/AfQl6Bo2p89ca0FFnwn77UjjBbRq?=
 =?us-ascii?Q?ZaJ3tCx992Y66pkq7kbxNrQBUvIyQEXynSNCjTmc/fHuR7dA7xWxzEupVZhL?=
 =?us-ascii?Q?9kNH07XX1GxWaypI7eImocSehcA9kKiKOL2JsSZJW+Zg/ZQ+ZGwxQazkAEed?=
 =?us-ascii?Q?r5XBHiFiM+LsUweB53gie+8VKaJl9Nxe4IJ1wlqVbZaxLetXzkK1o2BGDine?=
 =?us-ascii?Q?ihAmi3diQaPrt6JRLx1cTlnmh3vOla6YvL2Wzpu+EFTsCOHzRDAk8Wzh0zQd?=
 =?us-ascii?Q?VzgUvCNvx3UsLUIYGW4Nps959SRRJxY3Va4EkY4Tm1TbAxh7APkcZ8rTcYj6?=
 =?us-ascii?Q?T2ceW4hvvsMWQXNqF4gBcZVRBZFdIlJBPNf9LLkgsPjzU5vCFze6iMu6LUmT?=
 =?us-ascii?Q?4pzPtPL3H0fAggG5u2vu3aWmueF2sbFHjqZHYCVZrCjxI7hAKiblvLLlGPgb?=
 =?us-ascii?Q?yaX+eYKrdQoAfPXBMdqcyP2UhvpGCnKNL9yTJibUBUZdaJ448sQEDeQXm4It?=
 =?us-ascii?Q?b5samc+YY+kMCAwBhkmEAdM76Y+Trr4yRJQhpLvR8Pruz129FX6Z2/5QdBaw?=
 =?us-ascii?Q?V4qvDzXvyrrynPBhTmF9ucRb3N6MBc+KuYlcTuLvVWjTdthKoiTPLdZN4Maw?=
 =?us-ascii?Q?uXj4LF4ztHmBrACz9ewubXWIVF6Ulku2N0wb3h4pLFugnGHWdSOoAJ5hTaYJ?=
 =?us-ascii?Q?adnepwLxbszmeawobmArkZ0gSRsDafWPTpf1zqA2XAHW3PdrWg2UOqy8G9+H?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e51606b9-2969-4bb0-95e8-08de0cd3805d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 16:46:06.5748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tT+ZHePHluokvj3ZrQSS5jAWZA7dMUUWV1PEluGKcY1AGoOkl/W5v4+pMsq/9vDD5QM+6q7uQi84aVPMANM3Naq9iunNJURDOeDzhu1vB28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7626
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

On Thu, Oct 16, 2025 at 01:12:39PM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2025-10-15 19:06:17-03:00)
>>From: Shekhar Chauhan <shekhar.chauhan@intel.com>
>>
>>Xe3p_LPM is very similar to Xe3_LPM on the kmd interface, so it can use
>>the same descriptor structure. Add both 35.00 and 35.03 IP versions.
>>
>>BSpec: 74201, 74202, 77977, 77979
>>Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_pci.c | 2 ++
>> 1 file changed, 2 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>index 3ea8ccfcbca55..b72f71b0f52c9 100644
>>--- a/drivers/gpu/drm/xe/xe_pci.c
>>+++ b/drivers/gpu/drm/xe/xe_pci.c
>>@@ -151,6 +151,8 @@ static const struct xe_ip media_ips[] = {
>>         { 2000, "Xe2_LPM", &media_xelpmp },
>>         { 3000, "Xe3_LPM", &media_xelpmp },
>>         { 3002, "Xe3_LPM", &media_xelpmp },
>>+        { 3500, "Xe3p_LPM", &media_xelpmp },
>>+        { 3503, "Xe3p_LPM", &media_xelpmp },
>
>I believe it should be "Xe3p_HPM" for 3503, no?

oh, good catch. I think I ended squashing 2 patches and erroneously kept
them as lpm. I will change this and the commit message. Queueing this
fix for next version.

thanks
Lucas De Marchi

>
>--
>Gustavo Sousa
>
>> };
>>
>> static const struct xe_device_desc tgl_desc = {
>>
>>--
>>2.51.0
>>
