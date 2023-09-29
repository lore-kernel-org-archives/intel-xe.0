Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965BACE7AF3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564D810E148;
	Fri, 29 Sep 2023 20:43:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AF110E148
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696020186; x=1727556186;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AK9Bs7LbJk6+5dQUcTwWWL5WtIoa0ZIXggwAzQaRo3A=;
 b=dfXE1YL1E801lT4Y4wLh81+bjW455BUC2B+OImioqQYyawZ18pMxdcMQ
 WH8+VJFR1uHk0SvjfkRR4vUKfkakGylv0LgHraDKoYfJugGuu3g9WH7/s
 WmQksUJabIUxkb2puLNBdSPraSfXi8mpeZjOlpbfQPRq5dIbHA0Vxrzwy
 uqlY+3nPIeRtVeWWfJoGItErJaS84OBbXoAizkIYjCfw6XOnaNM+7+NcY
 OP8e3whIzGeM4mg5w0kTq4Q4O3gpXqoQPJix8JGPEFthiuVjdI+iIiA7I
 145RCAj4t/CRnZ4RkSgxAPyJ0+Jr5SgSRC1TmK0Esg6DRaqSAHmCM0Bw4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="448864530"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="448864530"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="934666"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 13:29:05 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:29:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 13:29:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 13:29:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vcvc8AIG1ZXgXhsu7vE3cgXRpkJqucauIPgPnfbw53uIJkEGm4P8KPiQBqkLAeyFuay4iAtdq9/gtXAz4Q8FzpOERtmgs1SlntotYeMyNSSFbvAczwIbs+yJ3PW3Vv003RAZWIDvtKtHasV9jALMMZ31AkL0ziP0WG41FK47v7HVeonFTCI56jFfDcm/LTlLpR7Y5/I2+Iir7X5JvwCZc73vjuFQOXzvuCRs3mrSacpBYExy7/7XnFS8nWfQqWrvoLH2ka881i9Bk5oSL96GoIF/W07flQdXommyC6bud7bDZqlYKxfdWhJG5WnJtTCSRq0myqAFaO6cV0VjsFb3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRH7ZG334ruAlW21jKhPaUBG8WAdohBlb5oTS7NMlVM=;
 b=Pd1wqQd+d36XDT3u/ccsI4RbJLedJiU7SiPwFHk6x1Ab8UqzVVgCmmIKBvmXHV5R4EhygvlirOfBlZ4f+LbeuGswUM0GJ1ir5BjemZXR55ewx76Nleq/yx/7EJsnIZaXBUIFcMjog47G/9sul1DlKlW/j/bHtdsAwP+/0r9xBbPKA+QL++1LrN1kVYYr9PJ1KT/VQarIkZQ4CYkY+wT8juJOE3a+igaal3YaZqkyzRPCIdj6jb2CK3RZgsdjO9T1Dvyn2G7DeTFNz6Gy9KdRDQvoqld7Jz0lbjqvJ3Y5/+lXbiKfolLli0p0rb2/IECc71Ozp3vucVwxJb1ExLOI4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA3PR11MB7553.namprd11.prod.outlook.com (2603:10b6:806:316::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Fri, 29 Sep 2023 20:29:38 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 20:29:38 +0000
Date: Fri, 29 Sep 2023 13:29:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230929202934.GN233750@mdroper-desk1.amr.corp.intel.com>
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
 <20230929050253.3153804-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230929050253.3153804-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::24) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA3PR11MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: 4def8f16-bb56-459d-4e16-08dbc12accad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hH+XNchygK93OE2LVdgXlE1gZ1P3xUVQpllXIeEpIrn2FPSbUR6z0V36jXQWmPJHMEOR9rBkBS9QqoWU6jbwRM/8QJ+8ce85DQR9953rDZbCJzguVxRh79IQvIA+gUndL1KqXKvMZl4xihqvzpIn2mQ1y76ZHdZm4+wNv4ps4H3ndYFSnH1OPXCSb0tkf+x2+nddomzDuBs9xt/2vqPBOSoJQu7aGPUHzuY8+uXHx2XVRBai1iO4mUhrTh9yIr/EAZcAJBIBuJblBpuWQ9fpEagik9XwbpHSJGyOrbal6r4D+NG7P4lZZzRUvTMNqq3fEv8ICQC2jC1To3IOARzNue3L+ao7qQGiM29yiYk8Tn5ew9vVpwhJP4X9GdlC2f0HvpXjG3nG2kWaPBk7YUAI7n7kiRCDfsKrxPW5ov8aLGo5KvWzbwEQ6YEdMo2f9qu7ty5xcCgCTmvxIVnw5eLzEy0sEMJ7KkBrraudoBsxcBgdgmSrhocSamdjCkZDDiSelnQ0MKLhu5+akoEVWrtHnydeg4Mupe+rxSSY/mZtR/sH6klUh+0muGFkkLHt9yIA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(346002)(376002)(136003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(26005)(6666004)(478600001)(33656002)(86362001)(82960400001)(38100700002)(6486002)(5660300002)(1076003)(83380400001)(6506007)(4326008)(6512007)(2906002)(8936002)(66556008)(8676002)(66946007)(316002)(41300700001)(66476007)(6862004)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1G+Y4ZUVj9/57Pz+SfPwZNxE01WmYFE/m8rPBfsw+RMvjaZ4+SPSUubfO1tX?=
 =?us-ascii?Q?DBqFukDrHO54tgbXdeHXzxkUoMSXIo7Is/IFXP+Vhbbv0osPwnqEnIUH0qRZ?=
 =?us-ascii?Q?DQGbji5pllKkOk3cqFvq0sMF1m+rt2hpzpDseA6qBSMD0vWklWgC5qHk03Oj?=
 =?us-ascii?Q?5ATjbKR/VRSSXpb2OVtOgq6VuRzABOKhZY+qwOIbWegisyN7TfUqbKFyCBmZ?=
 =?us-ascii?Q?ZsFUD2mJXRJs00/RyjLUCDytyC6WE6kYfP4ZtHNJKBpB3FBjDbD5cJ4YKiLh?=
 =?us-ascii?Q?lrTfykVcU+OFQ8rHJWN+sZqh3H4LAuJ9FGcIzS3SCHm4PquTAPq2tFzK7vh5?=
 =?us-ascii?Q?AwK4Nc4CxG+flG6wYonD8BIlMwTgPnbLpvP2kP8dAUECAKUhfsC76VZCLoup?=
 =?us-ascii?Q?AJ2BakgPgwtzwgu34hwWJwxBHiKmgDS1w29gbygwHMSe/D6QTjs0qnR4D9tp?=
 =?us-ascii?Q?ZBF+MEL4J/6At0mvixkKOf97rXmKAN8DGsne+z8p4a1yfOcTlLphM7m7NLu/?=
 =?us-ascii?Q?aR5GjdXpLaxYgdW1N3W3dLiza3IE7iAt1csnaY+LVnH9JAmp1VHL/W8XX3H7?=
 =?us-ascii?Q?1uM8lv6INthAl3t1W+OAOqScw+sydFDhxTllmfAOhb4n2MXNKs/VLsFEYY1A?=
 =?us-ascii?Q?2wKqM0WnI/8ZABX0/A//O0IDIMHayxT+Tj0+cMJ96ISFdn/mkEHpCi37qh/C?=
 =?us-ascii?Q?+r5BdZKbaX1AXb7iwEYAR/cioAMhGHYaieGHjSiqB5PJtxOE6uvwqkQUywjj?=
 =?us-ascii?Q?qyWYkP0mP9k1VE07q9SOp222GWNYrsJBuy07NFJ1t6KVDCNWfXueZnZLzVl7?=
 =?us-ascii?Q?vSjaZ9523c6wwRpSPnKrBRCiyLVSVfuY8u54kQwUMBjorWm3+LGaBhsyPWth?=
 =?us-ascii?Q?pxYMs2/BkInhnjc71qoeqvc/r9cva6FFjgOEWX7df/XJjzLIDx4yP4On4kKw?=
 =?us-ascii?Q?mT9dJy2vzughTRv/fRdc4z4e+67EQuSHA8nZeTCIIr2u34RCJtcsVaYJHonD?=
 =?us-ascii?Q?IsvrRnDMb/cpmTqhJ390bOjxSqSmWBCG9xygthncioiRcmFzxgQXW8QMeuEB?=
 =?us-ascii?Q?5jEy2iuyizO+e51OH54O/fjaqkbrotwe5Bq/k3PXeyr0WD5fep93Ps8mmnpr?=
 =?us-ascii?Q?NENSaReiGrA8YWv8Vo9+EsIXEszdpjA9G0/EP3ejhpaZ5V2xe6HwD1tK4MAq?=
 =?us-ascii?Q?aWSKqgMZJeboJ/dJUaJdVEwELZchvoDajA7iwhEDOC0osiWD1ICWz2jkVfQK?=
 =?us-ascii?Q?K35JgVShJIF5x9ofWaB1XSozNrV+mCStjvLBXPefWp9Qo62vCvZOEn3TxCAa?=
 =?us-ascii?Q?m3oiUY2gvq1WUBshaHeedyNcAhfSUCVrnnj0Ccnf9r4uQru3bzLs483Pofnd?=
 =?us-ascii?Q?CB3ZFf7vrokkDIBK2OlZKHGQr5Pvqz4kydDKDZRQC5+PklblxZglaTPKi+JQ?=
 =?us-ascii?Q?tUVMtnHPSGbfFkM/UReZrKJ11SvGDiad0ShGX7zNR2+AXCY7lNY8K8FFCjMY?=
 =?us-ascii?Q?qZXNK742IvIPSpRK1/JTUEuBU9P7NtZ3aDLcs8kXg7GDMhs+Kmd05gHzPAdR?=
 =?us-ascii?Q?Vct34Sd75DBB6zDgBWHSkbNZ7sIKFipXQUfD2vrqw/N8QioayLcF5c0ufw8t?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4def8f16-bb56-459d-4e16-08dbc12accad
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 20:29:37.9499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iI8dGG+SGUNWhDthQcyi7mA+c0Wzw+TNtf6j9VxQ29jkL8JxeTVJk+N3T+TIG59XGR6MwTmbVMId9P86iEZTEmtUt710Zo7RKtnMyypr1KA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7553
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/7] fixup! drm/xe/pat: Prefer the arch/IP
 names
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

On Thu, Sep 28, 2023 at 10:02:51PM -0700, Lucas De Marchi wrote:
> Fix alignment
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index ea2e3fb3a843..296763594370 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -26,7 +26,7 @@
>  #define XELPG_PAT_3_UC				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 3)
>  #define XELPG_PAT_1_WT				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 1)
>  #define XELPG_PAT_0_WB				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 0)
> -#define XELPG_INDEX_COH_MODE_MASK			REG_GENMASK(1, 0)
> +#define XELPG_INDEX_COH_MODE_MASK		REG_GENMASK(1, 0)
>  #define XELPG_3_COH_2W				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 3)
>  #define XELPG_2_COH_1W				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 2)
>  #define XELPG_0_COH_NON				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 0)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
