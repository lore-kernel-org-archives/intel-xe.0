Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9184CE7AF3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A586D10E143;
	Fri, 29 Sep 2023 20:44:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEF310E143
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696020252; x=1727556252;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Uvr2Evf8yp/wg1y0hzmvV1kqI0Hp6ivFdYlCKShujOs=;
 b=Py3G2exnNWgYCxt6XHuUt5WIIv+StRUK861tXP0nlMA+b5jlqsBlNMgt
 00YmGBL5v4u2tYJCtIX/GlMb7R/PgYAZ6k7jiJCPUVctavU9zaRXH9rZO
 ePBdM914JRd+NjxGpveWOVYF/FRc7kqRqkFWjY8H7RbWFenxysplOKXRE
 8nt5qwkBalsiGsB2QZmGu36JHp6ufcgHico+YIwXBYYZKQSRBBab6298e
 XaFMgZ8J7wNMgdDYdBI9DmnPrEPJ9r9g/BB/MqVYiUtXBA8x6Gql/yE5S
 6NIm5IM/3Vagfx6smBVToOyOCCwSv3SE4lgDWXbcmGA0pyRQcMHG/OsEJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="446531715"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="446531715"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:29:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="820298893"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="820298893"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 13:29:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:29:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:29:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 13:29:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 13:29:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cj8qrG1nD0wXBVhwFyeoTSb83xuVmfHbxR5GAzFPFA6kYWdVVOg5dkBVns+84Dpta3SAhex8YXNU9Xf8WRq25zuZnUAJ8GIDleXMsEJIpYKPyEkiihVjPexISewdkTdkICSFaDmD1VVe8bpKVIjnlO53oCxn5C+Gn1LylVJcHWAA47pZdQ9gmcKlEa85EALYvfOrxnHDc9wk1BwVY6LVlYQxdryC2KwqxF56iguF9ykIjP7JFZL2yZUTKjIIPEgeMJqNsc4uHfHuCUGp2ibZHP9K8Cugp1elm555koo2mDT+tVxULe2FcaQS60rVKTU8P+GQANCkMskHSEW1EIdEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VE4f55Is3xg108HsijKwFTzwv/78Nv3HwNPY4itQ5Bc=;
 b=VdPW890eEQn95GGO20gd5NZZHuS9ZcW0L03Pt5NOj+zHsOIMhPUX2w5fSC9K0XhDD+YoTEHruy+HiIsvhIgtDYyZFTsUtgZPcj1AZEgPovmJomFnbRls0llceibhFb1Vb37C7BDk3AlHA4BGNS5UAR+GPu5HHs9My1V61tzTsFjV2xlBf52g9azRlv2QcpJklWYyF1MKrfUD2m7+mG6srWTmld6fQdr1IyNTd71GLs8RjOk3WbXezvWdgzhjMUlxSZXcMC+srvytvW6apD1q72w8qDre0FZeTxO+0hDqJ8J+WLM29fEsUbzKmZcafZG2oOs6FSduiX9Qk/EVbixW+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH0PR11MB5412.namprd11.prod.outlook.com (2603:10b6:610:d3::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.30; Fri, 29 Sep 2023 20:29:07 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 20:29:07 +0000
Date: Fri, 29 Sep 2023 13:29:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230929202904.GM233750@mdroper-desk1.amr.corp.intel.com>
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
 <20230929050253.3153804-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230929050253.3153804-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0032.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::45) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH0PR11MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a5d8038-55b2-4f65-d234-08dbc12abb06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /5ssICHo+LUSxIQfhElYwHuKJQOHCMovyc0T4f5Wa11O/8Ekabu4LbBmftWM4fJm9mecwacnmHoAWlF5NQP3aYTVgpLuFAfKAMbZxdHSfBINaU24YQ/ehYJYmfhWlyDFeArDbHedG1w5OSh35KqbB52/Ggu2bGjzg+dq9thkr2Q1lH2qjXMsrg6OmGUZ4i0yVX9sMBEjtgfKmpWTGZRfbyjMc7Oc83m76qezijK1RsNIpXFeOUAGdvv9DAmBMLXBXyFz2npLxeJtHXpko/XornkEcDOaFUUdu01ELLf91PJgXa831eqNOLEip9adRdYbFGSchxBDIJowMS9k85ZhgzuEb5rriO6t0frS79Iwk/58+Pw+gALwNVSOD+GRppV1b9ToL8m8Dn9zjd3A6GUt2lM9lW16LH0xLKtSl4nVMd5ZDWsphKbZ9EVG+mqUPaa1gE3HlFjbnJGoFp2BI1T/st1L6S6HCFwemorGk4FcBZZgCEk/fq7dHS8dRfZ8y/ZsV4xZr07s2lMaXW16YL/3vUPtMvP75hfq5CQ9e6J53BUQ06XMtBxvzaaL3tYjbAeY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(376002)(396003)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6512007)(6506007)(6486002)(1076003)(6666004)(5660300002)(33656002)(6636002)(66476007)(66556008)(26005)(86362001)(316002)(66946007)(478600001)(2906002)(82960400001)(38100700002)(41300700001)(4326008)(6862004)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qpa7rEo7UP76pcW1PUiRq0jULgNfcvaBcbV4JwgLII3Me+dkBnf4ewdPN/QK?=
 =?us-ascii?Q?B2ca8cWpZXg5rqWKPLRbPIctmaOYEtPFJYeQRHAF22APgLGBx0OtC4ichHrb?=
 =?us-ascii?Q?cVNbarecLD9bBCHVsQRjOMwWFgkFXjFFYhFuN98Mxpe3RhVxQsBzd4/+gjsP?=
 =?us-ascii?Q?2/qbf3iGgRjVvqp9ftuQfbkUB/uQYgdWrHC/GfGdryoB2cGz0NhKX0h8MVlo?=
 =?us-ascii?Q?huWeX0g1ZZJxA/+AHlew282ZJLG4aes6ri6UGsoJzQD/ykD/DxDS4QcmIJb0?=
 =?us-ascii?Q?tQlMZ4UBF8DWEsF0zZhQMu9gy94BXraGwa+DDnoV/B3QWWjTL2pj8BQOhTBH?=
 =?us-ascii?Q?/1n9J37Ld7zDkBvZpIGevSc7Zn2h8aFkGGw3FIHz5Q/0zhyimMONUpjDjNii?=
 =?us-ascii?Q?aMI14YdpdLUrFfaOvFUBOEwMMpW9R9gCWW2lCmjJ/+SFO+mcmWQEwrHdQrnz?=
 =?us-ascii?Q?4lnTR/dCiyzhfBlak2eqj5fMxI/rh9lwMP+FTgvFvO8RMtjja/vem/6Ez5Hl?=
 =?us-ascii?Q?OVIq7FuMbb/TJ39cT1aU2qlFQphutt5CQqmTkhabw4mjZ5s2t7GF7pA+aipD?=
 =?us-ascii?Q?C0B3kdLRLbTLb3/7TrEp9x1h76cGv0VWSnqV6oPeFCP8oux3BEaVBNE59Q0p?=
 =?us-ascii?Q?iivOr/TmBMGSG4rPECW1x77K/3fuf1TdA8Wp8G4CuzMv0YTee0PhhBi9DuEE?=
 =?us-ascii?Q?eUqa1eWy+QACgBxK2PRF5rDGln1RJCmEydNQsDjzjdnf7SOwtpTBswCVWLAf?=
 =?us-ascii?Q?n5k9UeJol4GHlhKQHuxtK+x5LoXYH2U7dwVFFPB7jomXwbiY0EHSManUCLOA?=
 =?us-ascii?Q?95KAYthgs3z0I/4nqMJ3arJ51CEC7wuxkb1AsTfW3lzyKaxrqgwG2xWJbF7P?=
 =?us-ascii?Q?b2XbdPsFD9krnPebKPywgU/mlK9Bs0Dka4VRFMSZPksqlwPgpBo/bght1qKm?=
 =?us-ascii?Q?emK28nBJVzhQsCaLDmNuObk5inJS6nGM/P7LnzMPXNZgSJkCEaS6noKX8VVC?=
 =?us-ascii?Q?BsOACXnu/e+5YHym81qqkGejEg5WHYAf4sZrRcghgRNcDX4THtsvaOEgtziL?=
 =?us-ascii?Q?PjpsfSg11CUALqVi8wwsK80XILg6ur5TpRCm7eD9j0Wbjo9r/QjRAOHGqiWN?=
 =?us-ascii?Q?Z9MjtRaE1YrKWcH0Z0Kt74BO33j7DkNRZxduzuWw01Sg7tJ8wYiry9Ib2xTn?=
 =?us-ascii?Q?9u6ItXLLml1e+xQrNn1duw9tyTwEA35JUdOWgmNgHopgrWibFgffn8VnBO4F?=
 =?us-ascii?Q?kPBzoVoqg+vpJF8M66bwh16AyFFXz5yg0ehhQI7Hk60mVQkuTFQXENXxPDPI?=
 =?us-ascii?Q?InFKuBx0R/cOUKGqb8YXfneKAIMXDRE58GbkdyNdq1rTfUOn+b921BwWVk82?=
 =?us-ascii?Q?NPAxofOHF7jBzwNmPLDZr4Z/JD1guoPwwywaf5yYTQPay2Rmg3a+kZ9dVuDb?=
 =?us-ascii?Q?CDvPnOuqkLhHKaDsTpAGejjKUuYWgIibzQaaeZUQWzCSjTsZHUC5FdmZWGcA?=
 =?us-ascii?Q?6xIYBou+udspK3Uw6TsD50sqA92rx92TAw+k1QLgSBn+O9NdxrzVw+jTbCdy?=
 =?us-ascii?Q?B7t9gVrVgj4uWB6hgdVwpWZ9DXvpYpx0L0qQLdxZY+yMF3+kj/ulOhxLUHff?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5d8038-55b2-4f65-d234-08dbc12abb06
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 20:29:07.5805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2CpEm6E5BeEc5IFBT/mRrPXLR5yqXDFLoUJNiHuhl8DiD+/imNWKprv1dHDgOH1N/gb+oACxfFdI3sYWSV4XDCv9ppoHn6P4EXLItxVCGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5412
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/7] drm/xe/xe2: Add one more bit to encode
 PAT to ppgtt entries
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 10:02:50PM -0700, Lucas De Marchi wrote:
> Xe2 adds one more bit to cover all the possible 32 entries. Although
> those entries are not used by internal kernel code paths, it's expected
> that userspace will make use of it.
> 
> Bspec: 59510
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

The same information is also available on Bspec 67095 too.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.h | 1 +
>  drivers/gpu/drm/xe/xe_vm.c | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 5090bdd1e462..7ffc26446d2e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -40,6 +40,7 @@
>  #define XE_BO_INTERNAL_64K		BIT(31)
>  
>  #define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
> +#define XE2_PPGTT_PTE_PAT4		BIT_ULL(61)
>  #define XE_PPGTT_PTE_PAT2		BIT_ULL(7)
>  #define XE_PPGTT_PTE_PAT1		BIT_ULL(4)
>  #define XE_PPGTT_PTE_PAT0		BIT_ULL(3)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 140a70d91d76..7e5f4bbea451 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1223,6 +1223,9 @@ static u64 pte_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
>  	if (pat_index & BIT(3))
>  		pte |= XELPG_PPGTT_PTE_PAT3;
>  
> +	if (pat_index & (BIT(4)))
> +		pte |= XE2_PPGTT_PTE_PAT4;
> +
>  	return pte;
>  }
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
