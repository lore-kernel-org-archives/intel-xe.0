Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8324EEEB562
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 17:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FE510E0D8;
	Fri,  8 Sep 2023 17:41:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A1410E0B1
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 17:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694194914; x=1725730914;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qcgHajnv58npa4KcJsFtveg8KxVoWG+b4j+DXuzZgpM=;
 b=HDGmtlwnCcpaYD5+8F4QuxCz0W25VxnBKeR1aWmz4do7Nj9nCnP6L/t2
 5IWiF8oiREXo4EfKJZ6YmHHBhzL1sx8LXll/6EE44/dUk8GDYlnwcSFrv
 wK0aZw4VE4pZ0cSwZhRnbtx1hJN0YPBBrouD06+nVClmBNCxT9NiimYKl
 GMNSpbhm2xB8NH+RSY/CFgdSih3ecSSRErazqEUx5jT1bViDe7GTd5JGR
 mcR/O7KgsolHlN0P5aV2Moq6ca4bk1gZ34rbHdFR5Fc0kKmVKNW1+hHmS
 +VXDN4rJ52FnJg7dq0QupGfct0fJCayzRKtP+Jqd5OVYbuYSETRNgL42J w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="375085288"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="375085288"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 10:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="719226459"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="719226459"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2023 10:41:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 10:41:52 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 10:41:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 8 Sep 2023 10:41:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 8 Sep 2023 10:41:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKOmNy5ou5YfMoXZAm30ERm66q+dNAdk6xcRa/7h3vcuigHPYlwi/ShpffEOOboyURLjFuwg7MHRYjvF4W78EqieRFiWRrdD//NbCzBHiiRJq0CJIEyCQaDA7MQ9WhCO7icoWbewHT1hD56bOmToZ0Qf8iJOGP2FOiRTxdrbyrXMnZTIAcan7zdvpQyqOYsTrdJe5BukLAnx6kuQWNrQu7QxeQzpyF+JkHsvpQR+oXXHVcjMd0Ovgg9c3j3n104WwXuVWXstvmotP4n2aOKl1zSHpt8FKBdvJnpQmHOB0Wss3pxcQINjWECb3fCT3MNXL0RNxfTNBa8BOILbb3VNFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQFtDrNjq4eLo77DbH016OFgZ+Y35FjdaT/DNDHN2SM=;
 b=Dqw8ePxAEtTm8+7uzfses/oWa2K3lJ8z3px5JHKA30YTwObkzT3Ev5VdljfzgPwxwU3/6HX0jUrQ+/NxzqHLEFtBXQ2Ax8qk0xAioHcjI/itpEmOQugBXJrLDJxLYE+s16kdLEu84vhMsRGEhIm5Rbkd8rzGhDWKtUiUn5h2V2OsmBpLcComa8vGJZuojAeAGPasIRWrAhx+DZ90l2Er59HxpznZksNmUVOuMARTe1SYWUFY8Y17yAmcnROLWCGYIVvtmQ3OFxqoHUBjXafmKDtJQmy/DEV/aPw3y7b0zOD1IVFnpZtF9D86/rkF/u1NNtjQKxyo1ZquWo5ZHOXTjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8137.namprd11.prod.outlook.com (2603:10b6:610:15c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 17:41:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 17:41:44 +0000
Date: Fri, 8 Sep 2023 12:41:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <lbts7bewsd7ufqwx275cdqdwn5zokvpvag772oy4vob3t7hv2r@kausargoejul>
References: <20230908144235.33628-1-gustavo.sousa@intel.com>
 <20230908144235.33628-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230908144235.33628-2-gustavo.sousa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: 74bca65c-d169-433f-b44c-08dbb092de47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KPwHIssouNdlMJtUfUwxHeebW8DIjfThBOqexCbUgu2DU+M2Mf7UB1E1S+uv9nvhPxV/RjOaXnbdrIOEBEP5OlPvzh+eCn4eD2N8k5tZpQSftoyG7wgPrf+Bc1nC7PfOU/Lugj891bWosJZx6JqdE0Sp+J2jly43oKiomgqQz/hK5Rf5FH0/WsxYDInpEI5nSUwSY7zWCNeeUSux80xvd2aoT4srsooo57ktjIeaqSAk0yynJ3VQizty/B75s/QDv8kDYmotcs5dRPj7/hgtZjjf4cPCCkLfIDza9mr0rxSTaZs19d12lIdoKbpKjcXhwGCgCkePp9V1Hy5Ucb3Ojj2IMo6qWoD2BUxvmd4/w9K9SKFSOOT+XzxWhkL/H+vW4q6EwU/mnjUddYG8BUyE3wlZSSd+5zbXeZP1g5IKSsdA3dw10/nbcyitS2WPIp2fZzmaxwWCfW0vUxsGPaK8MQoBbMha6ov9AnzBFbbj7e3Ea0WNHjKRAAPB0hQITJeqbunieMo4YmoWuCS4qopYtamiochN+RYymDBalCYxkjclCN9RyRqOC/aeeOvM/PzFeI297pmCgeNxTWwjhxAsHhBkXN8aRGnmCHOHvSxFSNwKzPhPZmby0UvsyMzKiwTG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(376002)(136003)(39860400002)(346002)(1800799009)(451199024)(186009)(6506007)(6486002)(4326008)(82960400001)(9686003)(38100700002)(86362001)(2906002)(83380400001)(6512007)(478600001)(41300700001)(8676002)(6636002)(5660300002)(8936002)(26005)(6862004)(316002)(66476007)(66556008)(33716001)(66946007)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KXD7tcxkSM++ipRQN9PmL6Vv2rroA47Sj8Jn4YyAcml3TZHzjeW8Z5lxBqi/?=
 =?us-ascii?Q?zKIx3vTuYWCRhOsrIzEblMQEg2bBSyrkiFLRiNV66zWIhrZiBbQMBAi4nRfX?=
 =?us-ascii?Q?oKlbb90dC7wLtpeXLC62MqebWcEWHDW1Z0j98CNVvpxvy2v9PvsmZs5c8rMK?=
 =?us-ascii?Q?60mxbVbN2MpkYoZwHWguU5EgOsOXaXYFbb92HNzWiak7MpFoGyeG1p1l+94U?=
 =?us-ascii?Q?8olsFlD/mRQnkhjKGM40DP684XF5wdKGM7XhsIEmrXxf8+4OVEyLcn/lX4ud?=
 =?us-ascii?Q?9UjSja/RhO26aFERrNswYWgZvZMAQsrezZDko5vECE+t21pyQQRJiVWBdrqX?=
 =?us-ascii?Q?/s7DPqqULf5jTsAdrzJsfvE9gtn8gb4bcfeaT1f+uCfC1WKnOBaWi/AhUwoA?=
 =?us-ascii?Q?76l8cy9vxXQGxHl8pGgk/ht9hCqaF/7sqO1YC2rh0dAbLhUcir+oRCLfrblb?=
 =?us-ascii?Q?bKedbfDsSlkTIr8Y9co5MfXBSbz8vf9lPctE52RBRYKJDXU6La6/RELj4g3J?=
 =?us-ascii?Q?/Q3FV//d5nVew6WYBnxElDZHOavRjyvF+H0NoLVtKZoP7KeUBs8V0HhzkQZM?=
 =?us-ascii?Q?XzHYHNyGSRZEPwK1t2YNhJ7rqtCXGXKerWQdGD+r7uMQKmcbuy/nEL7OEpZR?=
 =?us-ascii?Q?/sP6uFJfePSuVI9db3gb4VdNvzbYWjlJfaUbzzrFHhLOT2zfyh85GMTKzV1V?=
 =?us-ascii?Q?yQWP27CCuhDpUS953E0lzw+HSMK1vpFw0KFWnIgqDr7oxlaha3vojBbxxqvw?=
 =?us-ascii?Q?9LiYN9qaD5NH8gUAOooTwqDhvcOD2hQCenbrDDtbIQkQ6e8QgkFqkSJbGRBp?=
 =?us-ascii?Q?soe4C7skfx0BeA3kTgfvSfs1k7yTb3gSTlEv468lXvvGKlUZVEKf9JSYYA3U?=
 =?us-ascii?Q?nlDaxxVbchMppiT0Z/XzPsraKvb4FPWxRGoroKEeJ3afsu/I4ba1WomMv25Q?=
 =?us-ascii?Q?bNQ0QFZ0Idat6i0V45Zt940BLMGkWqSIVCkdmXmuDhn3ptt/VQgvMrkdTK73?=
 =?us-ascii?Q?ILU5XMMoTkbJdoJ/2gC4azyz1Y1gV1vubj4uLzdbEhxr2csV0nyxF34XxA2p?=
 =?us-ascii?Q?QKSus3Ft9KX5wKGf0kZVwPPYgRtp/c59pRARAcWhlTw6P83HtqmQyvIRONEc?=
 =?us-ascii?Q?ffPvc+LMfX/3d64dNchhv2aiR0LxyZZXt85I7dZ7dsrYRFmgPkVdO0sXoh2a?=
 =?us-ascii?Q?/RRbrau8W2KuB7P88G3hCt2aKZUFy3223Xs+PoyFDAFnGB+svOliJuuCTJWH?=
 =?us-ascii?Q?1ZljlJnZIspnsMcaljOPxbGPzuhw4983UmafaJOqdNK37Ytwjdxg1NCUBckk?=
 =?us-ascii?Q?jVkbAZ81jxbpXKvU+SNdGSTip7u+mVHNPJoNwvDBj8gKyAOyDSrhOadlngID?=
 =?us-ascii?Q?yeJZ6XxEfaShBqi9iY/S3gtWTRjv2VaK8iUENx4dR8OmSCzjVodq8yDkeXFd?=
 =?us-ascii?Q?ElWWAg3s/tXuiC/mwmyvnYIjgalnV8AVeXppAYbJOF730QPsfa4Bd0EyQW9l?=
 =?us-ascii?Q?N6eiWjEtN3KxRiAdheeYHuJXrS4OAzX1XXsp9ynZsegr1pY5N4HmGpjyuft5?=
 =?us-ascii?Q?dp9arlecLeJc3yuMzgKI6RswTadfo9pl0Z8FmKEwa2uikE2coxZU+/OVji4y?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bca65c-d169-433f-b44c-08dbb092de47
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 17:41:44.6951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMaceIKd5cjQ0vMXSw6/JkugparUdCcMa33G9c8F/3A05lRlZ/sErMZOd7nzJ6vOoMuCr3Bb1it4NWAFe53dJrMvSuTD68WD8XRdyTxLKp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8137
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] fixup! drm/xe/display: Implement display
 support
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

