Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466CCC04FF1
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B3410E496;
	Wed, 20 Sep 2023 19:24:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B51610E496
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695237893; x=1726773893;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cVrXYcZ1xF82WifJNriZPdyEtg0TEw7RYKqS8o2n1E4=;
 b=R4aYKGm5TmMc2DczzX/82qhnQVi0MUjtSohMYGb2T3w08CAH8ktta5KS
 kQ2EBnJf028vb4CPpVTsFR4nTxZm3ES62uyyKerFOpXYa8Ms1e6FA9hjJ
 uJrVuoGfuYiCOegkDMIdf6QIFyF+acgS9cdLXYWe0A1/XKFDqwAaAHyv7
 Uxbkd8fN8L/AAmKwi5tbIWxJUZ3BdMkMHg0NLUEc90iiwYu2jkVfDj/51
 GXoIJ75U8+A6nMZZoAL1UKifTZFYx4Y1gKxwKOe1CYDUd/l9KutMhXoQb
 gx+FlRTz0H5bFCC4E3GthhLBLzIWpdvotKCCzqtGOVmbqZ3bFcUASrCMW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466628986"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="466628986"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:24:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="746770561"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="746770561"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:24:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:24:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:24:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:24:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2EVgXxaxuMR9MNLDLjVkhXjww1MYaw9brIkyQ7YUHYHvBRgappXTYXYIMAgXcreNtT9JGL2hvQUmqo4RbMCpam1IKSGO8bN1brWblZ/qkyCeaTFHt+BeSkdC036emkMWCFfg39Vt46y9XEDuPceii+TRBDdVYsdA0x8U59a9pDTiG372sFyYxqTxj40ywFJ+q7zGBULcKG0t0K57MlKgxS96mveaoL2NpmQe+Mdx7RkB73179U0XwJZNaEbi7Y3iMhcgHEkaOc4Lm2YoEtEd0hGk+TGIIcQ3/MHUviSz5z00ZlVHgfvmDjHiZyKQzEOx2Huq6GFY2iocQ4Q4vMeQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G66GPBWN6xqi+Xr0I5sr2g71onnrPkHCesuywALOdf4=;
 b=KBdVV+VYmN9lZnmVynCgka1JkRHHevRMUPsEcW14ZXjelvLLzCu+G91otpFJcuIMyHNiGlEPrUoVtVoJ3ny0ZiDd6eRr0OvqPEnOtTJv4EFTccx47NJwp/74WwLtxyhe/j1P1vIVM96+eWdNbDv1MMpNYRG3mLKKy7pfYqZhgc4LP2TsjpZnGuto9iPHQvJuowO0OwQPUx0fjZreKombbxtyUWD0+yctOdtCD0ZQaqptwuG2pFPobhrFcNcjjdsKY2WSqk2OhKRYpOer8NRRYPaP4+QuShVAhOg28v1gg7Q9a2M0Zzsj+cNLbNE/K7rRphd10TfS5cDIWr5UY6UzXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 19:24:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 19:24:44 +0000
