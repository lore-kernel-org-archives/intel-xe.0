Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626E5E7E635
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024CC10E031;
	Tue, 26 Sep 2023 13:45:40 +0000 (UTC)
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Tue, 26 Sep 2023 13:45:37 UTC
Received: from mgamail.intel.com (unknown [192.198.163.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E250310E031
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695735938; x=1727271938;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a8EjumSA5M14KNzNN9SXxn9Upq3u8luCJjLdtwmWB7o=;
 b=TkeTVAYrvi+RiYvSSk8Jzr8QT3XTuXaQEeS1+WLbxLDGTZSMdGVlYGa5
 dFyQmb7eIm9WqIG5NHbKdzDOTquESSlTXs8qKYQPOYNGCHTWEaevoWCmm
 jZLppXG9JoL/jFH+bMc9YwYzIgxUVlXOYKVr6RVzCYlfEme8nlieqKD3P
 XemeTW58eziXxFAKtl4k8l/hDXUMpo0A5HUY+8p6M1vA8Ab+wGp/iVAJ1
 og0rTQkox9sD8N8UPU09jhIYwsMOvHOG0W24uGtLc7T5Icw2V7Yl+KW08
 G+JlMJARwy/U8e3FO0yMrx68ySz4p+4u45dJVdDc2mmmJBk4MM9ykwvvX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="3151143"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="3151143"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 06:38:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="872503232"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="872503232"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 06:38:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 06:38:32 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 06:38:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 06:38:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 06:38:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mk3rJNiUb7IwWFEvJ1PxJpnffcec9ymN1A9H8gOoG/zaofHHxWvlNGCbTve5YGtRV4fyHj6hJoMlg51J7zTt2923PpdArvzbwmgK102SjaoWAypAJZxyS8QSZn63LocBqWlIEiagdwYAdtBpcPw/t+zoMkmL52S8fj9NOWtZZxmBo+Ggt/ayrDRcrKU5Gnbizit3Ke+/zH10oAeHGGxFnIcO/YsJ5zGAKr+SN8vb5uC/x5VuNcbfUYMb5SKhelR9xaHQqB5ZhqnhaOthVuSwX5LudV7aDukdrQSs5fMih9C8ksW9rxl5O+uAxEo64qY+hNVZ0UiNhI3b+kwJevb8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhGWTfhsONo6PtXXJwLjH8SgPmy1gNidBVq90s4sxLk=;
 b=g05L2WnI8KnKQQR60dkooWcsoWfoSRRCeeBCnJ41YAuV9uqlAns9WfvWEEdR0En5QyNm0/YkRBVGLjwVA99JDy6XSsncxV7nBthDY4p43HFLSB/33+uiL9raezImq5IjV7Ly808EprbDUhOFUICGJFmHjbbTPPLauIR0HZF4jjJLCcVLbPXPnyr59MmrPxYTLgffFK9HUkMW/ZMZwTPK5cx4nKG5Jkm8ZtGgBd4usLAhpbRqi5zKoJQyG7jFvRk6+zWquCLCZatf7/22Rp7kx5xb8qRfFd8LUK4+qpqtZp2iqxvMysKAzp/eJYgFozXYhLgBSUfrD97FD7NOn1jV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4619.namprd11.prod.outlook.com (2603:10b6:303:5b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 13:38:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Tue, 26 Sep 2023
 13:38:30 +0000
Date: Tue, 26 Sep 2023 08:38:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <o5cuxknlzr5io65xt4cgggofnyi37kflbrxltiqlqt7kagjske@neokhb4fsrmv>
References: <20230926130552.10605-1-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230926130552.10605-1-gustavo.sousa@intel.com>
X-ClientProxiedBy: BYAPR05CA0101.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::42) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4619:EE_
X-MS-Office365-Filtering-Correlation-Id: 9519fcf1-5648-4c3f-658b-08dbbe95dea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gp/OyBSiSNYK31NXWtZ9NOm/H3nRezoUZFce3PORRZ4cnZ/eKYlnCy/oeIGxheosyOsV2HdpLsZ7pOqz2Kuh/02QL6JF7JZOFzbXKIqf+uDNFqwvYEkIbpBzby8KYBWFYvyAufZbHXtXLD+z/zQqOaBHiR0/0N7ePskv4jrimM3R0LLL+IWp6GExfTjAisvudbzxMl70MqLItL1dM354IHsWhp757ti/ihU4zt7frlhNFwHOsJFQ4NNkyKF7ppEnQohgTiuxkOOPykDHHv1uiAOGH+VlWjP+BTXW+RnTpVHXiMx5dlYP4/jxbqnnDgxSyakz619zLK0n0K6upo/EkTvEgjdNb/YUQcwHITiMxtHfLkmW+FM2c7Qi/pPVWcP2RUaJbSHvAUiupxdXZp02jnzUl3m3q7GDoB67ww6OnEUsT4fjxhS2k0VkxHAxjK1aHZVARSGQu+qLSM4WB4nNkpaDtamVlq7PGNhsSFE2Uu3iFUXKh8fNqE/2uxDySeVu3OYL9xYeg/tOTeWmjyBooES665rYjPmdFbkwkOh2PlH6W3lvZya4Y3ZstCAvkadt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(451199024)(1800799009)(186009)(8676002)(8936002)(4326008)(6862004)(26005)(2906002)(478600001)(66476007)(316002)(6636002)(41300700001)(54906003)(66556008)(66946007)(5660300002)(6506007)(6666004)(6486002)(6512007)(9686003)(33716001)(66574015)(83380400001)(38100700002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MlJx2tO93vbMFlh7JBSiJ8BYXNjFIcOidbqu3YPSroJlXztCK02TW599IR?=
 =?iso-8859-1?Q?LZCMyt8yx5Mt1dWTu+M3OoByuw/ESLMwZ9VCGJN4zDg5K6DCpVYZMdRsJs?=
 =?iso-8859-1?Q?EZRXSII/a4rx2f8AErn2iZ80kLJYBYBv/dSY4VRm7eYphg4XXybAAM+5s/?=
 =?iso-8859-1?Q?zA+TW+I30it69rfuz7/1dL7y+MOzuY+9seIC/tzZjVsksd0InuRlzWaFGW?=
 =?iso-8859-1?Q?AnybA9k6YAna1sMOJzZ4NO0fW8qcAcrw09SpmTxELAksQowHkfe2kDzr8d?=
 =?iso-8859-1?Q?uydLvmv35HV/TT1kqQ8XTOE+Ku5jVCUeTY1v+/2rthQ17fzusWoozPHZ/7?=
 =?iso-8859-1?Q?+s34c3/NtBeMannyxhOcwMppCoL3Y1eI8zbrenKpbHH/Vcm6YoV/RqEBV9?=
 =?iso-8859-1?Q?wPJG8i6iymf6NnFl+JuHGjnQk7UZhwWVLm7UxKFm27lY/SyJNqX58Osmjs?=
 =?iso-8859-1?Q?uusoTvjngsNkaAohbJeMH2dwCJV6GV4pfAVSAOdEgji/lXWY7NjDWUBrsA?=
 =?iso-8859-1?Q?RI/uwqKl6lOtdW8NlTt7O42lPG2HtKg+419j4qGuqKFzObDzBJRiVgjJBo?=
 =?iso-8859-1?Q?EOGX+h0OTGcslzsvhDx/Rnr9B/aWmLR1dYdU8y4FW/R/VFvLbdXQQ5buFv?=
 =?iso-8859-1?Q?ipwGUTMJS9QR9Dv1YHWVHPW85RKCrLgclTvFsgnos5aKuFGJMTVa8nCh09?=
 =?iso-8859-1?Q?lrcI2ywfCiB7mD3rgnqWY+mbvL8taV2sLy1x5oExEkqfL4bync+gmWOflW?=
 =?iso-8859-1?Q?UacbHKUu6dvplREnVOpwr0uNVBYvN2h/aLSKQBf2oGXkyO2GjVwiJPqQmC?=
 =?iso-8859-1?Q?krcjxSKfIe+Rs/l2MSamz9tUXa3TZZz0yJRw4JCZ6bVLE1g3jSFhzF6yEl?=
 =?iso-8859-1?Q?VXDJop2dzcltN5MjgAyd60eJHw8m3I0SwjFID/NYgGQNFrdXFyB3r2tcbk?=
 =?iso-8859-1?Q?Du7CkYkEUFKXrTYtc9tOzKnZK4eLnx7DmU18a8NvaG++VxI76o3qjge005?=
 =?iso-8859-1?Q?MVBNOPtsdHm/xCqrglziNVmQq0JFkE8znBJCxjXZrbgBXBBps3HnqyPdA/?=
 =?iso-8859-1?Q?xMVvjCM8Mouxqan+1p4cp+eWYv6M9UT6dY/4qi+TmsPcaEpW0earVkEZYz?=
 =?iso-8859-1?Q?2PigXLdekC+/27yDiCNWuZJazkWXq5bHpUXq0SqJTqyGWTJWoyWfjoaTXi?=
 =?iso-8859-1?Q?jMZA7bLJrcrdamvZKSnnr/Quk6poao1saGuKr7c9B1+Tx5dCcFrY8yu+Hx?=
 =?iso-8859-1?Q?gL/bK6USkc4uVPNzJVRTKDsj03HFbzxZy9Qnr6FS5RcfefEe0UHoQJ+gNq?=
 =?iso-8859-1?Q?prXxXVadw+aazDJJ2ZRKeFCTzkrDlBwqgvaKuZ1LNHhg43IFT5r9q23cit?=
 =?iso-8859-1?Q?Frc7DIyILMznaARF1FViDK7ey3pw0+zGlyTYOhAvyRtho1abdCHQbf7Qon?=
 =?iso-8859-1?Q?Pd7qAVbvuvwiQDEgBefVkPf+hhB9wCqIb2rXOv+4Sj2D31iKtusnNbZaLA?=
 =?iso-8859-1?Q?Fxpbcx3U9lgaM1n2679XomdOLN0Oh3EX3ehynyxcnDHWYhTVmyDgfzh49s?=
 =?iso-8859-1?Q?Eppk7swnuDMqcpPB3Ca6W3RFwsMCZNyFugt3zCdAYoacHFIAoARUD5eeEI?=
 =?iso-8859-1?Q?2z3jygn+nV7Gxzd8G8XT6Cqwx+kLXOp/toSdu9SeD86vwpHNbyAzeSuQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9519fcf1-5648-4c3f-658b-08dbbe95dea0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 13:38:29.9655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+Z60stBVlrb+wO/1njPCsDt0Yo9w1hWVPaPhePHqBcDS/CaB5Xual7NkPIt9x/cQHowzFsp4yHVcgB1FAdfzecFBQ7nznrUX5da6Wva6JM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4619
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe/irq: Clear GFX_MSTR_IRQ as part of
 IRQ reset
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 10:05:52AM -0300, Gustavo Sousa wrote:
>Starting with Xe_LP+, GFX_MSTR_IRQ contains status bits that have W1C
>behavior. If we do not properly reset them, we would miss delivery of
>interrupts if a pending bit is set when enabling IRQs.
>
>As an example, the display part of our probe routine contains paths
>where we wait for vblank interrupts. If a display interrupt was already
>pending when enabling IRQs, we would time out waiting for the vblank.
>
>That in fact happened recently when modprobing Xe on a Lunar Lake with a
>specific configuration; and that's how we found out we were missing this
>step in the IRQ enabling logic.
>
>Fix the issue by clearing GFX_MSTR_IRQ as part of the IRQ reset.
>
>v2:
>  - Make resetting GFX_MSTR_IRQ be the last step to avoid bit
>    re-latching. (Ville)
>v3:
>  - Swap nesting order: guard loop with the IP version check instead of
>    doing the check at each iteration. (Lucas)
>
>BSpec: 50875, 54028, 62357
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_irq.c | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 504cb94d0ee8..33c1f0e4f2f3 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -519,6 +519,13 @@ static void dg1_irq_reset(struct xe_tile *tile)
> 	mask_and_disable(tile, PCU_IRQ_OFFSET);
> }
>
>+static void dg1_irq_reset_mstr(struct xe_tile *tile)
>+{
>+	struct xe_gt *mmio = tile->primary_gt;
>+
>+	xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
>+}
>+
> static void xe_irq_reset(struct xe_device *xe)
> {
> 	struct xe_tile *tile;
>@@ -534,6 +541,15 @@ static void xe_irq_reset(struct xe_device *xe)
> 	tile = xe_device_get_root_tile(xe);
> 	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
> 	xe_display_irq_reset(xe);
>+
>+	/*
>+	 * The tile's top-level status register should be the last one
>+	 * to be reset to avoid possible bit re-latching from lower
>+	 * level interrupts.
>+	 */
>+	if (GRAPHICS_VERx100(xe) >= 1210)
>+		for_each_tile(tile, xe, id)
>+			dg1_irq_reset_mstr(tile);
> }
>
> static void xe_irq_postinstall(struct xe_device *xe)
>-- 
>2.42.0
>
