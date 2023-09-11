Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B8CC71153
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 19:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1380710E0FA;
	Mon, 11 Sep 2023 19:50:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE33A10E0FA
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Sep 2023 19:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694461838; x=1725997838;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=TxKQKrKEcX20GyccG9z1yd5M5OLVvyvjTylX+S526Fk=;
 b=nl16o4NF56/CmA7JouycNFJLdg7+99DJHweT3UCIp/bTzUDDPGFgVZsn
 qZlIHs0xmrPyC3fEi5u0jGd6A6Nk48Zrhzrb6LVHO4LA/sKMraEVQoVNU
 BYVGAE3P2CU6Q45turLEc7HzoF8LXTLu0wdKOWewvL4hFafopt7C6oNG5
 V1kG4ZSr3nYYU/70n9Kwt8HE97RHn8KmKneE6bleOZbNp5pMU9C7Xn0B7
 Gpr6QLdEw2h6dlmcB20Ya7ZoMpJWLHWSYV1Pv9Q2jdkS1Suw7Xvnt3nZb
 U7/v8UqkFxax1iKNBaSRDhdyThYr2as/lkyeLb7M7BwI5y+5/zPevX1xR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="377099059"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="377099059"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 12:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="720100771"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="720100771"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 12:50:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 12:50:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 12:50:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 12:50:36 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 12:50:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1g8R/Dh/7mRxa2hRrXT3IHNxZ9zpXAuvZZwrvQf6RA5hhkrcP22wW5PlAf/BcexhWVsU+Ik34rsABnOfJq+3hVe36Cz+xHxXNtcQR3FuLEjq240MGBVguco8CaDWlgTnGYsQLaJaxQazXCwqyyGSijh7y/UEmaXPkyuXTKKfSL2OkSJ8CEzqtS0dzNqsLocpuMvRUnmB6725jvYDhdoqg0rpwAdkxIwlJ5wfA3Vb6/IiCc21VDSQySUArm+Hdomk/jrHTYWfjZVZCI8ndskCJbEfXz+wZOFZuuwZGlrNUu/Dw0HwAQ7fzq2L2EYbfYPRWeZvdO7VmghEzC0uVQm7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLVcc5VbamfoJPCNL2mvGoppW2mKPPyKKIPRxLR5iGc=;
 b=TbcZo784ir0pmIxA8QRLbvlyM45akFZm2CjrD4nH2590gAtTPkvRbso62+JaGztSIgHPB3y6nvJjm72L7Ss8A62YIpqfpS3c1OZiAUwsznDv3ZnPU0GVGROOBnl5R46xe/EqA9sOlY9yT0vBTNpZVTazzpYOEcobNYyQ1pwZa5s2NutwYIAxDt5O+8X//NThwVn3cYcfaziGwOi3JVAIg2Ya0JEjn/1yuhM2SwDSBwpTlebRiKbpcp5vsrH4RVikA1b/yZ121s5TBmVR5oLXwUloQAqba74vb7bjfn0MomJF/qwpGG1+Q2c6PNs7oEW5D90Y6cNGMUxzvMuZt1DUGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.36; Mon, 11 Sep
 2023 19:50:34 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 19:50:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230911194712.34387-2-gustavo.sousa@intel.com>
References: <20230911194712.34387-1-gustavo.sousa@intel.com>
 <20230911194712.34387-2-gustavo.sousa@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 11 Sep 2023 16:50:26 -0300