On Fri, Sep 08, 2023 at 11:42:35AM -0300, Gustavo Sousa wrote:
>Finalizer counterparts of display initializers are registered with
>drmm_add_action_or_reset(). Since there are no other explicit users of
>them outside of xe_display.c, let's turn them into static functions.
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

since this is a fixup patch, what about squeezing a few more renames
and cleanups?

1) xe_display_modset_driver_remove()... there was a typo
    s/modset/modeset/ but I think just using xe_display_driver would
    be better
2) Group functions by namespace
3) Remove unused inline function
4) s/unlink/shutdown/ to follow naming nearby


Lucas De Marchi

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b3ecbbd6d020b..0141fd53a41cf 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -344,12 +344,12 @@ int xe_device_probe(struct xe_device *xe)
  	return 0;
  
  err_fini_display:
-	xe_display_modset_driver_remove(xe);
+	xe_display_driver_remove(xe);
  
  err_irq_shutdown:
  	xe_irq_shutdown(xe);
  err:
-	xe_display_unlink(xe);
+	xe_display_shutdown(xe);
  	return err;
  }
  
@@ -358,14 +358,14 @@ static void xe_device_remove_display(struct xe_device *xe)
  	xe_display_unregister(xe);
  
  	drm_dev_unplug(&xe->drm);
