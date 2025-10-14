Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78C6CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 19:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE9010E238;
	Tue, 14 Oct 2025 19:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsEgB47V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468CD10E238
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 19:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760470533; x=1792006533;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WP3B/0AlNqNCOOY20I0tig2WmQwnBeqOQSmIZa2yicU=;
 b=jsEgB47VeIidFs93zDzcA4j0mZG7dHQCNQx25m3Gh37IS9STCImHyXne
 fyeLiwAbFjUYlbOOXE2rLUGy3vEpXNuCTw3g9vjSw2xKnWxp+FNG7A0kY
 6C4qdfbejbmFVdM5BWhAXX5VVV/aMKcy91uPLikoDZxmhENSwh5IcR83i
 gsEJheDVxB32vqUNR6RjbiPjYUNGa02PIbEnYUAfyw2qpMrOQOt3byhOo
 EbqWsH3Q5McFh1DFlb8uGlArPukTpIDXyyi3JsVhSKe1uqmNc1kO1X0rt
 j9MQmOgTf9Xx0vX6E0HTl0XLYoTQ8jGt7GBLyM4KXDTpswBtOf4OQKAD0 g==;
X-CSE-ConnectionGUID: mz0f+uw5RAKViNcsK5ouew==
X-CSE-MsgGUID: /nUsxmBtQ3CkDb/VugFDTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62530329"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="62530329"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 12:35:32 -0700
X-CSE-ConnectionGUID: +0l/1Y1kQFCS2W6KepKK7A==
X-CSE-MsgGUID: B7dz2+nQRr2TV31aFItEXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="181185041"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 12:35:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 12:35:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 12:35:31 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 12:35:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUJPEX1FcWmw9JxBrQUuVoV63OhbCTmUCRg7jZdyVyMroVcCNA9eaU8RZ21wzmYDXDCv8VwprWK6xsAFOZ8qO7HDI8T9hUzLv2GJ51ZkV37btIbJYPU6WMvxmi2em9DR5OOX0GGSfX+SBxmO2GGL4bNer+GxFHMCLL+AOaiTr+qNpUIfcskR+G1QCzLnEQKTCuSxOwsuljLd6Wz2nHo3IHUyEc8MHZudwILmC/q+Y4qQljScIgutGWqpOzZCVV//qTYe3fZwaXPGcQMsQcPVQg53XUzl7gNlRKQ7kkyVvF7RDRc/noONjBP/uDGV4jge16ozjbK3aUpraEaqFzAmAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBvLuyqO8/u/P5r5TwqCc8EiAaAxNv1VXX4N9Hvwd80=;
 b=bQ12X9V3mqC40JfnaSwWgFBJVMCio2n9rxGs7NY3t8JtTMDiArYnlIbofpKTktz3j2LLl451kTuIvBYQDPMtLtzrXFzNGqj585wrUIfLr/aGzAPGG2dlq903A3L5NRX5GnOD44BkmRBKYMjPjZu8kluie66gAvvcBx6Q5wlifq7u5663v9KbhRl9w3lODmQvMmcqhpAWTu35OzKMdk79HtacN/F4rTtp93S8Phwh4zQC4dr1+82UBSVOWd+8pSIwBuL9fXaCxQ5ua8tDYESUfV36VqqQ4FZ9dYlNAF1yoRCk2L4vh5Wlonk41iV/AIT/AX1aDZF9HrIx7piPnpIzKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6379.namprd11.prod.outlook.com (2603:10b6:510:1f9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 19:35:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 19:35:28 +0000
Date: Tue, 14 Oct 2025 12:35:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 10/23] drm/xe/xe3p: Skip TD flush
Message-ID: <20251014193525.GB5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-10-bfb74f038215@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-10-bfb74f038215@intel.com>
X-ClientProxiedBy: BYAPR08CA0041.namprd08.prod.outlook.com
 (2603:10b6:a03:117::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: 741a5786-0bee-4bf5-6053-08de0b58d436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JaOWvqm9VV4g+E5GJLmrUZVy5XH/2CpM99n1OucHczoJg+B+Xrml2avPbXyP?=
 =?us-ascii?Q?xeLx6530g6tMVn3so9Wu38KIVcLY9zndBYHDdZ8LgIQ9LSSOmEd3LGHn8DFs?=
 =?us-ascii?Q?Zj7KYDoLisiQ7SXHQShZaTCCg6hcjxXPEXwuLlIHrWZC+4Nmaf2Fr7yN+SmR?=
 =?us-ascii?Q?56REQmJYTP9pxWmDqFpzLcV8HHaL+443u8JXDclQRrYqUTnn8dYPEJWp+YD4?=
 =?us-ascii?Q?5p90A7dLKw0WO4roISvZSIk+gi12wMatvWU7QPzmOvCOZ0v80FVOjsd/o/Tl?=
 =?us-ascii?Q?L98CaYE1RiJNkyd8IQeUmu5pwopG2cOGIYjy3h9wpqT0gkIjSRzkfxVUtfkq?=
 =?us-ascii?Q?8InFAgyStmUQNuDISUlTr7WitMy2sYpVYvSaRVlsAMtrXXQac/TOuFmWvDJH?=
 =?us-ascii?Q?+GLG/vC95CpcZ2ygMuzGSUmHMHT0uLmCXz+iS6BdS26a+LaTZwbEOz4O1uA6?=
 =?us-ascii?Q?zAmMlVLLbLgbv9DOSesEQDmtk+KJFS4eZovtFNrTVCl0MeaCLtsvuk9d0JER?=
 =?us-ascii?Q?Bz6VWD5DasxY87yHFc9cF+U5cGqaK50K7P47WiZMByAHNM/opKz84DotVGPI?=
 =?us-ascii?Q?TX9gUepTz7C4pLcHj7URNiq2ECsZ4RWuADxiFDbybecdbthEAS1LU/rJ7OEW?=
 =?us-ascii?Q?shNzhXtVkVu80HEWxz7RPa1RGLrB24prutY+NFwzVZjSdzNBDrUn1NSa/Gi+?=
 =?us-ascii?Q?9WAMaCpvlmpUqVDIb1s2TNIK0Urn/3z91m0ZEX1KBrgy0rgLbxPdySRtvZ0p?=
 =?us-ascii?Q?g333e8ZUkYhxHMXDIhtZPNF1EwqqrFyZUpM9WBc2rEEXdua4jfNQ/ViWN87q?=
 =?us-ascii?Q?I9XCSntLCRH33dQFAcq01Gv4p2c8Kw5v9ea3fsivpKCyN0xmqKK/A77lumau?=
 =?us-ascii?Q?nm64DVhgvF0qHVjZKtoSzHKerU6s1Su+ldnyaHjWYlTaiYCF3MGcjUTsU3us?=
 =?us-ascii?Q?NATT9bGcGl+5gmzF/ixC79V0dl9TeOmylZ1gjvqG5ggNemHU2jECAyKLRE/o?=
 =?us-ascii?Q?mrTgDpIjTGJa+XICSuy0aDymXjduuF+lAlWFZ/oMNh7Z9SzAppEEclL7uk3w?=
 =?us-ascii?Q?StCHUue6ng3t98MGmxf4WwURtVrYByQaKcGZTnZgvg9sOls5QW3g4EbygdgF?=
 =?us-ascii?Q?NSEnt0nRHL0Zhye6i8cfp73E8afZwPS6x+CGOMYVHmCV379v2mqQq0uXSM20?=
 =?us-ascii?Q?NevN++ZDCtHurN9QpkCmhGOUXZxuaXmjp12PdlLL8HgCYKHsub3VkscLuP2S?=
 =?us-ascii?Q?A/2UfV6he9oexBRJhjQ515s/BEZ2smgoWwk45d5TEBnp1Jlu3F3KUg21fV7b?=
 =?us-ascii?Q?bvsecgvRj/q5wVwVZwK0hk2p92AQctau1NVjo1W/ACbmLNJaS10Q/lDpI3K2?=
 =?us-ascii?Q?RHPw3wyXUBjuxAB5qBZDFC9O6yFnXqcBjGxQhAj3WhvxK9wuD/T5u1WBhbdM?=
 =?us-ascii?Q?mYT50IFfwF6VlJA9PZ009A7Q9JAx1kQZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fWMmxWajlbGgDSuJy+9UC/w3SJsazfdQFRxUR/xXH+eQynyVBWVOxsgxrc2l?=
 =?us-ascii?Q?9SDfmJAziQkVo8zS8O0VQoCNHa0RjlUqRfC/wS/rtol3MAKDkVstvtz8PUOp?=
 =?us-ascii?Q?cp975bTv1Xa08XJ2CjQEMsXHrr0UymLS+77qleTagw7Su2q8pfZDP55RM3sK?=
 =?us-ascii?Q?apeZ3BKHh1miPvA54+L9/3XiKfDt3Ez0CAhZp8lKBEc7uDLPEEEIfT08oXJl?=
 =?us-ascii?Q?hcoIkVtRqZg5Dj/xGDWJnyoYt4T9v7Nfil8eMOamDcBh6XCKxd/SpREiXfdt?=
 =?us-ascii?Q?EBZ5YcWyhRzEAM6ELo3Gj4NcV/slhuZoL1PzrqPqiMCZlusrJY8Xs3Sot9/A?=
 =?us-ascii?Q?PqMNYHGsPB0OZ1nIstRwdhAJ4LLCDlxb+GDQvb6QA/6qRF5gmzJIe4o6YYr6?=
 =?us-ascii?Q?CaRV+V1QSc7D/6t6NQZeYadQrwUqNApfnb6XFmO3EbuQxRkZ8flBPhlxJrna?=
 =?us-ascii?Q?docBxLuVbyW65+ngveFcVSYW02A676sk8p94MR95LgdAu0eT208Urh+WTMnh?=
 =?us-ascii?Q?G0aWDUsWJyFVEh8muSP+qKfovmGbam0SWhJnOPddnP2AfsM+Gj4MTMm2w8fX?=
 =?us-ascii?Q?6o277OTvIsnnrXr472h1R2IxVCetAaci0aZ8PCCvG8+enWdiqyN2zb2zWG9g?=
 =?us-ascii?Q?BeHJQaSla85buGjqmq3Xo5bddh7sbsEcvWhfts6q/AfEy1sSK3KdEXCmNVxB?=
 =?us-ascii?Q?l2NlPGR2b/aRi6N0yKG0KrDgmlspoZ1FzucQcLaAUzfF6i2CV+s9wNuxEx0P?=
 =?us-ascii?Q?IFg6LMV4+fCKJ3HCuRgUKvz0gM60prCexuCkBpYXgZqSs7iaykgQqp51lxty?=
 =?us-ascii?Q?ogY/JoQfzpDK+lbrchtXVfEgS2/JuFX8J/TzSAZSZmUrIvJ5yxUE6ewpIMGc?=
 =?us-ascii?Q?3JbzkQOH/Vicd4Wf0DTfaQmFK/C9ncqmf2Hw4eMp9/xOqbE83SlLW86bUzZA?=
 =?us-ascii?Q?oMCLKbsis3KHLcc3A7TzJvxfFYw3gyz6r4csnqG/tn1cLso6FCzcSyxUQY/9?=
 =?us-ascii?Q?HDOQKjdPyJyaQXnVVogQ78Bn9yV6L80NWzdh6hD2eYURkef4R58LHTuLBq+V?=
 =?us-ascii?Q?bSdK035OOrGuwCz0o4wFo3bYuu2IpJ21PbDsnadxoZCyTABnUPbsZNkGQJfO?=
 =?us-ascii?Q?S9JdaZCcw0Ji9F6e7s3NshjoWiL73PguMzHVlDQnqjEVU2owre3DNQLvmQkW?=
 =?us-ascii?Q?+W98yqbkM/aXA7oNS9qMSxWs14kxFC3c/fFdooXMYvCuYxE/nkyCvQTCTX27?=
 =?us-ascii?Q?/N/YIJ0yGvtj5xomngpSVAFx7o/FU8YHk7uy+gKy89Q9R/Wdy6AlVV1N7FdA?=
 =?us-ascii?Q?XFFR7dSaZqcy1K6sL8GUlqEPk0XT52bOpSJyBsl6cgxfpZVcz0kpdcvAHHxy?=
 =?us-ascii?Q?oHpl7Z7SzdkegDN5PdgYVec/7LaGV8DMeZXBTJxPOZlzQ7md4AInj3T8y6aE?=
 =?us-ascii?Q?bvgxVV9LRgaDJemTVCQ2uERoeDJ81aRSiIs05Zfdftt9mHkysqW+6vfm6SQw?=
 =?us-ascii?Q?uMvvTKPnfaZUXYyvElmNDQX9Fl++rA85wC8SvO9tC58pg7f6XdHyEMws1gsS?=
 =?us-ascii?Q?iAneUygmOxPfNKoWLRmaNLEQhfGRHqQHaqve9+LISjV7NQuNUomyw67675ui?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 741a5786-0bee-4bf5-6053-08de0b58d436
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 19:35:28.1238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/5u+7wztJMDqhY7yP82JNPIgoiv4EYRG4me+JfTHFVRNJFUN5okUZ3RgNMYsNB7fZJ2CdWEN/72IfwNAbDlfoNRxZRTmrUzD/oOkgyCjTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6379
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

On Mon, Oct 13, 2025 at 08:24:42PM -0700, Lucas De Marchi wrote:
> From: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
> Xe3p has HW ability to do transient display flush so the xe driver can
> enable this HW feature by default and skip the software TD flush.

I think we need to expand on the description here.  "has HW ability to
do flush" is very ambiguous --- how/when specifically will the hardware
decide to flush the TD data if software isn't explicitly triggering it
anymore?

If I remember this feature correctly, the actual hardware change here is
that "display transient" data will now get flushed automatically anytime
"app transient" data gets flushed (whereas previously the display
transient data had to be flushed independently).  But I don't remember
the details for "app transient" off the top of my head now (I remember
it was complicated with different rules depending on whether the media
hardware was awake or asleep), and there's no reference to it in the
driver yet (I believe Xe3p is the first time it shows up, right?).  The
only Xe3p PAT table we have in this series (Xe3p_XPC) has neither XD nor
XA entries, so maybe this patch is coming too early to be useful.


Matt

> 
> Bspec: 60002
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 6f8f72fd1b133..7efa8da9e1069 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1103,6 +1103,14 @@ void xe_device_td_flush(struct xe_device *xe)
>  {
>  	struct xe_gt *root_gt;
>  
> +	/*
> +	 * From Xe3p onward the HW takes care of flush of TD entries also along
> +	 * with flushing XA entries, which will be at the usual sync points,
> +	 * like at the end of submission, so no manual flush is needed here.
> +	 */
> +	if (GRAPHICS_VER(xe) >= 35)
> +		return;
> +
>  	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
>  		return;
>  
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
