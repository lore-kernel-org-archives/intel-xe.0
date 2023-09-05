Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C889EC83F2C
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 12:58:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988B910E4F6;
	Tue,  5 Sep 2023 12:58:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815C510E4F6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 12:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693918683; x=1725454683;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zBmPTiLlvbunIZi5BQwbyF1H4c0GBP8IZYQI6pEKC7c=;
 b=PbCjNQZDEHl9mREawgMEbuOJpEbpHKbIb3GTJtr4PQv+gp41RUOAJfsY
 icZFJth8Ikz3Il6ix+6ivF8e1n+dN8EvH7oEzbrATcoicp9weTg148EEa
 d4Uf9SGVYYAtbKsGZkRobidj+yN6Zm1ESzxjHiP9huawuEoTI0W7DlwMG
 PTLx0TBj7QlD2SNfIRETA611XIwWkSfQ/a4p6D0jAParsGCcIfpVps2ZF
 3tr+v6NGC/+Jxt5TSPk7Ju7sssZvtE6DwsPNJjOfnJeKqFcOUKNM1kagY
 gOlR3+OJhwF/gdXyb6RTsCysl52Nn0q/x6huDnFvZkpSIPae1P0GP0oe3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="361815022"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="361815022"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 05:58:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="690924636"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="690924636"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 05:58:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 05:58:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 05:58:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 05:58:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJI0aa28E/K4nIFDUhjIgWdezm96XrAF/aOmjW6+WTElaM87+4LhAVEfRjiBiSZK+6motq3mS6lRGfZUncCADAISQX8QxqCFGuSHpIkKsXivLxvkFtycR/nqb2takgchq/toDPVybIFK4p2AqhzbwtEq613fnee2A782mpAcZWiZidXdbKt8YN/dOG04pH9BXO+tujlpPwOhZmQWBglXUnIFMW5yYf8ak++EYY6w0r80uiGTArpIzeQT2bIN2yKMw8eAtPV3Q8hUTAfRoe7waVo8pOYJos07O8UfDbMxl0pTcqrKl49Iu64w717Yjs6/AP5wrTMkIUI/pv7iOUTZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkcTKxFzQ7PpnQgmC7VEZ+KrDuFMkI4xklBlsn7IVwg=;
 b=O8SWDseObfi5PFgSYOf8sFlPR4w8e/P9Tp4+Sp2my4uVicywqbnZDkBAdh3nL93i0ZxyDb+7AQH7DdGr7HJbxQn5B8HtowUUJ7CXTX1XQzJQnlghwMhrRdjE/khj35+ZWgScwCwl9G69AkstMJEWwYyRBITgTgb3DuqR1bb/rYq3Y+bDuRWTsRiToxN0hSlZJEkxuULKeNPr36LFrC6JYK1IHrLp4C14QsLEtozDahSZyaoUrm2RxbG2Fr7GIAltwcOf+Ga6CXpjlKcb76HHYBLPRqCx0x4Kso0kOhUzsItrEWBruad1b3k9jrQQ2kutRez4FZ8tZip0ELasL8v7Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB7964.namprd11.prod.outlook.com (2603:10b6:510:247::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Tue, 5 Sep
 2023 12:57:59 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6745.026; Tue, 5 Sep 2023
 12:57:59 +0000
Date: Tue, 5 Sep 2023 14:57:49 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <ZPclzYMmBovI4VlQ@fdugast-desk.home>
References: <20230901160300.7-1-francois.dugast@intel.com>
 <87cyyyi6x9.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cyyyi6x9.fsf@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a920cd-0ae9-4c5a-cf3d-08dbae0fbaf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OcFlNPMvkKY0vQoFnnPPifgNQGg23uXMBXx1vDQL+P8UE6u/wVMmtBcq8nUuXzWgS+jRvccIqa2kouGISkTtYeO0kMHiYM/rlOrQvKqVV8+sjJSSj3K9osyST3FjGAeY2rEKRxUlpuKExjYh2H6TUzqyPoAOsFZjEv0weM9zBv4bBRDwoJA1pW0WzWnqP26Gz1hBq/UkO0zJO9AubEN8/g+AqzpU5wFkeemFHxai1nZuU4ZwprSpV2+KYiy/yIREdsUamB9eJRIwaVfWpGU4nxTxsE0uO18A14zX4APuF/EKVjbxd/1UHO+ONh/Gtdtky0190iB/z0Ga8LcHnlD31wQlUFZPf4ggXrcMOUPdVY7PxFiKvjA8wuDkyjgbGzpzyha8DMyl7Jay+C5R58xSkTfcJ8WXKbPMDLNBd1GsUZ1UMZnuZOYx8s67W8Bhku/6SIQorBW341AHKgZIUnRSJTCX3iO8geEObPNRUxEV9gBY6ACdG76+Dr3XpLs0lEATuOPV0dQOYRk2Q30gxlRI5LIEvd5oZvWh8BwqE/UbrzB1ZOna3qUYM1/IKbU4v8i7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199024)(1800799009)(186009)(6512007)(6666004)(36916002)(9686003)(6506007)(6486002)(4326008)(8676002)(8936002)(83380400001)(316002)(6916009)(66556008)(66476007)(478600001)(41300700001)(5660300002)(66946007)(36756003)(82960400001)(86362001)(38100700002)(44832011)(26005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGFGZG5pZERnWnJYYVhyOFp1dzhVWnp5VU1CZEU2TUh1dFZFNlNzTXhwcUwz?=
 =?utf-8?B?VlppVkhZL0wremZNc3FqWHJnZXF1RnpPNi91Nm5GK2hDcm54VHFLQjN3dXpC?=
 =?utf-8?B?SnY3eGdySS93cGlobE5hdnF6Y1VTb0k1cTk4cUJaY3c3N051VHZMSy9NVnpC?=
 =?utf-8?B?LzJZU01Ycit0RFJaaWxxZ1AwMG5NWGw5M1lOV1A5dkpMd1V6Y2ZiamZ0MHhR?=
 =?utf-8?B?WGJ6eXlCWjAxSVRnbmRSUENpRFRjaW02Z0lscFBYdWtndnZ1S2JkaVJrQTB6?=
 =?utf-8?B?Z0NLbTdWRzI1d0M1K2FWVVIrT1NPZTBjZFdCRWgwV2pBaWpuYkJKMGlIc05C?=
 =?utf-8?B?Zko3c2orMmxJdjI2alkwUlN4SkdiNktlOVdOL3dCN1dxWnhIMVlldC9YT3Vq?=
 =?utf-8?B?SnZzbXpuaUk4OUJzWWVLblJScHhKNGp2azhJekNyOVlDUkNzUXZoclBWYVZP?=
 =?utf-8?B?dU9pcll2YjNCY1BGQ3dGU0hXQ3E3eUZpV2lvM1VCQlJ2cUM5bVQwVG0vUTVT?=
 =?utf-8?B?ejhUenVRblUvZE84cEg4ZDJkNzJpaGtCOVpwMmJKd2VkZUsySmtjdEFYVGQ2?=
 =?utf-8?B?NnhPMHluMTRFWWlDb2kyZjJ5bFd4aCsvMzVlVTF3cUFhQURsQjdUQkFJdXB4?=
 =?utf-8?B?enFLTVhONWFlb1UxUkJTY0hJc3VQSmgyYTRGa1ZMdWVjc3JoQlNhbkFlTnIz?=
 =?utf-8?B?T0NLeGNYNU1IVSszNnluS3lOc0ZaS2VhUE9wK2hPRisyNlNKUVprS01lUlBN?=
 =?utf-8?B?K0RUTmNGalNLU21RbUh1YVFCc1B4OVhHaGczYU9uWlptL21KRW5OOEoweGxq?=
 =?utf-8?B?QThPczByUnREZTIyQUswVzIxZTNrQjJ0TkQvQVdFTU1OZkdjQVFPcnhtTDFh?=
 =?utf-8?B?RmcvbnJONGpzY3ZLVU1xVCs5UTdXOFZpaTJoOUlsU2JKcjBMdlFHaHNIVFV0?=
 =?utf-8?B?OURXMlVIeUdTTFNQSjU3dWkwcm80TVIxZG54aHowS05HZDNkOEllV0V6Szcv?=
 =?utf-8?B?cU9GZnYyNi9qVmRYd29FYUt0d3pSOTBaV25qZHRCY3dwckE0TSt6VzloUmZi?=
 =?utf-8?B?SnhRbGtKc2g3bExlYlJ5TFB1U2Z4RkZYMS9rVzBFNzJML2dxcE0ySFo5eGZ5?=
 =?utf-8?B?R2tMRjNrVW1kZnJnYlFINzMvR1JsamczYldUS0dTOVl5ZVl4a0NUd1dxTGt2?=
 =?utf-8?B?ZkRWUWtHWjBSbkJZUHpuandwTTFpZlFPRzdiaFkvWC95enZLZUM0ZkNGSm1p?=
 =?utf-8?B?Y3NtQzZpNmExRndCMTE1dEVuSVRrMGtnRjF1bzJCQXhxM3o0WkpZZ3FqeTV6?=
 =?utf-8?B?TnNlajJSZE52S0l5T3BtS3pZV1FPVEU4elNTT2diR0MwbTBQa091eGlxckxj?=
 =?utf-8?B?Wml6OXpuNUJPdG5DUkxhajlpVEl6QkppbzFKTytkdHhIeEQrSGNhall0RVUy?=
 =?utf-8?B?RUFiRTVWZ1ZVaXJVTVAvdmg4aW9YK083dEpGWisreHpxdUVTRDhCalpGWDJQ?=
 =?utf-8?B?Wjd0ZkIwNGZzQmlUdDl5S3RMUTJCRmVDL2wvdENzVWdqdkg1dnJueGFiYXpI?=
 =?utf-8?B?dldKT3N6T3hadzRwTEpSc2U4VndhbXFFNENCSmRoZDlYazJnbWlPdWtzT2h4?=
 =?utf-8?B?ZDFmTG5jQ0NaVUFSN2dGdnhpcGdkQ2E3eWUza1pvZWdtWDMvVnpSbVRGN3pF?=
 =?utf-8?B?dmI1R1l3T0M5QnExTDlTUFpqUU02aXZkREF1MWtPOXZsTFg2RDF1MWNSeVpY?=
 =?utf-8?B?bFVXbkpiTGk1RkduTEtTaHdpR3BhWGl1ci9jNlNEbUJKKzRHUmNQQ0EwNEVE?=
 =?utf-8?B?STFRZUYvcnFFUWNOUmpHUDZ5YVlVVnZlMEFMUnlHMWU0U0dUb0dEYU12dExn?=
 =?utf-8?B?ZWk1MzNpZHZ6VUxJK3RrYkNXTmQ1YXptTzRvcUNVN1I0a0tZR1U4bjA5UGho?=
 =?utf-8?B?YkxLYU1PY0dHTUxqSHBrZDJnbzdVQ1ZZWFNVMnFYT2FUdFV4dkRMeVhNdWlU?=
 =?utf-8?B?Z1ZnanF4cWRBNjk0YUwvZDN0bHR2RCtHQmpRdGVub0hVMFpUUS9zTXZRazVj?=
 =?utf-8?B?MXg5WW12YkxRQ1NhTWZrZ3I0VVRNRWVPTGp4QXBLSFZWZVluZFhUZHg3bnNG?=
 =?utf-8?B?WDNxbm9zNW53M3Nyb0hXT0tyWUZkYmZtdVI5b0QwWmw2bzhadkFRTjRZa21H?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a920cd-0ae9-4c5a-cf3d-08dbae0fbaf1
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 12:57:58.8770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G024l089sKa1P4bq2iX6ReB7E//+AgrNJ0RFkqRbnAHk39oVTUWcEd6utPx5A1eRdoG67ouPr5hwSjk5lzaSe8XFpbxmTwB/Uxy93Htbfpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7964
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Use acpi_target_system_state
 only if ACPI_SLEEP is enabled
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

On Mon, Sep 04, 2023 at 01:12:02PM +0300, Jani Nikula wrote:
> On Fri, 01 Sep 2023, Francois Dugast <francois.dugast@intel.com> wrote:
> > This fixes the build when ACPI_SLEEP is disabled.
> 
> What is the build failure exactly? It's usually helpful to copy-paste
> the error in the commit message.

Sure, I will add it to the commit message in the next revision. Here it is:

drivers/gpu/drm/xe/xe_display.c:334:23: error: implicit declaration of function ‘acpi_target_system_state’; did you mean ‘acpi_get_system_info’? [-Werror=implicit-function-declaration]
  334 |         bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;

> 
> acpi_target_system_state() should evaluate to ACPI_STATE_S0 for
> CONFIG_ACPI_SLEEP=n, and the changes here would be unnecessary.
> 
> Most likely the problem is CONFIG_ACPI=n leading to <acpi/acpi_bus.h>
> not being included at all, and the function not being present. Directly
> including <acpi/acpi_bus.h> would be the cleaner fix.

It seems that with CONFIG_ACPI_SLEEP=n, acpi_target_sleep_state evaluates to
ACPI_STATE_S0 but acpi_target_system_state is not defined as it is compiled out
in acpi/sleep.c, which causes the error above. Including <acpi/acpi_bus.h> does
not help.

Regards,
Francois

> 
> BR,
> Jani.
> 
> >
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_display.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> > index b6b547c4877c..54f52b6d702d 100644
> > --- a/drivers/gpu/drm/xe/xe_display.c
> > +++ b/drivers/gpu/drm/xe/xe_display.c
> > @@ -331,7 +331,12 @@ static void intel_suspend_encoders(struct xe_device *xe)
> >  
> >  void xe_display_pm_suspend(struct xe_device *xe)
> >  {
> > -	bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
> > +	bool s2idle;
> > +#if IS_ENABLED(CONFIG_ACPI_SLEEP)
> > +	s2idle = acpi_target_system_state() < ACPI_STATE_S3;
> > +#else
> > +	s2idle = true;
> > +#endif
> >  	if (!xe->info.enable_display)
> >  		return;
> >  
> > @@ -360,7 +365,12 @@ void xe_display_pm_suspend(struct xe_device *xe)
> >  
> >  void xe_display_pm_suspend_late(struct xe_device *xe)
> >  {
> > -	bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
> > +	bool s2idle;
> > +#if IS_ENABLED(CONFIG_ACPI_SLEEP)
> > +	s2idle = acpi_target_system_state() < ACPI_STATE_S3;
> > +#else
> > +	s2idle = true;
> > +#endif
> >  	if (!xe->info.enable_display)
> >  		return;
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