-	xe_display_modset_driver_remove(xe);
+	xe_display_driver_remove(xe);
  }
  
  void xe_device_remove(struct xe_device *xe)
  {
  	xe_device_remove_display(xe);
  
-	xe_display_unlink(xe);
+	xe_display_shutdown(xe);
  
  	xe_irq_shutdown(xe);
  }
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 3d15d3ac431f9..32b703af44931 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -236,7 +236,7 @@ int xe_display_init(struct xe_device *xe)
  	return intel_display_driver_probe(xe);
  }
  
-void xe_display_unlink(struct xe_device *xe)
+void xe_display_shutdown(struct xe_device *xe)
  {
  	if (!xe->info.enable_display)
  		return;
@@ -269,7 +269,7 @@ void xe_display_unregister(struct xe_device *xe)
  	intel_display_driver_unregister(xe);
  }
  
-void xe_display_modset_driver_remove(struct xe_device *xe)
+void xe_display_driver_remove(struct xe_device *xe)
  {
  	if (!xe->info.enable_display)
  		return;
diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
index 71e0bd27f1ebe..7e05b4737b0e8 100644
--- a/drivers/gpu/drm/xe/xe_display.h
+++ b/drivers/gpu/drm/xe/xe_display.h
@@ -14,6 +14,7 @@ struct drm_driver;
  
  int xe_display_driver_probe_defer(struct pci_dev *pdev);
  void xe_display_driver_set_hooks(struct drm_driver *driver);
+void xe_display_driver_remove(struct xe_device *xe);
  
  int xe_display_create(struct xe_device *xe);
  
@@ -22,17 +23,14 @@ void xe_display_info_init(struct xe_device *xe);
  int xe_display_init_nommio(struct xe_device *xe);
  int xe_display_init_noirq(struct xe_device *xe);
  int xe_display_init_noaccel(struct xe_device *xe);
-
  int xe_display_init(struct xe_device *xe);
-void xe_display_unlink(struct xe_device *xe);
+void xe_display_shutdown(struct xe_device *xe);
  
  void xe_display_register(struct xe_device *xe);
  void xe_display_unregister(struct xe_device *xe);
-void xe_display_modset_driver_remove(struct xe_device *xe);
  
  void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl);
  void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
