Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B06DC46CD4
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1003D10E1D6;
	Thu, 28 Dec 2023 02:13:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC54710E25A
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729610; x=1735265610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ydqWp1XtEiIdzgjYHGNkfwor20UzuVenWZcpxZ67F00=;
 b=WS3WTocd2eOcT+663li7ggnazDP9/PbW1ZapS6/9IFYfXe+OfQuCU6nb
 PL/Sk7kcoLH3lq8xiNZQ8ofdSoXUzYJehTp6KHxmdAJBNqJwV+ZBJ+Spq
 9sz932D3ARHgjJaA6aPDQ3epmAEI2Yi2lbElhXFYXx+bTFlC1cNqn9Lw2
 PQJJkG7Z1XTM6mNRbBI0vVqQFh6YQ4x6dLx1FL/99yDDl1Lzl++OQJIU3
 3oea4VoWUgUbR3KeO0NXKgroUeBoWg8sWO9J53zsuYTaTScTZXpswuVn5
 DCkstydXBtlQey8d9RtMxRh65ahHWxodTYYna8N4NCRRrYEz5GB59/WvH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="10062203"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="10062203"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:13:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="869014358"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="869014358"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:13:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:29 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:13:29 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjapX5sk33fgYDHAIzPEP7z5OaK25A6XNi8CAIBbuK2T5+TazM/xR3s0RMBnfQAW9/gv/ECFX0Ve3zgvdbvep5cWb0G0Irj3MDq6b0zYoAVGOuCzFm8ym6NMNRLdD0R4u7Ltoh2vs+zudtI0GThHGvzsfbi1nnDMgaET0fcDIiBQyDQKI9ntUJtqf10L1Hpa95dfG5DBKfwkZgrCVuv+47tTgi4AUglx0Le2Oo7T4zYljsL/r7nVCB0Ii2kR6PmsPadzH6ow645y0stfPT8d+PY460GLrzuiKIKiQ4O+jNj+J/PnyvPsMnNgjTNyAmXqODFANiyr1qiIf5+64P5HMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOdS7yEuf2wjdeVeJq28zx2pczWD85wlU8J29CuwwLY=;
 b=FGdXG5IA7vuJtwQgbD03kfa7s+r/plyN2XjSx1HTdjYM5/cuyIQ1NYoy2cG8LuxCENPQnRnwAUE2LjuK+p26Do7yHJBwcG3ccPGNDu99P3DrRxbmIXC5jL/z4Ku+OODtHwxP0Xja7Iu04/hxasEvkS6xwE2qO0uP3RwbzcRE7b4YVF04fOKBLijUvAWH9xVE2cRxARV6chhrPUzcompl+kYCESuFRjc7Lhx5CrOsFClwmFeUVL6+VVo/fwHawMkkIVlFuRyozIw5CnGYY0BUJYX8MybcEqjydHeUwHbKMqp+MqjbYHtuxAq8dFO1KgaGIR6OvzIy9K8YCwUpLXhBaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:13:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:13:27 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 15/20] drm/xe: Allow GuC CT fast path and worker regardless of
 runtime_pm