Message-ID: <169446182644.19625.15721984345055872792@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR01CA0015.prod.exchangelabs.com (2603:10b6:a02:80::28)
 To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CO1PR11MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: 31230475-56b6-43ab-cf7d-08dbb3005c6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X/xXTYHFxULEXOAUqRPUJL/A3nUFO0TmCCzq1v2HGE3YWvleLe901YF5wW3/thyxMqn+Gjjt4nAK1WDISGz10MmIJ0CXaCcrvdAGPoSd28sgPMtHDS5cfROh9mvU1FRh8uloW4pO4HsOrGUW9Iq8ofhosEGO/FCZrtebrAdW/wNJWxVM3jaepJJHvuWfKAaOFkRhjHFL67Y7VLSyEag1vgf3qvaPlfeTJN6EVKiBC8hlWzc7V1pu5hmsgayUNX37sAYUKlEaXTQx1qa8tk1jIvwUHJSQZPMNw9ZtZWa7aJCxOGkaAKvpbODsKlSSFrk3wEcjCdpsbNNAHitpdOi2n8V7hYR56Az8BYgMLuf3CmJJA8TAk84TOR7ktbuo0wmlFtf3ggWMWZjSU6fuRggsxY7V8aTYQAvlBqF0i5k0AtQ8+E77/EiUgKXSFIvtG/1y4ctb2yxe8HagwlC5ylfEa8nzLWMj4TKkzI76A/jCELPJjjM6XUq2vsTI4mrV0R90yF0oKsie1eezszvsb0/aGjVSPVzJagIN7Tx9MDnRlkXhG6GmqeR7LkHEpv56ElSB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199024)(1800799009)(186009)(44832011)(478600001)(316002)(66476007)(8676002)(66556008)(66946007)(41300700001)(5660300002)(8936002)(2906002)(83380400001)(38100700002)(82960400001)(33716001)(26005)(86362001)(9686003)(6512007)(6486002)(6506007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk9mR0djajIyTTVRSW5PckdoSjg5OEtHSU55NEdzTWhtam1kNzI2SDgvVmdw?=
 =?utf-8?B?SWRjUjdmNGVKR0lUckFzbFZ3R09QWTI0RnlxalI5ZWcwODRRU0MrLzd1QXk1?=
 =?utf-8?B?ZFMvb2V5WHlTa2FWNlJDYVJNa2pGSUdsZjlUM0FqNjljUGx3WFhTVlV2SzVE?=
 =?utf-8?B?TGVSakFKSkZ5OUxORExTSTM3VzRyWTdndjBMbGk1K0RUc2g5R3NCZGpLaFk5?=
 =?utf-8?B?Q3YwTjJMV0hJcXdValVPQkVTWUFWbE05TnlpUHBwSXhzU2FOUjBUK1lidmVN?=
 =?utf-8?B?MGhCemcxY2d3YkNETEZCNDN1V3BGRVFDSUtMUDJwNFhDb1A2bzdJQ1A4VWhJ?=
 =?utf-8?B?endYY3NQaXVySWlXSzhESnBCSERHcnZjSGJvcXR1L2Q0WnZFVk1FTUdNRFZr?=
 =?utf-8?B?OEhCWGVFemYvS0dNM0ZxYTIrTDdnK1dtdTlnRVdlVHFJa09sZWNWYk1xZWRr?=
 =?utf-8?B?cnE5M05EVHFQSmpKb1EzOTR0RUVPclJ4MDFvVzY2cmg3Q1hpa0dYR25tNTZV?=
 =?utf-8?B?TE9WNTVtaFNOWXBuSm5YT2g3cjJPWitjTGZjSFF1Qm5OMzlENUdSM0k3dlJ1?=
 =?utf-8?B?dm1naFJ5RkVhV1lTd0NVNmNwZGVoSGJOVWUyekV6d3NMLzJURnlvUS9uNlFt?=
 =?utf-8?B?b0lHMUZPQ3BhNWE5Tnd2cXJEc1ZEQ3AvdWJjck9zSEhKUzN4anR5em4wTHRC?=
 =?utf-8?B?eXhKejd6eEpxekR6TWI4dVZkdG5vQmJjcHk1dXhEdzZsWXlYU3hSVGp6R2xF?=
 =?utf-8?B?Z2hLQUhBTjVNOWtvdE5yYnE1UjVUejJjdXlLRkJoK3hPQkk1SUlpV2dIQTcw?=
 =?utf-8?B?Y1ZFT3hGUnhEQUpPVUthbUlQVUhwRk02ZGRLZEFLcExFRjdwMXg0QzJoeXNX?=
 =?utf-8?B?OEFqV1JQRG9tdk4xNEZ1VWJTa0RtMEpjRVZrTGYxVENkVGNxWnV4cVNqT3VK?=
 =?utf-8?B?ZXg4SDNBUzBIRjl5QWJDY0FaTHYvQ0J4N3duUjVRM0d0SlowZXZrT3JtZnhw?=
 =?utf-8?B?QXo5L0JzT1dmUmlhWVozRFkwQXQ2VU9OQjZGaFFzMUZqR1VwTURNcGRINWU1?=
 =?utf-8?B?WjNQTnlRV09WanhZdC9XTXFLOCt3eWtLYlF3aitNd3lhYndwa1lmd0Q1enda?=
 =?utf-8?B?TFZxcVI5WEIvbXpVajBvbWRNMVJvdjRpTVpKSDhoUzN6akgvVkl5QTJBZWQ3?=
 =?utf-8?B?YzhVN0tTYTZXV0Z5MTVsVlBrOTN4SlB3NjJHZCtlVWg1Mit3YTlrQzRYYWtJ?=
 =?utf-8?B?aVpZeHZFSDVTS0FKNU91UFBTTkc0UmpFQnA2ZDJZWjhjbXNNRmkrMGlWb2pj?=
 =?utf-8?B?WFpzNitYQ2hzT3V2NnFaenhmeEhsQlk0SjM1aUo0SXJ2VGY5SmVLTFVudHBE?=
 =?utf-8?B?TjArQ2N0RjlTNUlFR0J3ZFF2SS93YzVRRzVTUWFDNVVWcVJRQlU2cGt3RGV0?=
 =?utf-8?B?dGlzRlJ6bUQ0NC9nMTFqMlFzVVJUVWxJTENCRWdveTBpQThGNWhxM1NyQ09R?=
 =?utf-8?B?LzhEM3ArNkFQOGw2Ui9yN3RvV3BpL3hzTHJsWTR5amJyTExIZHhMSW5jNWNF?=
 =?utf-8?B?UkxsYk8yNUZWQlBQZ09XUjNheEQ0ZEFIK3MrS2Q3c0tGbWhDQXpnUGFUQkZu?=
 =?utf-8?B?L1RxN3NISHVNWi94bGJlZkRHVFJYVXVqRkt2WGtQSjdXMkRKN2ozMzJ4ekhm?=
 =?utf-8?B?Vk5ESm8rTjBUTHpyYzlHWlFXTmxrc1E3S0NYcjRHSHQ1L2dwUDhxemxhYTFF?=
 =?utf-8?B?YThVNXNxUGZzUG9jcGMvYVVwYXhrVklBTGo3S0N6MXdoK0tRcXJXWjVkMzVD?=
 =?utf-8?B?Y2lHYTY4RkZwQzQvaWxvbTJQN0t3UStHMm1idDhlNWhtdFI4RCtRUjQzWnpE?=
 =?utf-8?B?TUFra1hJbFNySDlMZDFLMEZVbEYvcXZ4a01tU0JLc3RUS1dzdzRSc2NWaGZ2?=
 =?utf-8?B?cG9uU21SN0I3bEF0ajkwdUtTRmNtWTMwdnNVK0FydlNheUNVV2RnSGZCbmNv?=
 =?utf-8?B?bVF5SThHRWRCQlpOVWRrSGVtSGFpWUNIQ1hqRU9uclJTY1NoWmZEM3pqMTBQ?=
 =?utf-8?B?VmVjWUFXeGVkUWdPU1dpUjVvMStRaXZBQk1Ub3owRG1mSHFjcDk2a2p5K3F2?=
 =?utf-8?B?YSsvU2VSdnQydTAzYXdmUFQ5NjFUTTN0VDBYMGlnUkgyM3hTRFdFR3VuV1pN?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31230475-56b6-43ab-cf7d-08dbb3005c6c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 19:50:33.9740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6nYZg2bEJvYyAyuplpOdRIo8e74HJc3++wxzYd6N9h0IdiZHEr/5rY12944tj+Ucg8Ud48Am2At6ymf3rLAvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Gustavo Sousa (2023-09-11 16:47:12-03:00)
>Finalizer counterparts of display initializers are registered with
>drmm_add_action_or_reset(). Since there are no other explicit users of
>them outside of xe_display.c, let's turn them into static functions.
>
>While at it, since this is a fixup patch, also do other cleanups
>suggested by Lucas:
>
>    * s/xe_display_modset_driver_remove/xe_display_driver_remove/
>
>    * Remove the unused xe_display_enable()
>
>    * s,xe_display_unlink,xe_display_fini,
>
>      The original suggestion for the above was to replace with
>      xe_display_shutdown, but I went with xe_display_fini to be
>      consistent with the other "stepped" display finalizers.

Hey Lucas,

Please let me know if your r-b stands with this slight deviation from your
suggestion.

--
Gustavo Sousa

>
>    * Group functions in the header by namespaces.
>
>v2:
>  - Add more cleanups. (Lucas)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c  |  8 ++++----
> drivers/gpu/drm/xe/xe_display.c | 10 +++++-----
> drivers/gpu/drm/xe/xe_display.h | 33 ++++++---------------------------
> 3 files changed, 15 insertions(+), 36 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device=
.c
>index 109aeb25d19c..a964dc205da9 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -342,12 +342,12 @@ int xe_device_probe(struct xe_device *xe)
>         return 0;
>=20
> err_fini_display:
>-        xe_display_modset_driver_remove(xe);
>+        xe_display_driver_remove(xe);
>=20
> err_irq_shutdown:
>         xe_irq_shutdown(xe);
> err:
>-        xe_display_unlink(xe);
>+        xe_display_fini(xe);
>         return err;
> }
>=20
>@@ -356,14 +356,14 @@ static void xe_device_remove_display(struct xe_devic=
e *xe)
>         xe_display_unregister(xe);
>=20
>         drm_dev_unplug(&xe->drm);
>-        xe_display_modset_driver_remove(xe);
>+        xe_display_driver_remove(xe);
> }
>=20
> void xe_device_remove(struct xe_device *xe)
> {
>         xe_device_remove_display(xe);
>=20
>-        xe_display_unlink(xe);
>+        xe_display_fini(xe);
>=20
>         xe_irq_shutdown(xe);
> }
>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_displ=
ay.c
>index a453946ad108..37278f73cb39 100644
>--- a/drivers/gpu/drm/xe/xe_display.c
>+++ b/drivers/gpu/drm/xe/xe_display.c
>@@ -132,7 +132,7 @@ int xe_display_create(struct xe_device *xe)
>         return 0;
> }
>=20
>-void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
>+static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
> {
>         struct xe_device *xe =3D to_xe_device(dev);
>=20
>@@ -164,7 +164,7 @@ int xe_display_init_nommio(struct xe_device *xe)
>         return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommio,=
 xe);
