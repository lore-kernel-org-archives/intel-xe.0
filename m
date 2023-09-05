Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A55C83F2C
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 14:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EED710E049;
	Tue,  5 Sep 2023 14:46:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1601410E049
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 14:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693925189; x=1725461189;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g5KAn1L9sX6DA0LM5zvoog7r6uZEVVpdAI0rN8xQI+I=;
 b=Dk/CPr35HXYwlsnakxfy5daRVRqBHP7a0jLl/s5WZ/cny5h5HSMGmpJT
 6J/Vao6sQs1qen8SCYxb35G0DXu8yxJhy4/E58gcTnoT2x6PK0VEg/dzf
 JgKYghhg+EvYbS8vLGuo/5Gxxqf8NWycKa4g+Xe4POdlS2/zDrcEa5TYJ
 FOkQ9NNCRcbS8lleuHlcbOvMvRzDvtR8aMnU1gIyTHjyOLHXWRCgBTTw2
 ic9ZiTreCrTkKnbT+PChkuWNlNlkyp6vU9T2W9v4BTOAwI57m59Bei/qo
 zymIRqUppEjO0l/FcHgd0NQW11+l155rN3xVyLQA9ziWOMmgSmi3HtWEj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="375703376"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="375703376"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:46:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="914874534"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="914874534"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 07:46:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 07:46:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 07:46:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 07:46:26 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 07:46:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9EC1Hpvqru0mo4D+/6cU3ZERVXXDviCW5iu0K2XrBEcgVEp06lIsmlqCbVfVO9orQ5JUsidIyPR9BeZs5grMpKCm9eG0P1jbQwnzxUW+If+BZGre0mzyilz9tYzWK0pRT2szb/1yZXtfdqX0slYVxjf7SdK9niHO/h8pHr6EhP03iyB5wShy4mvEini/A5tD7Jvi1R6jbJQ6wly6G6inDX2s9mqmmtIp1IZEu16f4q9WvORAv8VenXWrjNpsWhF81ISfW04y4sjY5MIu5LJFOHlIUEVL7yZ0FUQgd/P9/rNPFz+ZnOD9+ybntNXCpAcp30E4u0FLH9hFRtHZdK8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnXvFjwhTD7kBz/qAxZeVRYxZAaxelTD5r3Nm/bOqxI=;
 b=jcub9OiWQeRdKu/seMSVo3FyQrkNM1xeWXqRJco/0wHBaIt6FfScqxQ6JnbmyNID9RLQNcwTtB26ppjMaQbZfaGhl3yJ4Zwx4oEIS7CIfLyuKHQfHM93eKhGayhpdUMB1qszO/V9uXTQ4/EVsBItcW0/0qpR65w1k5byHEwelA4YkxdQqRPYoV3p0Vzi4pap000suz1NWa5aIXOufRMhdUw+7tTJ+jD8m7Jkaw3MMd/hJ4inbRLXLrOd+2wt31F9pLt/bHDqaWcXgwuaDfNt7cUx5lcS41HUl17LF+tvoXiV38nfxZa6+LkECZlwKs0/ulnFfedbaKs3SBJy5AwaQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB6663.namprd11.prod.outlook.com (2603:10b6:806:257::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 14:46:23 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6745.026; Tue, 5 Sep 2023
 14:46:20 +0000
Date: Tue, 5 Sep 2023 16:46:14 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZPc_NiCh2lZ4DLpq@fdugast-desk.home>
References: <20230901160300.7-1-francois.dugast@intel.com>
 <ZPJHDPFObO5wMzTX@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZPJHDPFObO5wMzTX@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR2P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::17) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: c892a554-3778-486d-29e7-08dbae1ede6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zm6oRIY0vCh/KTOeAX27SvHRShZx4dUh7oIRT+3xpDs9MkXCuTTxaVJT3Mh12kg5y/u9/o1gU82peFLbqxP/fS4okBzgV6QFB9QG5GAP9W2yZxp9xKRCzft0Lb/TBNG6PAvtdc8V89fyioS2SEUKy7AzCAC/vaXL39R50BwP2pEnIxZ5bUcQWxArw9d4zwTEGSHmwcOrIHaAtY6gn1c5SrSZbzpTXn1gDurcuHbiK8x2AwqWErJ0hQ94PJ4S09C9MBF0XafkIOgFeDwCI9/34fQkzXSErqHs4gZ00IR2T7BAFS/cPu0joS4ja6I9/ga1wdMrPQeBzDZGJ3QuOehr77MJAxz6S9vjX+KhnADhz51EU7n+POO8T4S/rSm+ir/alvEKabpCd6iKSBCTyl9N+9rU7KGl9J1BEXftTgsors6JsaCpp9spTrBMxo0iklWLjFxUvc35UOJB7OdjJX7gC3YymF1C6wru8giNCmu5MK/aP1XiZlWL9Zdkev2LlqtIM92mlUxYW+rxvkn0hrykSxxnCApl/QNDEjLXDReb4957/5SVPHJTyk6FxNOe6tp1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199024)(186009)(1800799009)(8936002)(8676002)(5660300002)(2906002)(6636002)(36756003)(316002)(66556008)(66946007)(66476007)(4326008)(44832011)(6862004)(41300700001)(6506007)(36916002)(6486002)(9686003)(26005)(6512007)(6666004)(478600001)(38100700002)(83380400001)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8o5TqHdR+66si5FYZN5yHS0GXW8cx0M9bWk+emcTkR8HWpeKaDJYaGwr0lOX?=
 =?us-ascii?Q?wp9nPVwy/6RQ73tcMRj7YkXzillupPx0uvggLc8oQLhdlr7IkECEGSwJlJSZ?=
 =?us-ascii?Q?g6F7b4ro1oToitO8Ai8UId0D7S4ZCU6rENSbZVUS3J8dfmg3Yf6vKfn0t2zJ?=
 =?us-ascii?Q?EoZ/imoVxYVt69eAc7XdEg70lFHXB69myUceRDAJisFzPM7FLExbuUNAyULY?=
 =?us-ascii?Q?z7mXut7eLIfMkXaRfLtKqGI8a0xE/Jl2AMgAbBJmy4Ocolt+2VQO2akH9eRt?=
 =?us-ascii?Q?g49YbphTNr0PiMjHdsfwC2no21/A1IqngnfQKYLP+tLcf4wDqy2+ic3aMakM?=
 =?us-ascii?Q?MHPmjpimbh8fz2MizybE9zh/+BfvTF7jCACBYHmIMXr55JYhg69GDUACHCQW?=
 =?us-ascii?Q?rd5gyF4xiKQQ/guyjH0f40sYZyzhsBAhTU0n/O0Iy0ERPeki37JND7FSB/05?=
 =?us-ascii?Q?rmocwfv1JxFtL02lvr+refZsGZijUPtz7CIMC63xt605UQyeXYQ3/CE84ew9?=
 =?us-ascii?Q?Y22Qy5TiPFY5+b0bHrBHM7we+lYac6s5BLZOL5yX9/g/kRpl79YMREc6tSay?=
 =?us-ascii?Q?TQRERubIpqcrdSch34mHNeL1i6QRetfQVkNFnHR+MoyfDasFoXz/OVIDnzLp?=
 =?us-ascii?Q?9MKG+SdAlYVJhl1b9s+Gi/UWr2/hLCN3rKEinxhGLUPKwLjbJgwXfFNuHWR0?=
 =?us-ascii?Q?9cFcSzEHFbMEY788i432BUIvYJaqikKUz05NPduqToiagwcSeqi7Vztx8UgC?=
 =?us-ascii?Q?edcmS69nOYhF0ukF+D8brbUKuBA3Ru0MK0aaY60FYFh3wP4Edkj70CtpCnZy?=
 =?us-ascii?Q?ykCUu8QDkv+aXWvhMWJDnrCPaVMtU3A49eSYHghJVe20e/PosSbvtUqF/Gc9?=
 =?us-ascii?Q?CwUH18MnLHf9zNpU8v5fwNouPN1HSnWKnCzGgMiT1Ehf4yVVbF5DOmFf9j9N?=
 =?us-ascii?Q?yjtld0znqoHQW7mPQ79h90uwWV75ZfHc09EV5yQBGUIZ/qe5cvLHoI+POvTG?=
 =?us-ascii?Q?A8T1v7SnY4rIE7+Ch30OShijrdVTM+5A6jUGMKSr1AWYynK49el+Dwee3WhV?=
 =?us-ascii?Q?N6XPYL5T9blSkc5V9jhFkRWPKbFGwqObw+iVEjF6FyWZZI1uZ7eCLpgW7Fmg?=
 =?us-ascii?Q?ucqvSfZI3P5xHBLQ/OYz13tSXn72ggB8PD5OjAC7vN3PsCyYjpOLXwTDGyri?=
 =?us-ascii?Q?A9M2gwdosQ725NBXaYE3qowM5dI/233PfcHhxuIYWcjrDlMEXbTyRdzJvhM9?=
 =?us-ascii?Q?CeAXvJ3Ysxn4l14CRr34b482lK7hkRlMn+X7Mb9gRW9QO3ElAGSCcPnmuYAF?=
 =?us-ascii?Q?DO95Msfm1Xeknpi9LRLsGW/L38QTx3zmPQ2MHBcO9uJLRwUdqmqXvSYL7ufq?=
 =?us-ascii?Q?JHEJ0fjAWzagsX46tb2kD/oVOePw2MdLYLDr8Hjn0Ac3yafycWoFjTn26hoL?=
 =?us-ascii?Q?BoPqVpnvQh3g780bHSzYaXJMWb/0Wr+dljm15UNuO/zqHT7aOxuVK2MHpjUt?=
 =?us-ascii?Q?giyl6pkq+9rULtqhfU5c9KGBrzG2vMpnFqH+BwJ4t+g39yKiy8D9chiKDo9C?=
 =?us-ascii?Q?hdDqS1a7GKBL+OBQMwQXylNTj/j3pr25jN5evI3kPyLTqs6YvzEyBtFJWU0/?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c892a554-3778-486d-29e7-08dbae1ede6a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 14:46:20.8354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nzgD1o8BZALaaQH9oj+mEbs9UdWwnb3zYUMxS6Fq8b4pvYrEEZ0DPKKYXALkWQbpePRbpATSr4HntMXWZkm2fkKaYTGA8xmcS5AAFcGaiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6663
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

On Fri, Sep 01, 2023 at 04:18:20PM -0400, Rodrigo Vivi wrote:
> On Fri, Sep 01, 2023 at 04:03:00PM +0000, Francois Dugast wrote:
> > This fixes the build when ACPI_SLEEP is disabled.
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
> 
> what about:
> 
> s2idle = IS_ENABLED(CONFIG_ACPI_SLEEP) ?
>          acpi_target_system_state() < ACPI_STATE_S3 : true;
> 
> ?

Unfortunately this does not solve the build issue as acpi_target_system_state()
is not present when building with CONFIG_ACPI_SLEEP=n.

> 
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
> 
> since there's duplication maybe even add to a static function?

Sure, will do in v2.

> 
> > +#else
> > +	s2idle = true;
> > +#endif
> >  	if (!xe->info.enable_display)
> >  		return;
> >  
> > -- 
> > 2.34.1
> > 
