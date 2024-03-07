Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A30C54E41
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 00:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BE0113607;
	Thu,  7 Mar 2024 00:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/KyADdH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44673113607
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 00:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709770574; x=1741306574;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=QXswj0P83dR0yyyTNvfUkjxaan3mTSknniDJJ7nQyAk=;
 b=n/KyADdHs2CKF5OuP/M06LacOt2BKRHu/3wL74p3fcT6RpGVdF2FI6qJ
 aWjwUj107jGglv7ADzzvmRR52z43NCrkYJwa3IDim/F+V3YaIv2Gxl7ib
 CzSmmRGN9drgU17pEc3Z9QczFjWvCwi/qaL6f6f74OhewJiJGx9dz4PNa
 QkiPLGRj+G6UNuxtskrQ20aAp4+4XNouSiw7sRI7r+O2BwXRCrTCn+qaC
 Plj6XmtcZjcmThv+i/4DoRlp2j7fgbbYOM06StmcN/fsIlplIwiEvuMkA
 gi4FT191xsqh1fH5t0XkJz/A5DhqHZZtKgpbMbxnOOvaqk3xiIyJA/BTE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4350805"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4350805"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 16:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="10470736"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 16:16:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 16:15:59 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 16:15:59 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 16:15:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDM2pzlU5TJUNAkxzXLsHEWW+L9jNyZHTSu7OEg2qOwo5EwHp1XH1opmqy1DnGPzGzdSxl/49Esc1jru6491EH7ZohZdxJDY/hTa2Lse51JsiqZD+BglZF01M9h9ygQbHcpIpo9PvtxUJbibnPGNkg/bKieyBpIEtGNxOK5NcgExna8MCBnvDTLsuytO303y1+bHu+HWs6WQXaHHUr12u740b6iN1/57vRng9AmK44UUW4GYWU5dBAf57x99LA9fe7zD1LE2CbiONRqgE/UYkooSp3GrsH/MUAIZHlS2wPTcObso1vKCbsaczGTTOf67TdzPDrEzzyPzJ34KGHz3Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hbtyge4EF63kcHNXs2RMTL48HKM/WTW7kZkIUIZkgDc=;
 b=InZ8Q1t119ZG5DU2jMlngtgpEcfnsTI9AVyvRtDwOOZsJDUoJelcS69BwrdMH3oyqPjkmZCAJb1+LgeOgx1Exq67oyAUabdJ2mRl9WrPbKhIsgCmd0btZkFRUPohOEntRfBFtoyUCE57GTpHSDRLsj8fQEbbz78JGa3gdHhjylYtzl9ya3vEWo6uHp1hNXGCyIUmL67+wfBXwxMbRvREFoAKn1F9q3/AvxCINcEtLiwYE2RxUnFQqo0THEGmD5rqBKhrZwxGy9rjbf5rQK/ulx9f8P1PT2ZBgDLyZP0JbIr5DO0DDDMJAcX7oLdfQFYrlw+OM9KizoYQ1BF1a5/NMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7851.namprd11.prod.outlook.com (2603:10b6:8:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Thu, 7 Mar
 2024 00:15:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 00:15:57 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <intel-gfx@lists.freexdesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 01/10] drm/i915/display: convert inner wakeref get towards
 get_if_in_use