> }
>=20
>-void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
>+static void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
> {
>         struct xe_device *xe =3D to_xe_device(dev);
>=20
>@@ -204,7 +204,7 @@ int xe_display_init_noirq(struct xe_device *xe)
>         return drmm_add_action_or_reset(&xe->drm, xe_display_fini_noirq, =
NULL);
> }
>=20
>-void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
>+static void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
> {
>         struct xe_device *xe =3D to_xe_device(dev);
>=20
>@@ -236,7 +236,7 @@ int xe_display_init(struct xe_device *xe)
>         return intel_display_driver_probe(xe);
> }
>=20
>-void xe_display_unlink(struct xe_device *xe)
>+void xe_display_fini(struct xe_device *xe)
> {
>         if (!xe->info.enable_display)
>                 return;
>@@ -269,7 +269,7 @@ void xe_display_unregister(struct xe_device *xe)
>         intel_display_driver_unregister(xe);
> }
>=20
>-void xe_display_modset_driver_remove(struct xe_device *xe)
>+void xe_display_driver_remove(struct xe_device *xe)
> {
>         if (!xe->info.enable_display)
>                 return;
>diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_displ=
ay.h
>index 9e29de012df7..de835d459255 100644
>--- a/drivers/gpu/drm/xe/xe_display.h
>+++ b/drivers/gpu/drm/xe/xe_display.h
>@@ -14,30 +14,23 @@ struct drm_driver;
>=20
> int xe_display_driver_probe_defer(struct pci_dev *pdev);
> void xe_display_driver_set_hooks(struct drm_driver *driver);
>+void xe_display_driver_remove(struct xe_device *xe);
>=20
> int xe_display_create(struct xe_device *xe);
>=20
> void xe_display_info_init(struct xe_device *xe);
>=20
> int xe_display_init_nommio(struct xe_device *xe);
>-void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
>-
> int xe_display_init_noirq(struct xe_device *xe);
>-void xe_display_fini_noirq(struct drm_device *dev, void *dummy);
>-
> int xe_display_init_noaccel(struct xe_device *xe);
>-void xe_display_fini_noaccel(struct drm_device *dev, void *dummy);
>-
> int xe_display_init(struct xe_device *xe);
>-void xe_display_unlink(struct xe_device *xe);
>+void xe_display_fini(struct xe_device *xe);
>=20
> void xe_display_register(struct xe_device *xe);
> void xe_display_unregister(struct xe_device *xe);
>-void xe_display_modset_driver_remove(struct xe_device *xe);
>=20
> void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl);
> void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
>-
> void xe_display_irq_reset(struct xe_device *xe);
> void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
>=20
>@@ -49,35 +42,21 @@ void xe_display_pm_resume(struct xe_device *xe);
> #else
>=20
> static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { r=
eturn 0; }
>-
> static inline void xe_display_driver_set_hooks(struct drm_driver *driver)=
 { }