Date: Wed, 27 Dec 2023 21:12:27 -0500
Message-ID: <20231228021232.2366249-16-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:332::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf343af-5efc-4e49-78a3-08dc074a93e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CHTcvM3PEFr2umY9KuSPQjEec/IGpwCGTwnc5I4ZhBxx9T5I87FYmcOM4tU4TNabX/zq5U1BYGuKvBwMr9hW371XQfPkmoveXL5ZeT7GGlDHdXOZdy9EzgQkiYyxQJr/M+Z5mdXdocyhnMizS1kB299ztkhvHJewuoctE1aENCaHfbL40BxqKK6f4K+YuNgxzVEBEn6YXX8+35PXkM34N91aYtcbKO7yZIoM3QlzFKQm2OyCUd+TnLbCs8OFIfq2ILhfE6PGD9FJgHJlPG3NNEZuob8/zFnpja91oB4m5+YEEu0/7W+gndrZ0N7xfrHaNElR0T2MGuwI9aBgo5PUtfmEMuhEhuHfKL0dCZIsxazzMwI5/VB6oSajSDmNh1BebK5L1ZRBkH+rsktlGqJHTCJB1A8Lc7CIlHaz2wH01+NJO+xF1PYZdnAp9L7IAeFuJjd2EH6MDORvld42idPF/OrWFoPJ/sl8Q1zWmqMEAllsCaau8NeQN2pAJXLZaxNRN26eZ4Aw/N9f1U0dvm+b/Bn2p8bdvk+GE6NMMB+MRDmSdNpL1EPhK+523ixJbDs8ACqRWe2N0XUQnaJLh5OcfA9CrfYbe9gCBQa9Gslv8tI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002)(26953001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EbEkmmeWiRBEDrnXo8LoVk91C6ciGLa5R7ADzjYNzXACZp3nANK5HePDJMb6?=
 =?us-ascii?Q?EQMhVsKFUmkGvavhX5bU/QuLn6v0f++eLxON2aasG93e4WgHKz/EE41fE2jU?=
 =?us-ascii?Q?fCqdYvl97ms3UJ/jy658K34070s3o2ECWdDKC0f65fEVUEVWbb5j0wO+9mya?=
 =?us-ascii?Q?RXGRnJZRAFWRUCUHRkR0Oj9PgO3yFijB4luoxOlwBb6XLgbRovB5X1qdDYok?=
 =?us-ascii?Q?3iznBbeYQhFwpIuTwaprzsNQmPDouYwO34oO+wO+j3Cm+gFSgM57FibBu3mb?=
 =?us-ascii?Q?M9ojPQEEvJza1ObAb75VDf9KAQrFK0GWVIJnwNkpgJZ6VVPkc7sooDD/4fA0?=
 =?us-ascii?Q?EswWMX0w5EkX1PV6DAbxcynvGSUfkl5IkD/MqRaT58AmSDopmGk/CXnxNOjR?=
 =?us-ascii?Q?fjPS/Evn4PsYtUVBN3y/BkR12qxvH4TN6n5PL5eCUEEdnfnXxFYmUKPlIQT0?=
 =?us-ascii?Q?vBxkQ15M4M6s+Y95rNd5ecg+FdX5182ev92eMOjP38aRMTfUlwUCNb0hIHXi?=
 =?us-ascii?Q?13vn/HCnGLzIKG2g/iq3aRwjYCpEyJQ7HSZBdgBxtrAyiQqK0WYqnbibGGuR?=
 =?us-ascii?Q?IFTVzIIPMZIaUI5smdT1DTMoyYPsSxoqUwfurmwa2amb17VCMd6D5ZZiuw9e?=
 =?us-ascii?Q?8D0pL810AbBQIJQgzDVkr4E2ZyjcIlIWBgF/FKo+Ie4j/mb0GfYoGLXjxyET?=
 =?us-ascii?Q?5bqQsTAak75t5LwhEMEvok8YSCgEI3gav2IYhLY5+9HCx23oSc3ReqT26N44?=
 =?us-ascii?Q?qeoA0D7sgnjyE5cbb5GOhznqBw6ORqMxQmogoD6kcNco1tnmW3DqeHTXKdyV?=
 =?us-ascii?Q?6ndCBjgOma3WnpksdYjFDXP0WZArjoTILaImvr8jkLPFjYZQdrWyol++f4Ha?=
 =?us-ascii?Q?VKbugNpQutj09OY+IZ7bPkJPjrqIiN3qrhaXCiDJ+1DFleQFUppSlOPzk0VF?=
 =?us-ascii?Q?UD4UmXajIl0igZ0CP8MHTI6q0RCYpJzDTL48YQguw1Ii0dGtnoA1zdKwsmn/?=
 =?us-ascii?Q?aaWujj3yXmWTdSUhdHDOm4fM2JRTVerymP7uZ5Hels1X5IwZdxU7cEz7ghNl?=
 =?us-ascii?Q?WzIY4KHIYMbOv381cqxd8Ao1NOECyvOPI2D01jGYqQW/95pW9wInKzwIuPsd?=
 =?us-ascii?Q?1/7cYPbHAiH4cEPxrJeyrYL0IEPkYoREKTOId9WBJU4yzCRabmhMxz9cqSZl?=
 =?us-ascii?Q?4Thcf8izfsdHBoSHFTLrOQq0p/8Eqtsm2Lr2g6lEgL8d1zdQzc59P6U/HdMU?=
 =?us-ascii?Q?p2+ldr9mAN987cu0VFoS1qxyQYkAJQdy3sU9pFKtPE2oXW614zSchwl7iPqq?=
 =?us-ascii?Q?fcaJQmUD/oZ9Pl+DbBUpRF09TTygmz+XC0vuRge//GLx+gQAWKurgfurkvjI?=
 =?us-ascii?Q?KKgE71PdNk+x53UOfdrg4lsCchYfMHaKShi0f/FBw22erUVg4SsAxHs9OsNI?=
 =?us-ascii?Q?jQLjWcJajRxcMmhUX0n24p+uFVPzBrQ7lH0ZlCibTUMixes2yzkJ91ZuDjTl?=
 =?us-ascii?Q?oTdI0NoG9zzgFB0Vc0XHOVmxti5wKHAfPxthK7Ont9fhY49RTJhaqi7Pic/X?=
 =?us-ascii?Q?h683T4RwbJ8kOMyayObXOkKipTnjnRz91mAfWUV0B2KJRwjzy4H+z0j0pn/7?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf343af-5efc-4e49-78a3-08dc074a93e8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:13:27.2335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n43Y/+E6DpgPQmyuC2ejZWmg2iIpa5tpFhhEvByO8Dva26ZZ8yM+j6+an862kwck8Wtj3fIuFhslPd3AQl6bIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

First of all, this !ongoing && !from_runtime_functions seems a case that
should not happen and be bad anyway. So, let's at least stop doing
the workaround and if we find the case again we need to find in which
outer bound we need to protect this access, or another real condition.

On top of that we are now protecting more outer bounds instead of
a more granular memory access, so we might be fine. Or maybe ensure
that we really shut off GuC on these conditions.

Anyway, let's proceed with our killing of the memory_access callers
for now.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 40 ----------------------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 4cde93c18a2d4..7e68ef69ca8d5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1096,14 +1096,8 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
  */
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 {
-	struct xe_device *xe = ct_to_xe(ct);
-	bool ongoing;
 	int len;
 
-	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
-	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
-		return;
-
 	spin_lock(&ct->fast_lock);
 	do {
 		len = g2h_read(ct, ct->fast_msg, true);
@@ -1111,9 +1105,6 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 			g2h_fast_path(ct, ct->fast_msg, len);
 	} while (len > 0);
 	spin_unlock(&ct->fast_lock);
-
-	if (ongoing)
-		xe_device_mem_access_put(xe);
 }
 
 /* Returns less than zero on error, 0 on done, 1 on more available */
@@ -1144,36 +1135,8 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
 static void g2h_worker_func(struct work_struct *w)
 {
 	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
-	bool ongoing;
 	int ret;
 
-	/*
-	 * Normal users must always hold mem_access.ref around CT calls. However
-	 * during the runtime pm callbacks we rely on CT to talk to the GuC, but
-	 * at this stage we can't rely on mem_access.ref and even the
-	 * callback_task will be different than current.  For such cases we just
-	 * need to ensure we always process the responses from any blocking
-	 * ct_send requests or where we otherwise expect some response when
-	 * initiated from those callbacks (which will need to wait for the below
-	 * dequeue_one_g2h()).  The dequeue_one_g2h() will gracefully fail if
-	 * the device has suspended to the point that the CT communication has
-	 * been disabled.
-	 *
-	 * If we are inside the runtime pm callback, we can be the only task
-	 * still issuing CT requests (since that requires having the
-	 * mem_access.ref).  It seems like it might in theory be possible to
-	 * receive unsolicited events from the GuC just as we are
-	 * suspending-resuming, but those will currently anyway be lost when
-	 * eventually exiting from suspend, hence no need to wake up the device
-	 * here. If we ever need something stronger than get_if_ongoing() then
-	 * we need to be careful with blocking the pm callbacks from getting CT
-	 * responses, if the worker here is blocked on those callbacks
-	 * completing, creating a deadlock.
-	 */
-	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
-	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
-		return;
-
 	do {
 		mutex_lock(&ct->lock);
 		ret = dequeue_one_g2h(ct);
@@ -1187,9 +1150,6 @@ static void g2h_worker_func(struct work_struct *w)
 			kick_reset(ct);
 		}
 	} while (ret == 1);
-
-	if (ongoing)
-		xe_device_mem_access_put(ct_to_xe(ct));
 }
 
 static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
-- 
2.43.0