Date: Wed, 6 Mar 2024 19:15:45 -0500
Message-ID: <20240307001554.162153-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:a03:117::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d46d0f-4436-4107-35a2-08dc3e3bc2ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RUCRVCHFLTOy6H3fgwhgV+2xb+e1aKqtjfuCAO6sp0MarFVMdNypcouQY750AoTNbUvKIUUebCBgNZ/uWVAWBabRdowWi+4Y/cEFbozrzs9+RED6chG8RSJlPkBwnzPPA2JbtPJ8saCGagtHk1jqnzvQbsTGp3qVyrn4csEArK2C7alq2cSw0TSuHI9AcA3m61cmZluw3KjZ6PGckNt42aQKXPfC6ECy3dtl9J+xbMlg5KhC+W7PTqp5tcMcf/EqpHIKhbBW2qjCDLKvkqruo9YA1skSlZ1Kajhn59WgECjMum7sGKJkVJYAtU9sRK+e6JeM12ExuJdaeYfcBARzD/Z7syaznR7XyPWgixvBQG4m7Hx6nq1bIwbngyxGrcVgNTQokhoQBCdBFajdYGsPs11lWGHG0584F9EyGXQDx5Y4rsvRbZsI/B/64ozz8A3QiYKr7DvM1e38D74Q2zkMoGZtDR3ykEA7cmo3QbN+AW7D/zUEfT1RPHxiARRBqKYA+WNIJNehvlcAxSU4rFurVusbaqVlrZZG5RurRTIYar7DOWOqFMB5YUcwrIbEt+ei1p1Ki8Vs8zUHsvdSv+PURQOC2ob30kVbh7zLN6LpQ1HF9m8fpwCjCX0tT/xF3pSfXulrCrqUA26RjEyqry4VJR7dkMT0PS7yZ8hALnAJd00=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lChgQ0x1DPQ6B1CZ1CgF6MwVXC27hRzaVx3fwQGpWdKY4znTpmmI5pQM2grT?=
 =?us-ascii?Q?A7HgksiAcm8XcgbW8jm9KWIrLhZvVrpL3pnj2eGepMc1XTSajnAtIoZGs2E9?=
 =?us-ascii?Q?8uiLpa2B7JTpHgtrNQ89e00h/SKwa9MkSX+0lsVB5Ldc5sbRB61O8x5+IPcO?=
 =?us-ascii?Q?FiJtP2CQKqMKffyxQrjQSlKRu5pweMRerJTtvaoGykqTTzCls1rRswoIt936?=
 =?us-ascii?Q?ZxH1PFttmRZG2iJ+lJPQo63DpHdkj1PfEiUYXVjNXupdLA3orDWcEY1TLXYD?=
 =?us-ascii?Q?Y/GvCf/SEujUJOD3Ujis7jjU77htlnp9uJ6Gc/V/tfWa3MCLbG8AR7Eg6Khx?=
 =?us-ascii?Q?kDvM9vowz6WwbSIXPibt41iylW7YgkzC4qxR2XZwrMIAuPFjCqN543EHMvxt?=
 =?us-ascii?Q?2FE9MHDqs3gZ8Cliq66/Uw3xl7zWx73t8tKIM/F7b5DaJuV9uud8mqnLj/jX?=
 =?us-ascii?Q?fKGIgeVEZ/eGkA13quVXo00lbwer3mI914CKgFDeU8KhcjeFEzEKCfDYsLMk?=
 =?us-ascii?Q?H7i1NKp0V5PXSexKYr3gzYosfwYC4Gn3SWG7wQ3r+RdA+T1RF9zR3zsQoKiL?=
 =?us-ascii?Q?o8xHX/qQcW0EGydsr8EEw+pxv/L+QXHJvtbt5GCqT82HYLdoOhpqXrx5+9rW?=
 =?us-ascii?Q?NO9jf6MvdAqrsNyf1FbMtDMG8B4b1QI/f9ucMAeELUX6gTygMVrhnq5X+Ihf?=
 =?us-ascii?Q?eNvM00tcbgPNxk3JC1zXizxSFfOY4UB97auGG4hMW7/bWeCfJpkV6UwsZYb0?=
 =?us-ascii?Q?Q1AXctlUhPUrTTV7UsnRKga+PBiUI6xvFQsN07F2WCxzat/R4gOnEUPu6yD1?=
 =?us-ascii?Q?mda99fm/ZRc3ZvMs4weQxXsiDwTT2VWUZwJbp0wngGZuUE3KSUsoc4zqQWEo?=
 =?us-ascii?Q?FN+Q11FbcsutLIR8S5Kv5bAI81i0HdLVKnUd7aqUrWSd50nbAzO7Uh0VDHW9?=
 =?us-ascii?Q?XvhCicNGCNvl5xE44/ELxV/rnx/kDhs5foZk10tLC3vB6IarPfs/dySUSmOu?=
 =?us-ascii?Q?kfoPF0HO75HiseWeDxwm9MDvvWtoh/DYeOCKR4p1AxvxvaG7iI34nwwYxwag?=
 =?us-ascii?Q?1KhvUUubLkTdE2ntxfVetPUv45bQVUfei7oMIs7olGdG7WaGE7B3BcelXHb6?=
 =?us-ascii?Q?nX1Z5IRauqelm2zTwpCc08WYcB++UAWkVM1tcLk03UrrGez2Z55UFoc+39cW?=
 =?us-ascii?Q?XMN97ofLMqj/oIdcBGRZiNV2w7atZ254ugwlWwZI+YoaGBAFUSTKKafrp9n2?=
 =?us-ascii?Q?x3V6UnetKs735hOaUu13/LQUum7U2l31Ap8BmiZsXhEsIPQtF2TRHo5mlpRe?=
 =?us-ascii?Q?rVet+Bg5V7Lm+pCMXtpM1G5oNK5TPHPo02uvyD3UdxcKhoQLhtShVvP0PISt?=
 =?us-ascii?Q?JLrEVzkPIQWtax+ayJbs9GFkA8TdRINuw4iVxd2LoJia9phlv8n/uq7BBskT?=
 =?us-ascii?Q?RNvgojMWXymktUpUAuf+ka9GkHlRWKiyFUDbFksdDoTfEPmh6jTsKmqfo9fh?=
 =?us-ascii?Q?x8UimwvuBaAkRk/hZiBB8B1yRj6nZyLv3hEsFHk2Y/1emdvzziwjGYU/V/ds?=
 =?us-ascii?Q?hHEwar6yT9NWAQ8m6M4tznFzvdm2T6HPuaiNLFwrTA64Z83TwDXg78O5TGSI?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d46d0f-4436-4107-35a2-08dc3e3bc2ea
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 00:15:57.5918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fioxN0PL2b3287dkZA+LW26jHYNCm7xeiTaJdfi6ovco+7+19OvmdkHpqoDsCaGWx0HchmsftW17c2LM8a0zjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7851
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

This patch brings no functional change. Since at this point of
the code we are already asserting a wakeref was held, it means
that we are with runtime_pm 'in_use' and in practical terms we
are only bumping the pm_runtime usage counter and moving on.

However, xe driver has a lockdep annotation that warned us that
if a sync resume was actually called at this point, we could have
a deadlock because we are inside the power_domains->lock locked
area and the resume would call the irq_reset, which would also
try to get the power_domains->lock.

For this reason, let's convert this call to a safer option and
calm lockdep on.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 6fd4fa52253a..4c5168a5bbf4 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -646,7 +646,7 @@ release_async_put_domains(struct i915_power_domains *power_domains,
 	 * power well disabling.
 	 */
 	assert_rpm_raw_wakeref_held(rpm);
-	wakeref = intel_runtime_pm_get(rpm);
+	wakeref = intel_runtime_pm_get_if_in_use(rpm);
 
 	for_each_power_domain(domain, mask) {
 		/* Clear before put, so put's sanity check is happy. */
-- 
2.43.2

