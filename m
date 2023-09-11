Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC70CA0EC3
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 22:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CEF10E081;
	Mon, 11 Sep 2023 22:17:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D12110E081
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Sep 2023 22:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694470620; x=1726006620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hFKJwsBFMmAB2R8vi+YjpG3Ci55rnZopzOcU3D1AF8c=;
 b=I4F88+cGSuyh1VTi0JGeXnpVltIn0Jf7b9eoIx6XVH4RJDnMiW8cRfDl
 kFnPon0tJkJpHeFohkpnCSC7joi449SXpBTQ3MkLws1ZKcf7bbi2a2GQ/
 hbKypgzot0gH/ZE5HQIK3pIrPFPyw4CVRCTh5oYxxWuaftHcWD9ZIoSEN
 ot6275N5+z/5ChiJK7H/QGoecf43jQWINqsT3pwMai+z06M+qmJFY4RfK
 KehArCc9XDo4QTs3S6KHC/5B/mKW/drFe8v9nv7ANAsHf+uzgX9N5Lci2
 vBu47vjl2hcmhogDJm25N7wp+27Cg+2sOmtrDQEyP55YfPGpMp0JbPLmz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="375553923"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="375553923"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 15:16:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="833662924"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="833662924"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 15:16:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 15:16:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 15:16:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 15:16:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPWWAa1jzb8wuktr0U2rY29mckmjMxRm5SeIhmhoOkwuJceky7nnGJ4+vl/THgDuLKWyRqbfbjDbx/2kxgJYh77MsOdZJskBO+Rx3R+M0+2cstgDE1SGqO3P53FOtj0tgIzyB2L2CywTCXI6tsuuBQ0r9ghHrnQDaKd2LrIos7dkffEUlGi0ZOu4dYYADEgFeGp9CIXqm0jSxj8maf1dqFxJBpV3mS9NVGnXWVYg5EKpBGUjmmmOuZQO1GZIq4kDcAFbz6/6L9FlMfxHOVTMu6q5bZpbYBYybjiS5RJYtX9MoFEB0B2DIahTEKzeNp6EU6Djkie1Zk8J/dPAvVPcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQ5NeKLhG2iMitSN0KvbhU5duDBa65W91sdg9xRVKxA=;
 b=V2TcYmQD1USSCUVCVcDYLQWYuROOY8mAusL2yv+/kTeKVLNgyouvnV4TQetyLEC8b0JdcLamYCIUW8QfgirtdpIRHebeeXPLjiCG78xKFvJvaEJp23slET9QXDvKJ3FMWtRH3cZCtJcRON4Cl5hTVDhodvhcdBmfZM8yWSDzVTwE4PeD4i56XXWuxLkRu0di/DpASUwMY4rjgnRnQI+yDq/AhWxOeYUEc2yD5eT/OGrjOfy4ncHn/R6JhlP97GOBSZROgCM21Kd1WhBL+fITdhPNAX5yQhPeKpKVqYf6XQ0mB9cbA3vqTjT5fnOvEu83JCh5JnS8JUqiIceTamjTXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5244.namprd11.prod.outlook.com (2603:10b6:408:135::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 22:16:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 22:16:56 +0000
Date: Mon, 11 Sep 2023 17:16:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <epofyqmatq4b5e65a6tcjyctdfnq24sxddkhzjp5dzjfwnlzcd@bs6c4effab3r>
References: <20230911194712.34387-1-gustavo.sousa@intel.com>
 <20230911194712.34387-2-gustavo.sousa@intel.com>
 <169446182644.19625.15721984345055872792@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <169446182644.19625.15721984345055872792@gjsousa-mobl2>
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5244:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc8712a-e2c9-4e69-110b-08dbb314cf5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8+zaumrOuh2HNSS22GcQTdUrsRLF29D1ge5QfzASxYMtNHHRKO/vNu2m6+JM7+GHzWcinhX//el9aelBDwPjZg5AoFnl52gOrDwDwNMxqG7Py0/9fSYQ9aGTEtDcTYm5q7iolAyqhk+E3KbtOrrFWhkpDF1bj3fFLqJeR2xLTqWCp6CkVy4EV44tVZ1P5K039c5A+Clb8+7g6TazbjjHRBfKCOarWquCvlKcUVC/BwxtNisUARo2HYuL+/sf33iWPKBiw0C+SGLLFHO1dhWz3j9X9XFlxhDBTlf6Mx4fnzZtJb+OLADhQUWaO5hvCFdVcqBo+v1Y2KtjjhDGpY7hiEe6lWecpRu3QyK8i5ds2uuNo0gIze2JkwwH7ymW1wzelJI8JJvA0/L1I44X8tFJlpezFnPau/VXlimAbyWkLuvE9MUJiCK4sGvrdhVuXatxLLBUtele0ncypfj0FPSJsYSs1bx5ZBZ+cxNZBMCIAbSpPpXSSL0s2DxQLBGq9v2UiQUp9sW7WJYLdiJrBcPT+mKxlzL6QgcPKM5hAkGQRUIWYuI15mT/pX7LXReW86uN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199024)(1800799009)(186009)(6666004)(6506007)(6486002)(38100700002)(82960400001)(86362001)(26005)(2906002)(9686003)(6512007)(478600001)(41300700001)(6636002)(4326008)(316002)(5660300002)(6862004)(8936002)(8676002)(83380400001)(66476007)(33716001)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ljmaZJjxISV6rNt/eHbA+Y2SfzAexIM9vAQDMz3YNK6OKe8ayiM8lNc5UMaz?=
 =?us-ascii?Q?Wnfsmyv6WUfrNyp7isgzy1yOVVW3F87NjXfWqaXUNEHxPbrUjXAzhXcrsQHy?=
 =?us-ascii?Q?PammXRYtgrVbreE+t8KDhzzehU76rttjIYy5BGuvP5sW7DPYwmlKW1I71HTp?=
 =?us-ascii?Q?CYWphc6x9GK9ZiYWcYrCmfjGA+5VoJk1RIf9Nnw0PANCAAjEFehBjWyn2dSx?=
 =?us-ascii?Q?ag7ycFRn3i7VpTbrjFOl3WKGfDUXkHbZFWuuLhI/3CpolghtiD/0mCbIrFI2?=
 =?us-ascii?Q?emWtn5hBUkCg0dpyRppkP79COXnZ1IRr8+BQENQ+hbO7p7fkytZbEXNvvDt2?=
 =?us-ascii?Q?d/TqRWJ4hybwZzyiwr8ChPI4K+6DkzTv+DTXk3oMv3zZLt8/noqYC+Aw6oyx?=
 =?us-ascii?Q?CBEJ1JwLJCqvBI9tZJ6EA5LfPxePFprdHNlpAEIk7Jy5hL2NVQbvQzEGed5Y?=
 =?us-ascii?Q?FsFmhOGl9MMFdHyo6mp+dFg/av3yibbN2Ch5c1Do3A6nmZpb9QlhPf9xIY7a?=
 =?us-ascii?Q?Z8yDz1zefciMdkFbgWnlL7faPOk2m70U18KsPjbLwYiBJ1Asb+ckdmiqSdF3?=
 =?us-ascii?Q?814miJWUIFpVHBXae5Xs/x5qf/QiXfJ/AqkcXETBC2q3ezfahdu0oPSWSRzM?=
 =?us-ascii?Q?jK0Wfx2/966NNOej3kWjaD8lqxlB4hLBIqa4vAlE66Seq/PoEVyFyv5W6RJf?=
 =?us-ascii?Q?DSxorKTaFI93PdvR2ziHjYgHjkpnjfv5sIPsRZB57bNvag0qVQx+xnaD0Cd0?=
 =?us-ascii?Q?7POZvlYurI0Qe4OaaJDmKYmHYH9llspwssk3YlCcgLtFnKgpMAWZ2u7l7TG3?=
 =?us-ascii?Q?UOrBFQMtDGPi02BWXvc7TIQuIhhFB7kdl+h2qPoTCeoX89u6qOHvRaxepP6W?=
 =?us-ascii?Q?urWB9JXqKjL6895rtB67OtDtbsUtIprLJ3OO8w+VO8mVNxY7rILMJLGNTdVg?=
 =?us-ascii?Q?9p5+aRZkUTucZX5v+qFPIkzFGm+SsYGhQarBqINhISTGCo90rhZep5QYOWY3?=
 =?us-ascii?Q?ANa2DfnyCjXVGbK0Ba/HneqJWOgOxMQ5SCUpFLG9P4RAiZljg2ZdY2mWnx/8?=
 =?us-ascii?Q?erY4hAm3ukvUjMCsh5fF9Bmldgnqt3i3ScvXGgMzOjyx2BqfyRNmKJcZRrSZ?=
 =?us-ascii?Q?qqgS1gfou1lb37Y1sAmdXRTsf3ke0oOwy7WhZNbMLemvyvAJssZZWoiayHUa?=
 =?us-ascii?Q?3CHo2XX6OM8GSMqUQsGCHkHXfj+o0UFJUvtO3lBE+ESDqcY2gHHSgRqZgbnL?=
 =?us-ascii?Q?U/BYFttNrNRbkt7+pxD8AdiP8tttw/QzoyQuuLpTESTd1EYnYXeDydM3FXlj?=
 =?us-ascii?Q?haytDJpWvlnnyDq+dwXZ2FDVs4btEtuIYmSKBcsVJO9ERTpcNFuz/WqFT/Wg?=
 =?us-ascii?Q?1ldvw49sudJK4m0jCjGuiQ1DhSMTu5Y6qJ9P5I0ni/fIrmMLcCBMO7XpEVdX?=
 =?us-ascii?Q?8Mg539lglJBSji4IBnMUwxCVfOv2ACu+1LVdSXFX/nAtHhrUVaT/etvw/uEG?=
 =?us-ascii?Q?wF10vud4x4ex9bkjSBEDN0jYMj+T5knRtX0nmox9p/l0m0EBp8btAu8q7ABe?=
 =?us-ascii?Q?K1XhEFEdErgb4RUZskCOtUpafZ7IRc8prqMFYs9fslbwGGkZr3LUG0ppyKSz?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc8712a-e2c9-4e69-110b-08dbb314cf5d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 22:16:56.5715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtuHTzkvdO7RxRrNvTyBNd6ebq8kELucv99avqYzHNYYGvl0E3q5ghjP2IErkHIgCzwhaKxdCcizrAqNdqT6fi9/05kupD6oNfkET4AmEoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5244
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] fixup! drm/xe/display: Implement
 display support
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