>+static inline void xe_display_driver_remove(struct xe_device *xe) {}
>=20
>-static inline int
>-xe_display_create(struct xe_device *xe) { return 0; }
>+static inline int xe_display_create(struct xe_device *xe) { return 0; }
>=20
> static inline void xe_display_info_init(struct xe_device *xe) { }
>=20
>-static inline int
>-xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { retu=
rn 0; }
>-
>-static inline int
>-xe_display_init_nommio(struct xe_device *xe) { return 0; }
>-static inline void xe_display_fini_nommio(struct drm_device *dev, void *d=
ummy) {}
>-
>+static inline int xe_display_init_nommio(struct xe_device *xe) { return 0=
; }
> static inline int xe_display_init_noirq(struct xe_device *xe) { return 0;=
 }
>-
>-static inline void
>-xe_display_fini_noirq(struct drm_device *dev, void *dummy) {}
>-
> static inline int xe_display_init_noaccel(struct xe_device *xe) { return =
0; }
>-static inline void xe_display_fini_noaccel(struct drm_device *dev, void *=
dummy) {}
>-
> static inline int xe_display_init(struct xe_device *xe) { return 0; }
>-static inline void xe_display_unlink(struct xe_device *xe) {}
>+static inline void xe_display_fini(struct xe_device *xe) {}
>=20
> static inline void xe_display_register(struct xe_device *xe) {}
> static inline void xe_display_unregister(struct xe_device *xe) {}
>-static inline void xe_display_modset_driver_remove(struct xe_device *xe) =
{}
>=20
> static inline void xe_display_irq_handler(struct xe_device *xe, u32 maste=
r_ctl) {}
> static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_mis=
c_iir) {}
>--=20
>2.42.0
>