Date: Wed, 20 Sep 2023 14:24:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Pallavi Mishra <pallavi.mishra@intel.com>
Message-ID: <e6pyrszsnm74ksejfflcea75qyy2canhvopit535lm5aftkykm@qa7ohu2v2syg>
References: <20230920175431.3381076-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230920175431.3381076-1-pallavi.mishra@intel.com>
X-ClientProxiedBy: SJ0PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:a03:331::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4806:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a0434d-a1da-43e7-94df-08dbba0f3e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GbE5e2Zn4m14eMjBAdmp1qbD6H7MyJLai63Z4jDdH83UyfAKDNJ+N3lXAjBINdlTUfr1ysm87zo/5Fs/lJnSbKJAjGN4PUusoRUYO/a5dX8a6AcOxt5oOuAnh9mT1Bhse8X6O3+VOJzk5lCo3UsxMiMbbxRdH3RWQqkv/rv0CrDn2AHxwbk6zFNw4tz6oF1asMOq01CadV4KEUh+WgBfiwJqw1fzjdiiofWswDF8SY2NGKXHV53IYsZV+mtYnTtJHl2bgQLnPD3aPYD/7BtZXWGWzW/R+3yaRPaBrbq7s2CAaTNI8UWdOholoHa5ZP35MosrDeuUuNYFeXEr3ok0JVPwBHCa7CXW4WiYSatJFRXy0pJwge2oIKkvSS06a4Mdreu88fvYy/l/t4mQU1LyYeM/ronMatYyMc/rIIihWIbaeppQbu3y/uXrPyGnY5cmgZKnNALntaSmqW5SIjkyOtvXKsvX7lIwc8aUbF+8zSjTw60JFjUmXH4ebL1yIi940k6tCuzCj7qSJhqQU5IUzCQmawKoTmv0fx31NRtbawmjTEB7YWNxN9d6CllXb/78
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199024)(186009)(1800799009)(33716001)(38100700002)(82960400001)(86362001)(478600001)(66556008)(66476007)(6666004)(66946007)(2906002)(316002)(6512007)(6636002)(9686003)(6506007)(8676002)(6486002)(5660300002)(8936002)(4326008)(6862004)(41300700001)(107886003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tsIjWXfWZ3oB1Uh9eN//po1M2nVoOpY6piqZ/yV4ablMrNKdGNoPkQeipdsc?=
 =?us-ascii?Q?mISAREp2tCq2yLRA2jdXd2m/h/JWBuqUiSuTgemFp1bVbhunLlmkjQ8KmwEP?=
 =?us-ascii?Q?Eje4VICXwaH0LJNHDfrAnHz+RvjVV/i7rsdiiwg7wRgnIb1yh17jOcF1+T7Y?=
 =?us-ascii?Q?keGqUaetNKzSKWZWZ1kqZsPd9rNRWW1a2w5RqSt/rQDlauOAN2qsznLdLLjJ?=
 =?us-ascii?Q?+5h91RuzUrfeDzR35QKPrz9ljYUY2mIa+qcs8++NBPyqQptqSKTHk7MRKL7V?=
 =?us-ascii?Q?l421j2k1WOyi12GSiwagYHRFCNpwrkGytUvbTliu9F6kmbF+yEOCGaOk62xL?=
 =?us-ascii?Q?LrHSNdL6Lr/EPsGDXKbqJsoUEuIz/KuRatVWB8qIePQAYn3yw8Lqp+Raf4F1?=
 =?us-ascii?Q?FMf9Wd5ix8dnwITDiF4KHRbeor8ogRF63LAQZ6ASBBfdF0XLUE18ovPxCy4U?=
 =?us-ascii?Q?fFCQy8l9k/GN5JWBSLvnlCXEY+W55OHsnt/tKQ+6UWrjoXy1k1qCoCgrtfec?=
 =?us-ascii?Q?ME4DzVuKmI4WoF4EnjRQDgE+IsKUhHT5BUMwpl/gd5EE2Z3zkGs1p3HBOYPA?=
 =?us-ascii?Q?TgAp/+laIO2QL7Q0/y89yv49UBWs0IVj8D3huO0ZCdS3X6/UJGzMvh+P2mjl?=
 =?us-ascii?Q?y1d5dTWKK+Dv0hauDLwIQP9n6JOzfITodZoSOTJRoXCFTfcrXQoWbMNQm+fI?=
 =?us-ascii?Q?JOZFQBhS617uKVPpr7Cg48coz5N5AS5wGRBnONz9s37BL5/D7E5xERKYIatM?=
 =?us-ascii?Q?Cixqk0lneJJGi5iOMVtMMzDlVkxkEpJCBycpsxjv8Xz8/slALVBxM6/cc3HG?=
 =?us-ascii?Q?Wq5EinVmWPpdIsmgmgbEtDZOasBDVvOiYH3W+jkq5PaODLSkcYvcThulZCyp?=
 =?us-ascii?Q?QskL3U4VlX8LzmT+AFCalEKbArMPbRKvl2VZWAXfCcGdZLXzSGAs4blCIXRu?=
 =?us-ascii?Q?odAR0g9fgfAT5Cn9S8+v9SF12I6+5as+eVCxMBvF5G4uoUEkl6rENoLhlz3f?=
 =?us-ascii?Q?a7gE9ZQZSlwbGI8Jv4EtNeIftIwZW04aA9Ngsk2GRKM7D8Ndz4Pnsdlq1lUo?=
 =?us-ascii?Q?j5drnsklJG7P8+J7SKUOY4cq5ShefNH9EnffGFqXR58HmcFoXJGGIv4iKyXG?=
 =?us-ascii?Q?oerNwfBLrM+YoINSEG/DJvtvdig3okLJ2xKk6hGVCIhva/nPFTP5SMwqP3ZG?=
 =?us-ascii?Q?1lnDRB1s86M7Bd5rYM19SfcmzZ3PuRnFzHXbu2/q7M46vhwRh4IQs4X2AnE/?=
 =?us-ascii?Q?taHLk5/mUF5tePpzTl6g5Cv/LDK0hc2WEI/W4dRe57bekGbcmt+GVF/gHdN4?=
 =?us-ascii?Q?FdM1I6MeiN2eLJ8K14w4RtVBV+K8BCXCJRbIRuLhmhCI4kwt8ckZQxkXX+lL?=
 =?us-ascii?Q?PsDPXMsQ11qSy0vt2v4q8YRtajjaNshWUfdR1rwICjw3L/C0XOH3fZo05WKQ?=
 =?us-ascii?Q?r2yKN/4t8ShOReIKm7U2ZdgnqwjSFPaJnwNO6GYjmLGSViEYI6ICmnD+PPRe?=
 =?us-ascii?Q?PKvXgi6xun7yPvv0pngbN/iKrZQQSaVIfYiuM1VzZNEU0G/xRx3g2DkF1cq1?=
 =?us-ascii?Q?MjbxKlfj3aqzruxD49uwvaHMLU8T5a8fK3FLgBbiy83I8UfCQrO4AOzfFa/Y?=
 =?us-ascii?Q?UJuwtQnt5zjxCoPA+jmEZHg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a0434d-a1da-43e7-94df-08dbba0f3e9d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:24:44.4792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Xp+r7JiMMeGaJEuRTEsRlOJTZObD911+jmwxVImYYbSSY3Aukkr9VOtSHaJ2hAD7575Nj/DF3QUH2BMlN87ZDygMLo5U1xzqZLoeHSLIik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4806
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Align size to PAGE_SIZE
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
Cc: stuart.summers@intel.com, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 20, 2023 at 11:24:31PM +0530, Pallavi Mishra wrote:
>Ensure alignment with PAGE_SIZE for the size parameter
>passed to __xe_bo_create_locked()
>
>Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
>---
> drivers/gpu/drm/xe/xe_bo.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 1ab682d61e3c..014d084632f2 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -1199,6 +1199,9 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> 	/* Only kernel objects should set GT */
> 	XE_WARN_ON(tile && type != ttm_bo_type_kernel);
>
>+	if ((size & (PAGE_SIZE - 1)) != 0)

ALIGN()... but note that there is already a call to ALIGN() a few lines
below this hunk. Probably missing the `size = ALIGN(size, PAGE_SIZE)` in
the else condition?

Lucas De Marchi

>+		size = (size + (PAGE_SIZE - 1)) & ~(PAGE_SIZE - 1);
>+
> 	if (XE_WARN_ON(!size)) {
> 		xe_bo_free(bo);
> 		return ERR_PTR(-EINVAL);
>-- 
>2.25.1
>