On Mon, Sep 11, 2023 at 04:50:26PM -0300, Gustavo Sousa wrote:
>Quoting Gustavo Sousa (2023-09-11 16:47:12-03:00)
>>Finalizer counterparts of display initializers are registered with
>>drmm_add_action_or_reset(). Since there are no other explicit users of
>>them outside of xe_display.c, let's turn them into static functions.
>>
>>While at it, since this is a fixup patch, also do other cleanups
>>suggested by Lucas:
>>
>>    * s/xe_display_modset_driver_remove/xe_display_driver_remove/
>>
>>    * Remove the unused xe_display_enable()
>>
>>    * s,xe_display_unlink,xe_display_fini,
>>
>>      The original suggestion for the above was to replace with
>>      xe_display_shutdown, but I went with xe_display_fini to be
>>      consistent with the other "stepped" display finalizers.
>
>Hey Lucas,
>
>Please let me know if your r-b stands with this slight deviation from your
>suggestion.

I personally prefer the _shutdown, but I don't mind. At one point we
have to go back and unify the names we use. See below

>
>--
>Gustavo Sousa
>
>>
>>    * Group functions in the header by namespaces.
>>
>>v2:
>>  - Add more cleanups. (Lucas)
>>
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_device.c  |  8 ++++----
>> drivers/gpu/drm/xe/xe_display.c | 10 +++++-----
>> drivers/gpu/drm/xe/xe_display.h | 33 ++++++---------------------------
>> 3 files changed, 15 insertions(+), 36 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>index 109aeb25d19c..a964dc205da9 100644
>>--- a/drivers/gpu/drm/xe/xe_device.c
>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>@@ -342,12 +342,12 @@ int xe_device_probe(struct xe_device *xe)
>>         return 0;
>>
>> err_fini_display:
>>-        xe_display_modset_driver_remove(xe);
>>+        xe_display_driver_remove(xe);
>>
>> err_irq_shutdown:
>>         xe_irq_shutdown(xe);

	   ^^  here