-
  void xe_display_irq_reset(struct xe_device *xe);
  void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
  
@@ -44,27 +42,21 @@ void xe_display_pm_resume(struct xe_device *xe);
  #else
  
  static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { return 0; }
-
  static inline void xe_display_driver_set_hooks(struct drm_driver *driver) { }
+static inline void xe_display_driver_remove(struct xe_device *xe) {}
  
-static inline int
-xe_display_create(struct xe_device *xe) { return 0; }
+static inline int xe_display_create(struct xe_device *xe) { return 0; }
  
  static inline void xe_display_info_init(struct xe_device *xe) { }
  
-static inline int
-xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
-
  static inline int xe_display_init_nommio(struct xe_device *xe) { return 0; }
  static inline int xe_display_init_noirq(struct xe_device *xe) { return 0; }
  static inline int xe_display_init_noaccel(struct xe_device *xe) { return 0; }
-
  static inline int xe_display_init(struct xe_device *xe) { return 0; }
-static inline void xe_display_unlink(struct xe_device *xe) {}
+static inline void xe_display_shutdown(struct xe_device *xe) {}
  
  static inline void xe_display_register(struct xe_device *xe) {}
  static inline void xe_display_unregister(struct xe_device *xe) {}
-static inline void xe_display_modset_driver_remove(struct xe_device *xe) {}
  
  static inline void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl) {}
  static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir) {}
>---
> drivers/gpu/drm/xe/xe_display.c |  6 +++---
> drivers/gpu/drm/xe/xe_display.h | 15 +--------------
> 2 files changed, 4 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>index a453946ad108..3d15d3ac431f 100644
>--- a/drivers/gpu/drm/xe/xe_display.c
>+++ b/drivers/gpu/drm/xe/xe_display.c
>@@ -132,7 +132,7 @@ int xe_display_create(struct xe_device *xe)
> 	return 0;
> }
>
>-void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
>+static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
> {
> 	struct xe_device *xe = to_xe_device(dev);
>
>@@ -164,7 +164,7 @@ int xe_display_init_nommio(struct xe_device *xe)
> 	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommio, xe);
> }
>
>-void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
>+static void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
> {
> 	struct xe_device *xe = to_xe_device(dev);
>
>@@ -204,7 +204,7 @@ int xe_display_init_noirq(struct xe_device *xe)
> 	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_noirq, NULL);
> }
>
>-void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
>+static void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
> {
> 	struct xe_device *xe = to_xe_device(dev);
>
>diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
>index 9e29de012df7..71e0bd27f1eb 100644
>--- a/drivers/gpu/drm/xe/xe_display.h
>+++ b/drivers/gpu/drm/xe/xe_display.h
>@@ -20,13 +20,8 @@ int xe_display_create(struct xe_device *xe);
> void xe_display_info_init(struct xe_device *xe);
>
> int xe_display_init_nommio(struct xe_device *xe);
>-void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
>-
> int xe_display_init_noirq(struct xe_device *xe);
>-void xe_display_fini_noirq(struct drm_device *dev, void *dummy);
>-
> int xe_display_init_noaccel(struct xe_device *xe);
>-void xe_display_fini_noaccel(struct drm_device *dev, void *dummy);
>
> int xe_display_init(struct xe_device *xe);
> void xe_display_unlink(struct xe_device *xe);
>@@ -60,17 +55,9 @@ static inline void xe_display_info_init(struct xe_device *xe) { }
> static inline int
> xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
>
>-static inline int
>-xe_display_init_nommio(struct xe_device *xe) { return 0; }
>-static inline void xe_display_fini_nommio(struct drm_device *dev, void *dummy) {}
>-
>+static inline int xe_display_init_nommio(struct xe_device *xe) { return 0; }
> static inline int xe_display_init_noirq(struct xe_device *xe) { return 0; }
>-
>-static inline void
>-xe_display_fini_noirq(struct drm_device *dev, void *dummy) {}
>-
> static inline int xe_display_init_noaccel(struct xe_device *xe) { return 0; }
>-static inline void xe_display_fini_noaccel(struct drm_device *dev, void *dummy) {}
>
> static inline int xe_display_init(struct xe_device *xe) { return 0; }
> static inline void xe_display_unlink(struct xe_device *xe) {}
>-- 
>2.41.0
>
