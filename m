Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4F3CCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 22:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F0C10E013;
	Fri, 24 Oct 2025 22:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BqQPAUQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DAA10E013
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 22:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761344867; x=1792880867;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=viq/M84ArSfpI8eqQvTxievj2HdIOTtGdjgtd5RXzDg=;
 b=BqQPAUQJER//Wx6bog30HMvzWW0T3QreVaipSd4A2TJH4M9lkbkW+cDF
 rJV7nMhMbB1HaIpZltiglR+tCA9IYE8TFptsDq3UbdmPD5LtngLHsgJh0
 B/1+an5T9HcugRC6MOKkmeL1yYZXOsTzOtZgpv0JbBRagni3yqS6262Wr
 cWgGKE4pMhjBzwR63EhCU1vX4/vSVSjTMnFX6hZjzZcIvntZJHKKc/EGO
 C/0sDIRC/UBxJyvszUPS54/NW6bqyTIniybrzI3EUeu3Afb7/OT2Xb6Ye
 gjcgn8IDVbjelcLlu7L+6k+J9hy3jLGFYv1xAWL02JHv+jeuFQY4rtZEI w==;
X-CSE-ConnectionGUID: JpSBmw2jTuOWbRkh56uwNQ==
X-CSE-MsgGUID: y5BipVcMQUmLcQbAJog5Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62737569"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="62737569"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 15:27:47 -0700
X-CSE-ConnectionGUID: +zvY/ewdSMGXcOTrvbkfsA==
X-CSE-MsgGUID: jYu9FgZqQb2LqOTfHdnCNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="184605976"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 15:27:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 15:27:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 15:27:46 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 15:27:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4GapMR5/M8K34BYOuaYQUND1We7xjYYnCkTOzh3N/8chRbzk3BwT97j0KCPpvoiTJFZr7JipMQpRD2jBCXhRgDOI7/Yu56BCuD09NflsGfsyhYrZ7QtSTCkaW1Nji8H0HDBsetBxJ7Pd84Mcw5k01sfRHMGF1zOhhY87lc+JOpIOBD6P/InDsBZBHUAlsF7bandMnxTDngnc0Ak+uSCNow7Vq/8WO9+zOpup7AbHkHFlCuCpxzqCZNjKrFI0vlkenR9HoKPerpUHMZ+D5I/qHtWb7LejfL/Vb1PZTpfNoMniqxGQKxNQWvpH5YJuv01N72DLb5CU2J3o7RdZtiTBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nacNZdX+MQaB1wll6hceotLcyVrpUoq+qItGo3kQ1v4=;
 b=Ai9lmO55XIOIrQYJC/BGd1GSmNmkWCIvD0tFdIgQK/Vmi5MMJzgQF5mR7Y/lCm6dtH0jmsYyaiiC26I5kfJ5DtKhJRqgCAaLqLThjZibFhRE3Nfj9bYSL5tWj6IMN8KDTxAoebA7JEJltQrSv3B0JHoGIeWTm9Hym6rc0wMWouJmMhyQ7jNSPbHVL1JDokhwvUAlB5of7udNlGNeshWiPhO8f6PtVKxGhqa7Nx3LwB2OpuAReZbKPO5GkT/JnCny0JQ2qkIpZQ/rfUkD54QrLHtMzpTijc3Xijz35LhcIPtDjR7M718RmC24X5PmT1WtNyf+2fONm51qsjRgmSxoTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6283.namprd11.prod.outlook.com (2603:10b6:930:21::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 22:27:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 22:27:43 +0000
Date: Fri, 24 Oct 2025 15:27:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Access VF's register using dedicated MMIO view
Message-ID: <20251024222740.GM1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251024205826.4652-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251024205826.4652-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR07CA0056.namprd07.prod.outlook.com
 (2603:10b6:a03:60::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: a559300d-f746-4141-8d22-08de134c8cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTc2TjZHRDhZdHRkNmpQclk3Q0hPdUVSY1hWaE1nUzJ6dFdMMWRSdUIrTHZ2?=
 =?utf-8?B?dVR4S09GWFQzclVKUXQvbjJUVjVuUGxaREU1bzVFK0QySFl1T0xpb2Frekti?=
 =?utf-8?B?cm5KR3lTOUZXRVNXUkRGYkw0SG9DQldFL3NMTnpHSXltTkN6TVR0R1ZPUFVa?=
 =?utf-8?B?MElEWno4V3BxNC9WK2xBa0hRejRhOHRRUHM2bndGbldKRGswOUhQbFJ0dnhL?=
 =?utf-8?B?OVgyL1RZeDNMQjU4dmxMU1pwVlNjTVNlZklEMElkUndDTy9KQkJOWkIyV1Vn?=
 =?utf-8?B?cVZmdWtZT0pzR1BFRDlmNEUxQ2c1Y2pEK0VZckUyZk1jUnZHT1RuTU8rRkRD?=
 =?utf-8?B?dStnQzRkcFRtVWhvRGJzY1RQQlFSUVhvVHp6bnhsMkl2UVJhK1Z2djlyczJK?=
 =?utf-8?B?Smxpemp1cjk2RHNpUm1JSVhwL0l2YkhpazZGbVhtN3Q0ZUd2ZVNWME5OV3JD?=
 =?utf-8?B?ckNzS2JjZFF4Q2g5c1JVcms3RHhoeVZocDVUakw4ektkc0hFVjFqU1F3T29T?=
 =?utf-8?B?ekp6SVhCQmEzUFVWLysyZTVKQkR4Rkp4dW82VjQ5QVY0UVZqQU53YVhYSnph?=
 =?utf-8?B?RmRxYWxIZUd1ZXVQa2NMekZ2Wkc3M1pmZS9kRlVCOG9yTGxzcEUxSmh3eXRL?=
 =?utf-8?B?dzRidEtGNTA3MzEwSlcrZ1RZVHMxaENsUkxibFdVWFRGTFhRRUFUV01PMElq?=
 =?utf-8?B?elo4K0FXNDZlT0VLK3JxelpFcndKUGhNTVdYNWhmSHVJSG54YTVZYmlJSXp2?=
 =?utf-8?B?WjJDRVZyUlBZaXNjOUxzSGVtVE9nTURuOGJUR2VXcDNQdWp3WEZ3dFhvb3Zs?=
 =?utf-8?B?KzMyZEVIR3MzajVNeE5rYlhPWnlPb09xNFZJbmtwMEpSQ1krSUMyakpkRmxJ?=
 =?utf-8?B?N1p4YlJOaE9GZVNsb0dVMUxZSEJON0JTUDY0QzNFVzlPYUhMd0FNNHVZVHJ2?=
 =?utf-8?B?dTB2eHpkcnJUemJ2bUpEMmRlMTdpNTVkbytmRjE2U3FOZXNReDUrWkRmY2lC?=
 =?utf-8?B?Nmd4WTNvYjM5R05YaG55TTQ2NllBaG1QU3I5T3BXSldqc3U4L2hWblVwQ0xk?=
 =?utf-8?B?L1dsekdKcjZuSWQ5QWcvcEJmNnRaeHhUSXFYNW9OV25SL0JEN3RWSnJsSzRE?=
 =?utf-8?B?dFBRRWlQaXBiQ3I1YW5KclVYSVV2SkcrdSt2VG5aUldCazBZZFFsVHhJY2F0?=
 =?utf-8?B?QlIrZ3NtSThRcngwdVNPYjFVUThrd1FzYWdxU3Y0QXBzUnQ2N2NJMHNYYzNu?=
 =?utf-8?B?Y2plR2Y0MlRucEhsdjNvK0w3SFdtNUlTQnhlKy90MXpWUlRyR2FZd0VXV0RU?=
 =?utf-8?B?Uzd3L21rNHhwYkpNTC91SmxlWnRNb3NMdm9TaENtdzJBZ3ZMUk9mSVg4SHds?=
 =?utf-8?B?Qit5YVN2MHFINHM5U0p3US9Vck91THdVcTc4THRiMUloOHhLNHF1UmZaSVFa?=
 =?utf-8?B?M21aY3UvTS9rTjVVS013VDRjVXY2SHpWYWhHbDRjdVNqemtxSlhOWndERmQ2?=
 =?utf-8?B?b3ljRUFJNDdodTNLTkE5UHZGcGNjL3ZqaTRxVXp3WHptbHIrUUdlYytBTjEr?=
 =?utf-8?B?MzFPbHBsZS84VEFFcFo3ZWRydW5hZEF0dHNERS9EM1BzZGhaL0NUT0lUSUdW?=
 =?utf-8?B?TmRvc3YxUkUzRys4NDRuN1d0cG5YOWlhRzRScVVGT1VGTTZ0MUp3QkcwVDI4?=
 =?utf-8?B?RFRUWEhzb2xhS3FOSlZWVkg2eVdZVTROdTRJc3YxdG5YY1cxMWpzYitONlND?=
 =?utf-8?B?b3RuTTY2Q0d0UVo4a3pRTWt5MlhlOVczMXF0Z1ZZeE9WTHVBSnFGTnlwb3I2?=
 =?utf-8?B?RHhTaVNQR1AybWJXb0h1VnhQSFJEQ3V3eVFiVjg2aHJVNDc2M1BRZXZ1QUZp?=
 =?utf-8?B?ai9jQ3JqZnZmeTViN2JwZXJ2V2JNeWFGcUtnLzFsRzAvS2JTdmdZdW1iemNJ?=
 =?utf-8?Q?US7Uadq0u6GUmW6jY5W2wG7qJm3OEjTH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzBiS2duNU9PbFNZaXJZV2RTZ2pFeTc5bnhxRzR6Q1Z3QTBRcnQ2VXZXQ1Z4?=
 =?utf-8?B?RHY1NXB3ZlpBTHpqUVA3NEFkbFFmZDNHNmxvcEZpN3dlQ0dpQlVwN0NlbTZ5?=
 =?utf-8?B?K1dseTBvcGltMW4wK1VtOVp5c200bTEvazhXY3lualgxOXhCR1VETS9OaG9M?=
 =?utf-8?B?Vm1uY0VieFJzdXMzMU1ST0k2VWxJTEFtWXZrZjNWMG5HdGhkRk1GUmtVUk5D?=
 =?utf-8?B?V3pNSVVuUVpxTlNkZVRSQnpVbTBmM2ViTENlRlVzVGhHdFRmMkppRWVRd21C?=
 =?utf-8?B?T29OMzh6aGhydUYyUmh4ZEtnSzd1TkREWlVkSTMvdmdLbmxiRGZ3R29qMXlx?=
 =?utf-8?B?V3VIaEMra21DVVR0U0hudnJhUnNFRUUzVk5adFBZNU5SUjRzSUUycit5UlBr?=
 =?utf-8?B?OXUyb2QzZmx0ZG9rMFR5bHJ6WjNZaDdHbnhZZlNiM25ETXh4SSs2c21CK3hL?=
 =?utf-8?B?cXFzNDBHNm5nVngvWHhkenRDOFE0YXMyRmo2WE1DaUJPR2l4VURwcmROYmg4?=
 =?utf-8?B?aDNyZUl3aTM4L3NKYjNveTlCc2FXa0ZwZ2MyT0dvWkhKTVI5RXhpWEErRU5N?=
 =?utf-8?B?Z1ljcHRjVEw2dnJVcmRIWmdXMWhUQVJsOVdqZ1JyVFl4N2k3a2JqUDNoanFz?=
 =?utf-8?B?dDRFTk5pZ2VkNWprVWNmRkZKUEhxRGF1MUg1TVdnSHk0UUF3TGZKWVgwU2tH?=
 =?utf-8?B?SllhRmpJenpOYjNYTGNEdXg0UjhIQ05zUlRCL3VueDkvRFVBSGRyRU1SaDlP?=
 =?utf-8?B?WENuTmM3NTFGblpVeDVPSVA4OE1ONlRiWDNzMlBZR2xJaWdRcW1QTkhHTlBZ?=
 =?utf-8?B?SGpCUVFZTVFVeWs4bVJVeXRWQzlRQXhaNjBJTG1MaGtNN29INHRRYjJrQm5z?=
 =?utf-8?B?M0I2OHBvam1JU3BuRER5eEtMcjV1bERxUmRUMUx0UDZKa1hqSlg5RFo4czZu?=
 =?utf-8?B?Mm1MUWlvSkJGbEZPQlpMcGo5OW9nQ2Z3S2JKQTdVZ1ZCaTV0ZnJSQnNkNytS?=
 =?utf-8?B?RWx4QXIzMEpWNEFySFl6VktmRTdXdDhhQXlnZTUyVkU4YlhQVEtpMVN3LzBs?=
 =?utf-8?B?WWJaOTBSN3UwcjZmNDVmaU55dXVJZHJiMW1LK2h6Mk5ZYXlwTDhPRTc2ay9J?=
 =?utf-8?B?cTRvbDlTU3NISmRkNnlwWTl4bnhpdTJadTVGcDF6dlE1WFE1RUhDUUlUSG5C?=
 =?utf-8?B?YS9DZndxSWJVWG1RUXpyRGxOSnp1RDQzRm8zZXNUZWEyUTdNalpNelhNN3Qw?=
 =?utf-8?B?UkNyODlGU0lyajNTTzl0S1dJb29nQWx5NkREenpxd3RmYTJiVW9IUXQxTG0y?=
 =?utf-8?B?VnNFbmdvQ1pjbHRNOEYwblRrcnZtU1U1MEVPTmVwTlBaSmxxSEphZXc3RFlx?=
 =?utf-8?B?Q2RZTVl4UHdyTnhJRkhUUHFoWU91YTkxait6OXUvY0UxTlNqeWY5enRYcWZI?=
 =?utf-8?B?Sy9kRitXNW9naE5wWXI4Y2FCVTdhdll6Zi8yUlNNajBCeG1mNk1QWS9tbjEw?=
 =?utf-8?B?aGpQYjUwNXIrcG8zbzJybHVPR0VZeUZhWU43UXJvOGV0aFdIU05KS1RZVUlX?=
 =?utf-8?B?aUZRV2RnOEl2TXcvUzI0bTAvbm1wbU5JM3hHN2xzbGQyRWUvRnpuKzEzTzVy?=
 =?utf-8?B?cmN0c1FjTGdQWnZCZlpXdFEzOHN0dVpZMnRqZFZMQlp2dTJnVzhXcm1BdVRG?=
 =?utf-8?B?WE1IRE5QZzZidVU0OXlucWRrSXZpcW84RC9hSmxpREFEQzVkZUh4SkRRODJM?=
 =?utf-8?B?SzNnS0ZkUnhKcjdiVml4Q05DdkMxRjY0VWlNVEg5emRueVBTdHk1NlpPM1Jh?=
 =?utf-8?B?am9PdHVxaGtsMkJNWmRuWjN2ck4zdWVyYVRpSU1CK3hrT1d6L25mbTA3MTUy?=
 =?utf-8?B?V0doVUpONUdQdU5wVFNDejhPSkQ2dFFmZXZkMHR1YTc2QWhFWXdyU2Q5ZGNj?=
 =?utf-8?B?VXpIZkVwMUMvcHlCZUVCYTFmc21ldTJpRGFOamR6MTBxdEtUVDArOC91bFpz?=
 =?utf-8?B?eG5EdGxqMWZ2TzFETFU4MlhhZ2FnWURPL3lsSEduSGw1Ym1KNmdJQkxIS3NF?=
 =?utf-8?B?eWZFVGJ0bTBUL29QdVBUSEZEVVFlSzdQUFVlYzMwL3oyWW42YlA3T0dCeHN5?=
 =?utf-8?B?MzhLVzRERWpBUjFtbmJ6WFJDa2UxL2t5UVZMeVhSYW81SUhYb3drcFdUSHhJ?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a559300d-f746-4141-8d22-08de134c8cdf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 22:27:43.6474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZHybphqIi6grlNL6axIG5Tn0cAl8rKqhkUGQ6vm0ICX77IqXBR5vyqwVP7yoQ5g0wI8K17EKFKE8hosvuKcsh3qChaS/fEr/ylj74TDXqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6283
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

On Fri, Oct 24, 2025 at 10:58:25PM +0200, Michal Wajdeczko wrote:
> Instead of creating ad-hoc new register definitions with altered
> register addresses to mimic the VF's access to these registers,
> prepare new MMIO instance per required VF, with shifted internal
> location of the register map.  This will allow to use unmodified
> register definitions in all calls to xe_mmio() functions.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 36 +++++++----------------------
>  drivers/gpu/drm/xe/xe_mmio.c        | 29 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_mmio.h        |  4 ++++
>  3 files changed, 41 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index c4dda87b47cc..0714c758b9c1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -158,39 +158,19 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
>  	xe_gt_sriov_pf_service_update(gt);
>  }
>  
> -static u32 pf_get_vf_regs_stride(struct xe_device *xe)
> -{
> -	return GRAPHICS_VERx100(xe) > 1200 ? 0x400 : 0x1000;
> -}
> -
> -static struct xe_reg xe_reg_vf_to_pf(struct xe_reg vf_reg, unsigned int vfid, u32 stride)
> -{
> -	struct xe_reg pf_reg = vf_reg;
> -
> -	pf_reg.vf = 0;
> -	pf_reg.addr += stride * vfid;
> -
> -	return pf_reg;
> -}
> -
>  static void pf_clear_vf_scratch_regs(struct xe_gt *gt, unsigned int vfid)
>  {
> -	u32 stride = pf_get_vf_regs_stride(gt_to_xe(gt));
> -	struct xe_reg scratch;
> -	int n, count;
> +	struct xe_mmio mmio;
> +	int n;
> +
> +	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
>  
>  	if (xe_gt_is_media_type(gt)) {
> -		count = MED_VF_SW_FLAG_COUNT;
> -		for (n = 0; n < count; n++) {
> -			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
> -			xe_mmio_write32(&gt->mmio, scratch, 0);
> -		}
> +		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
> +			xe_mmio_write32(&mmio, MED_VF_SW_FLAG(n), 0);
>  	} else {
> -		count = VF_SW_FLAG_COUNT;
> -		for (n = 0; n < count; n++) {
> -			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
> -			xe_mmio_write32(&gt->mmio, scratch, 0);
> -		}
> +		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
> +			xe_mmio_write32(&mmio, VF_SW_FLAG(n), 0);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index ef6f3ea573a2..350dca1f0925 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -379,3 +379,32 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
>  {
>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
>  }
> +
> +#ifdef CONFIG_PCI_IOV
> +static size_t vf_regs_stride(struct xe_device *xe)
> +{
> +	return GRAPHICS_VERx100(xe) > 1200 ? 0x400 : 0x1000;
> +}
> +
> +/**
> + * xe_mmio_init_vf_view() - Initialize an MMIO instance for accesses like the VF
> + * @mmio: the target &xe_mmio to initialize as VF's view
> + * @base: the source &xe_mmio to initialize from
> + * @vfid: the VF identifier
> + */
> +void xe_mmio_init_vf_view(struct xe_mmio *mmio, const struct xe_mmio *base, unsigned int vfid)
> +{
> +	struct xe_tile *tile = base->tile;
> +	struct xe_device *xe = tile->xe;
> +	size_t offset = vf_regs_stride(xe) * vfid;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid);
> +	xe_assert(xe, !base->sriov_vf_gt);
> +	xe_assert(xe, base->regs_size > offset);
> +
> +	*mmio = *base;
> +	mmio->regs += offset;
> +	mmio->regs_size -= offset;

I feel like it might be more intuitive to use adj_offset / adj_limit
instead to select the appropriate per-VF instance of the registers and
leave regs/regs_size unchanged, representing the underlying iomap
itself.  I see this selection of a specific VF's instance of these
registers as being similar conceptually to selecting which instance
(primary or media) of a GT's GSI registers we access.  But this approach
works just as well, so I'm fine if you want to keep it like this.
Either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


On a slightly related note, I do still have plans to add optional
allow/deny ranges to xe_mmio structures that debug builds can do runtime
checks against to ensure an xe_mmio isn't accidentally being used to
access register ranges it wasn't intended for.  Probably not super
useful for what you're doing here since the lifetime of your xe_mmio is
a single function, but I think there are a lot more uses of xe_mmio
coming in the future, and that will help us catch mistakes in CI.  I'll
try to get back to working on that soon.


Matt

> +}
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index c151ba569003..15362789ab99 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -42,4 +42,8 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
>  	return &xe->tiles[0].mmio;
>  }
>  
> +#ifdef CONFIG_PCI_IOV
> +void xe_mmio_init_vf_view(struct xe_mmio *mmio, const struct xe_mmio *base, unsigned int vfid);
> +#endif
> +
>  #endif
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