>> err:
>>-        xe_display_unlink(xe);
>>+        xe_display_fini(xe);
>>         return err;
>> }
>>
>>@@ -356,14 +356,14 @@ static void xe_device_remove_display(struct xe_device *xe)
>>         xe_display_unregister(xe);
>>
>>         drm_dev_unplug(&xe->drm);
>>-        xe_display_modset_driver_remove(xe);
>>+        xe_display_driver_remove(xe);
>> }
>>
>> void xe_device_remove(struct xe_device *xe)
>> {
>>         xe_device_remove_display(xe);
>>
>>-        xe_display_unlink(xe);
>>+        xe_display_fini(xe);
>>
>>         xe_irq_shutdown(xe);

	   ^^ and here

but yes, I do see _fini being used in other places.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>> }
>>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>>index a453946ad108..37278f73cb39 100644
>>--- a/drivers/gpu/drm/xe/xe_display.c
>>+++ b/drivers/gpu/drm/xe/xe_display.c
>>@@ -132,7 +132,7 @@ int xe_display_create(struct xe_device *xe)
>>         return 0;
>> }
>>
>>-void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
>>+static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
>> {
>>         struct xe_device *xe = to_xe_device(dev);
>>
>>@@ -164,7 +164,7 @@ int xe_display_init_nommio(struct xe_device *xe)
>>         return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommio, xe);
>> }
>>
>>-void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
>>+static void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
>> {
>>         struct xe_device *xe = to_xe_device(dev);
>>
>>@@ -204,7 +204,7 @@ int xe_display_init_noirq(struct xe_device *xe)
>>         return drmm_add_action_or_reset(&xe->drm, xe_display_fini_noirq, NULL);
>> }
>>
>>-void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
>>+static void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
>> {
>>         struct xe_device *xe = to_xe_device(dev);
>>
>>@@ -236,7 +236,7 @@ int xe_display_init(struct xe_device *xe)
>>         return intel_display_driver_probe(xe);
>> }
>>
>>-void xe_display_unlink(struct xe_device *xe)
>>+void xe_display_fini(struct xe_device *xe)
>> {
>>         if (!xe->info.enable_display)
>>                 return;
>>@@ -269,7 +269,7 @@ void xe_display_unregister(struct xe_device *xe)
>>         intel_display_driver_unregister(xe);
>> }
>>
>>-void xe_display_modset_driver_remove(struct xe_device *xe)
>>+void xe_display_driver_remove(struct xe_device *xe)
>> {
>>         if (!xe->info.enable_display)
>>                 return;
>>diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
>>index 9e29de012df7..de835d459255 100644
>>--- a/drivers/gpu/drm/xe/xe_display.h
>>+++ b/drivers/gpu/drm/xe/xe_display.h
>>@@ -14,30 +14,23 @@ struct drm_driver;
>>
>> int xe_display_driver_probe_defer(struct pci_dev *pdev);
>> void xe_display_driver_set_hooks(struct drm_driver *driver);
>>+void xe_display_driver_remove(struct xe_device *xe);
>>
>> int xe_display_create(struct xe_device *xe);
>>
>> void xe_display_info_init(struct xe_device *xe);
>>
>> int xe_display_init_nommio(struct xe_device *xe);
>>-void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
>>-
>> int xe_display_init_noirq(struct xe_device *xe);
>>-void xe_display_fini_noirq(struct drm_device *dev, void *dummy);
>>-
>> int xe_display_init_noaccel(struct xe_device *xe);
>>-void xe_display_fini_noaccel(struct drm_device *dev, void *dummy);
>>-
>> int xe_display_init(struct xe_device *xe);
>>-void xe_display_unlink(struct xe_device *xe);
>>+void xe_display_fini(struct xe_device *xe);
>>
>> void xe_display_register(struct xe_device *xe);
>> void xe_display_unregister(struct xe_device *xe);
>>-void xe_display_modset_driver_remove(struct xe_device *xe);
>>
>> void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl);
>> void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
>>-
>> void xe_display_irq_reset(struct xe_device *xe);
>> void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
>>
>>@@ -49,35 +42,21 @@ void xe_display_pm_resume(struct xe_device *xe);
>> #else
>>
>> static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { return 0; }
>>-
>> static inline void xe_display_driver_set_hooks(struct drm_driver *driver) { }
>>+static inline void xe_display_driver_remove(struct xe_device *xe) {}
>>
>>-static inline int
>>-xe_display_create(struct xe_device *xe) { return 0; }
>>+static inline int xe_display_create(struct xe_device *xe) { return 0; }
>>
>> static inline void xe_display_info_init(struct xe_device *xe) { }
>>
>>-static inline int
>>-xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
>>-
>>-static inline int
>>-xe_display_init_nommio(struct xe_device *xe) { return 0; }
>>-static inline void xe_display_fini_nommio(struct drm_device *dev, void *dummy) {}
>>-
>>+static inline int xe_display_init_nommio(struct xe_device *xe) { return 0; }
>> static inline int xe_display_init_noirq(struct xe_device *xe) { return 0; }
>>-
>>-static inline void
>>-xe_display_fini_noirq(struct drm_device *dev, void *dummy) {}
>>-
>> static inline int xe_display_init_noaccel(struct xe_device *xe) { return 0; }
>>-static inline void xe_display_fini_noaccel(struct drm_device *dev, void *dummy) {}
>>-
>> static inline int xe_display_init(struct xe_device *xe) { return 0; }
>>-static inline void xe_display_unlink(struct xe_device *xe) {}
>>+static inline void xe_display_fini(struct xe_device *xe) {}
>>
>> static inline void xe_display_register(struct xe_device *xe) {}
>> static inline void xe_display_unregister(struct xe_device *xe) {}
>>-static inline void xe_display_modset_driver_remove(struct xe_device *xe) {}
>>
>> static inline void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl) {}
>> static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir) {}
>>--
>>2.42.0
>>
