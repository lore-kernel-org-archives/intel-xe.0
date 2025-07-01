Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6B9C7EE30
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 22:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079B810E64F;
	Tue,  1 Jul 2025 22:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+NxdjVS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B073810E64F
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 22:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751410552; x=1782946552;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UQQVRk6cesVMbBthFETUmAkQq4GwxxO/+r5gz3/hwPA=;
 b=l+NxdjVSUunGA7uEPqQaB+6LsfrE5okASU2bCh4Yor1L3OZX9LVDoYju
 BnhIWyhU2FHY7D97L+c8UwVTjVF8TqjbCljPTKcHq3Qz0WwydGyg7G+/L
 gxuixVHCuUhB4PcE2g2efviK/Wq2W3546VKOKBpsor/kUInsWUYIU46xu
 IodDYtrgUBvHffbH6p3O+qwXf5fYCkP/4TNvDIoTdsQVUH9ihhTMxgyOG
 lK1OGYDaW4KLS+CQRlHMHSIIwnpMokqaLv0vipngwLxZYNwoHQjzG85p/
 kZYVIpEc3Ko7OsV1DvbZBUkg2yiSFrgDdtyg7EWv0R1cWD9lc1MO2/ij/ A==;
X-CSE-ConnectionGUID: or/D5VUSRmudCw8En3Ut8A==
X-CSE-MsgGUID: woXLb0RWTa6bqqaHyiU0lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53782585"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="53782585"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 15:55:52 -0700
X-CSE-ConnectionGUID: +ctUkL5ZSyWT0oJHqr54Pw==
X-CSE-MsgGUID: NuidScw/RVKPMgmmpTHSDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="154056946"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 15:55:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 15:55:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 15:55:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.83) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 15:55:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rb36anT14LzpE9CkUpnoZE8ODOvyjoreAOYLZqmdmg1lj3LGQ9KAwQJI4NgYEMcl+olKLw1FVNvUBPazkV+dQ5IRH8Uu/eNwnczDyGYnf9wKCGcrPfQszQJcbBJwftIv8qekcA/ZWm4IzbvQUdKS8NJyP1GZErDzkGbUecq+k3zzyi42fvT2+u4t9oTe7CGXpDGaA5FJN4QuN69eWsH7wBGaNLeiSLyl3UDzo00ASxAXYnhbZEdrqAOJLsg363LvtwyOeO1J5lnFZT31n5VjRWYeJx0HTC6Kax1ePLTD4Iw0RxNGwZcAid8JX9qf5KCvgZF6UceF8AjtJKMjWXdeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tv1I3KS2mGRyt2SGG7n7OCrPx6nLlpDT9A2mCV9olJM=;
 b=lfV1Q2qrDeUNKAn1PRYY5nwWkIUYG663eQJY+0dwXYsjuMniSPo9kt7RrUPDP9qE9t6i9pRVYQX6Dz+PQ7u/+frU698Kt1WB6dpqKNlDa/L3/se5SS8eYNfRgGBAw8QVTS6V8bkjPEsHkCi3Vpp6wKvTeFfYEZj2woTDwPXdMQo9GDSMSwcJbNAtdbARtRQVd6qOVa7OpWGoQHZwFoTiUoHcSgaA2LyLtQ4WUPWRBGqJK6idN9sTVf/xvtxBUVYt2csYs9QfU8f3l6VvUJhYaDl/ySQB8g9rw44YjqBURT1nG56xj0yk87ENOfsJYEPj3N/7V5bkEiCF0YgIcFVsXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6104.namprd11.prod.outlook.com (2603:10b6:8:9f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Tue, 1 Jul 2025 22:55:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 1 Jul 2025
 22:55:48 +0000
Date: Tue, 1 Jul 2025 17:55:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/tests: Add legacy IP descriptors to param
 generators
Message-ID: <qtzn3rwxvu4yoi7oxfpv34auqwenqxlfhfjqoxi7jfdzqapkxp@zrgntsdh7hiy>
References: <20250627181110.1436-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250627181110.1436-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:254::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: b53cb334-f323-4fcf-236f-08ddb8f26b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jq1/r6N8QjJM8S5mkIx18on+nN9oQYedrLGO+PJJ4rQtsxfPchRGt7fsRL/+?=
 =?us-ascii?Q?oW69evzz2bLk2ySEZB/cHVoOyeNOll06rWNzDzhlvx7cWN4ieJtqXRatL0A6?=
 =?us-ascii?Q?W8lXNUkqnvr9Cx5U7TunbNusycHs2wyFBlyyxs5I1d5T3Pm4F7AglCUzimM5?=
 =?us-ascii?Q?eOv+/EtZBrHDsIPInuPiclrRzQ4njXaWnAL0y826CZVdBbyKtpJcDh3bLNh7?=
 =?us-ascii?Q?LJzzbThAJOY6BuE4MDuVMmixLMD9CVLbZ0Jrm8itBu6097OcHxi7HkWGbdRH?=
 =?us-ascii?Q?2KKsKAIHpzaSLRdVb/jnRV3Xwllccbvjsam51qa/5wXUINWuY3XnaQExSAcQ?=
 =?us-ascii?Q?pv1vV7z1+L2ih6ZJUsrg8Ed8Ld15GvOalKD2HqFJkbmSEtu1EM8/oJxTGthG?=
 =?us-ascii?Q?ohfmbt5HeoTYHgqD4Z/K94R2Zf65kfBCDFlPyHTqXRL0q/2rAbm0PrTt33de?=
 =?us-ascii?Q?dGNQ4bq43XLR5bOBQrbQEWU2T+9P1Bdi9Y5FKeidMN4NyfQbI8YLt5fqu04l?=
 =?us-ascii?Q?M+lTPG0CSf8j8wYYkkbh97LqKtmgGP5hvcwp7Ah5VYw5B2uDL/FsaOYT2LV/?=
 =?us-ascii?Q?142z95mCm6Fd24c5JjVpN4mbfQrq1jLBetKt4Gu8P5O5neXlabtef2lu5a0p?=
 =?us-ascii?Q?nDxZ8Uvov1A3DleVIHOxKy504LYtz7KiyfFrRzy80qtExjCQOsY1KcN72FgO?=
 =?us-ascii?Q?C9vtC48t2iUBQgbCKhofZ6SB+CMSjORbQcJ1xxtFI7Q4sTgDxoCwYqKPclW8?=
 =?us-ascii?Q?59B0M9JGebcaJO4aYKqmnsW2+RYbgEpYcILZgssjWJBts4KLWLzH4j4Molgo?=
 =?us-ascii?Q?cclGxC/T2nhYdxnu+mwh29v4u3XhyFNkc8DEJqFcRGmuPfi8y9O6cq0xg0ef?=
 =?us-ascii?Q?sTQa76cSviTCeXiv1/0nrf7L1fyRiqsd2OYDGfiYpdQ5LVw/4Z0CAwoSTHGD?=
 =?us-ascii?Q?TsZkAN9Ri20AwVff0W35LZZu3cwtfRKeyAPiJ817tTOGQ/Z9dAJUZZ0jzlmQ?=
 =?us-ascii?Q?e7EIgwJ1Ja/0493tSvdPikKMihlMebzAYGDHB37rn5c7e/xa4bC+cqqaBqz9?=
 =?us-ascii?Q?0Is6f2I7E3XMx4eE3Abm6SqwHDcAeHxK6CugEhW0s+L+IT/fqpR4nUV5y7+X?=
 =?us-ascii?Q?cD1cW2Cl902vPQ98/OHzGrOSzOQ+79ZomIWxTNmTHIy02VQx3P7i/397Okyf?=
 =?us-ascii?Q?JCEZEp6hsPiHhbVBGVw+El2HIekSKgWEHe5kJINc0QboYsbHra21Qr2pK+Y8?=
 =?us-ascii?Q?1WTThqm+WSnYgQxZjaw9lyXeTxfzFMoIxNz9uDSfPqQY8WPOjkl0CiPxDpU8?=
 =?us-ascii?Q?nmEZnpLpr4Hf6zy0pg6lKYWPdwo8RN28Moyllxp6s+MNoy+KI3EJwUxD0Aon?=
 =?us-ascii?Q?BRA0zQIp8qp1akUfXyACOzauXEHZJklSn9U19RQonmAiYpFnrtfiaAUg3TNv?=
 =?us-ascii?Q?tLbFy8ez/Zc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vx4zUDJRkPH2kKt7MwtCVRWccLdQpZsYm/Ckbe/cxtuUWXUNMZ7crJJGFCjj?=
 =?us-ascii?Q?36bVYmkPAQre/WQO0i7o1NJHWJ0TsEkh6aLQPUWBj1qDkCCQhgUdNOdpiRdk?=
 =?us-ascii?Q?cV+nI/1PI7Vd4BkSGboRTDximG+qFygkky/2Iy/YwuWK2ZqY3cVlKf+HHYQG?=
 =?us-ascii?Q?5n4+jVHKVEGOMGl8KQqzrPl8fJtfnax+aHrBpgByrAxrdHzlR1pT072UF3EW?=
 =?us-ascii?Q?csJJHa428WhCREkiRuYK64GZf4hJi/e5WOwyWKpW2LvwfWi9WTM37uPDs59s?=
 =?us-ascii?Q?Q+g5ev7G0XzYpbGPSI0gTzq+otpRfICg1fXeCu8y1WVhUdhEnbb1ChWx4Hhl?=
 =?us-ascii?Q?fsbjp2wd3VVKZsW5EhzFnliVEwTLqeW9PojKXvAU/rHThjgHxjEYd/ZgoAtS?=
 =?us-ascii?Q?L6ECUOq0DhUbaVVulIaXM1Iy77JwtdlDhVQ0qf5arcRleAaXRQyTmIlJJkiA?=
 =?us-ascii?Q?TqSovQRs4hCPOOfcfMJaDFmOpdUo4QYONv7fKMDXF0IBPTM+GJfI03AaSkg5?=
 =?us-ascii?Q?jPRLqdTzm4SpPSUgE4y7KCWw4qI58BE8WvSmN5xFOB2fGKkkNCjTQZKKN7FS?=
 =?us-ascii?Q?ScRY8x8PoK9/kkHfE0Doa3iI/MwdGJXSMh2pVPEpj4YIJSP9MKhVMzP7d4o9?=
 =?us-ascii?Q?2NH6xUfcGHGfT7iLHEfYVQ+2dY3yNwZeO7LikZhdvoISOg6QOWxrQhKuH7ts?=
 =?us-ascii?Q?aUDUc/mWPlXdhPLyla1R9a5p9jA0vsqlrsZJhxwRc9ygtktVGwH0TH+nxzxz?=
 =?us-ascii?Q?y5LZhgtZWBCpHsVFL9LTfALoAa6EczVxtolX1us6U4O6vyVEaTPBcKLocQ93?=
 =?us-ascii?Q?UJJWuBDKBi40ZbKVLElpA6V7q9q+DiUZXwTvEkzvOulPhFzxUPvx8HKRXRKG?=
 =?us-ascii?Q?D5kyh9/4RsVuKQ2GWAaPCSmX++Hwa3xjUJqQu8UOfUhnU9C/uHVnLzkmM2lQ?=
 =?us-ascii?Q?qjvjEgh+prgpA1e/EDgRlXqcDfPpksLPoQ0NZuM9Sws0LlV6GzvsDwL4tJku?=
 =?us-ascii?Q?2G0x0dhlyKYmPKw8XRm8QuGqaN/i1rVZQwDiAXT0BrnJk1UcprcgkKpVgA6Q?=
 =?us-ascii?Q?SVIA9O23GkhapEXTNCUJwh4Lm+rAnhBUnqEUnOjYLopnXGuhMUWTiXex0Wy6?=
 =?us-ascii?Q?IHb+vxE9UPTyAKrOuwYuQcNjH79r86xA/crKPAv2+1iHBNQPRBjBDvU6kVv8?=
 =?us-ascii?Q?5lwB7NuHmsGqR0kMFo4K851QSUepysm2hfAukpOxinaNT+irJFKXpOPo1lym?=
 =?us-ascii?Q?XnseuDnG8RMYZ19iudQaVoSMFl2aeoAKqQpOVMnhc0ETZffRsRVdbFhgizuE?=
 =?us-ascii?Q?KzzMi1DIGp4k12exPHHXnFkaavwXbnNWTJy4tpBxRKbclOyAOT4VdkvNVO3y?=
 =?us-ascii?Q?rOEpFkJQS+vDc8yNov0V5EnTKP95FVTyRg7k7kuQGLQ3/KPpDeINC3pQQC/R?=
 =?us-ascii?Q?70RcI/eXokPf07Y39p5qVcJNJYrh6pHuiLHOzLtdUmCqzBl8N5K41uaNksMs?=
 =?us-ascii?Q?BOyqMsNw9b6TbA8hmFUrT+NYesd3oGXlg/etZCIWBkoxKC0B2QwCUTpa1Fto?=
 =?us-ascii?Q?qNGePOmwte/IKd4mZi3veYTb66f7EQfW3B6dRjX6yaPJmeomeXEva1mWaS7C?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b53cb334-f323-4fcf-236f-08ddb8f26b44
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 22:55:47.9793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqD16zEy+xMN+j8cMOA446KiQPiW7XF0E9fjXk5gBOgkykLn6Ljh7jwYn/ktVKg0oN/uLKDk1CA86tN8tb5XgclFe2wpg4M78hxEGGNhfPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6104
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

On Fri, Jun 27, 2025 at 08:11:10PM +0200, Michal Wajdeczko wrote:
>Recently introduced kunit parameter generators where based on
>the existing arrays which have only GDMID-bsaed IP and didn't
>take into account legacy IP definitions from pre-GMDID era.
>
>Add test only arrays with legacy IPs (as those will not change)
>and extend param generators to start iterating over them.
>
> [ ] =================== xe_pci (2 subtests) ====================
> [ ] ==================== check_graphics_ip  ====================
> [ ] [PASSED] 12.00 Xe_LP
> [ ] [PASSED] 12.10 Xe_LP+
> [ ] [PASSED] 12.55 Xe_HPG
> [ ] [PASSED] 12.60 Xe_HPC
> [ ] [PASSED] 12.70 Xe_LPG
> [ ] [PASSED] 12.71 Xe_LPG
> [ ] [PASSED] 12.74 Xe_LPG+
> [ ] [PASSED] 20.01 Xe2_HPG
> [ ] [PASSED] 20.02 Xe2_HPG
> [ ] [PASSED] 20.04 Xe2_LPG
> [ ] [PASSED] 30.00 Xe3_LPG
> [ ] [PASSED] 30.01 Xe3_LPG
> [ ] [PASSED] 30.03 Xe3_LPG
> [ ] ================ [PASSED] check_graphics_ip ================
> [ ] ===================== check_media_ip  ======================
> [ ] [PASSED] 12.00 Xe_M
> [ ] [PASSED] 12.55 Xe_HPM
> [ ] [PASSED] 13.00 Xe_LPM+
> [ ] [PASSED] 13.01 Xe2_HPM
> [ ] [PASSED] 20.00 Xe2_LPM
> [ ] [PASSED] 30.00 Xe3_LPM
> [ ] [PASSED] 30.02 Xe3_LPM
> [ ] ================= [PASSED] check_media_ip ==================
> [ ] ===================== [PASSED] xe_pci ======================
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_pci.c | 33 +++++++++++++++++++++++++++++++
> 1 file changed, 33 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index baccb657bd05..c5acee52b458 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -12,12 +12,31 @@
> #include <kunit/test-bug.h>
> #include <kunit/visibility.h>
>
>+#define IS_ARRAY_ROW(arr, row) ((typeof(&(arr)[0]))(row) - (arr) < ARRAY_SIZE(arr))
>+
> static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
> {
> 	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%u.%02u %s",
> 		 param->verx100 / 100, param->verx100 % 100, param->name);
> }
>
>+/* Pre-GMDID Graphics IPs */
>+static const struct xe_ip legacy_graphics_ips[] = {
>+	graphics_ip_xelp,
>+	graphics_ip_xelpp,
>+	graphics_ip_xehpg,
>+	graphics_ip_xehpc,
>+};
>+
>+/* Pre-GMDID Media IPs */
>+static const struct xe_ip legacy_media_ips[] = {
>+	media_ip_xem,
>+	media_ip_xehpm,
>+};
>+
>+KUNIT_ARRAY_PARAM(legacy_graphics_ip, legacy_graphics_ips, xe_ip_kunit_desc);
>+KUNIT_ARRAY_PARAM(legacy_media_ip, legacy_media_ips, xe_ip_kunit_desc);
>+
> KUNIT_ARRAY_PARAM(graphics_ip, graphics_ips, xe_ip_kunit_desc);
> KUNIT_ARRAY_PARAM(media_ip, media_ips, xe_ip_kunit_desc);
>
>@@ -34,6 +53,13 @@ KUNIT_ARRAY_PARAM(media_ip, media_ips, xe_ip_kunit_desc);
>  */
> const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc)
> {
>+	const void *next = legacy_graphics_ip_gen_params(prev, desc);
>+
>+	if (next)
>+		return next;
>+	if (IS_ARRAY_ROW(legacy_graphics_ips, prev))

I don't like much this way of iterating over multiple arrays, but for a
test generator is probably fine. Maybe add a comment on top of
'Pre-GMDID Graphics IPs`:

	/*
	 * Mimic the way gmdid IPs are declared so the same param
	 * generator can be used for both
	 */


anyway,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+		prev = NULL;
>+
> 	return graphics_ip_gen_params(prev, desc);
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
>@@ -51,6 +77,13 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
>  */
> const void *xe_pci_media_ip_gen_param(const void *prev, char *desc)
> {
>+	const void *next = legacy_media_ip_gen_params(prev, desc);
>+
>+	if (next)
>+		return next;
>+	if (IS_ARRAY_ROW(legacy_media_ips, prev))
>+		prev = NULL;
>+
> 	return media_ip_gen_params(prev, desc);
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
>-- 
>2.47.1
>
