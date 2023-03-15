Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A78C6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 15:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D136210E8D5;
	Wed, 15 Mar 2023 15:24:36 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9569810E8D5
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 15:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678893874; x=1710429874;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4Hryf5alf75q1qy2DiLDpntnKGHv5PYZExPJvXognLQ=;
 b=Dr5Q1htIE839Qd7lVteanX9Y7g83Nok5nrqryACGzZMoLqzWpdB42p1/
 ktP8jQqnmhXTM0vb5lKrlZET85zeP4mwT5L8/aYHC5V7KEysxARHXIXw/
 21RwEyVuxFL4mofhqITQA5Gyb9oAOgIaIA/iMeU+dxgAs0Z31ek7hSGuL
 yG/7fy6HclgwV4T/7j7EGZZzOeUc8X0zlYgxz7JvPZWQ9X/g+Q9FqvrGV
 4x3mQl/IDDDX933XBJp/h4T2ngBnJlMkphWoRPH2mg9k0JMgbHUGW1gS6
 n8xwwUQg0oi8iebqI0Tz0RBi8CorsRliilj4+VVTfL+S0ci2Tn32Q29LU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="340095046"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="340095046"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="925373361"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="925373361"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 15 Mar 2023 08:24:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 08:24:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 08:24:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 15 Mar 2023 08:24:32 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 15 Mar 2023 08:24:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkMTm3F0+BuGULAcKiduVAHiR0r+eXXkIY196ugJL/uWtsAJr96ZTKpu5ucIYI0+L3qJJ0pIoD3NJJJN2qYQqnZj/BT4YPyPWc+JMgjqUBFqAlv+R5HCDplhgUdgmaFwcdMQtds2nndP2LBtfNf0CqXFkcWZJSPmeRrkDgqdFiDEw7IgNKDCC1HrI4VN5EpBaGtyNVdsSxinCRoCtmlf/kyJQ/Rx+LyQnD4k7c4tEbaysDgo8w2dCDOo+mWFVhLDNtxZbZrpB/ySymIUkm35rZCBdpm1NZnuCDadO87TPUIYr34CUqc53rk3jbsa9LtmQ1iZXoG399RHSn9gxkvHHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u75TIA4ZxjRzUL/Z2uSthUuwBV0wVPogO5J7zTBsq7M=;
 b=cSu8xQW1tyNwxIBJLHmSPPQRMlwVoew7hXvrpl+t+VKhpZNd0jtbDaR2P5OiQIKwC9Mgjy7M0+xHwiWJjhoj/kHizn8E/FZ/s3CrtD4iOPJZtSbqoEARP9zbxXw/x8fg8AIPHciCt07Jlu75Ch+a4NYce5cRkKI01Sl9coyisMI9ujMkuOI68Ji8V/vNylPHluE3PF8tCARuHrZEc6XwnI6+me5j8QshJ4uHVLaE627jPn/ZIHgc6uPV9QtmygQsn9uQdXPdhYW5f3SDrLVuysO1PQUpLszYgI0V4Ft+6oqZhu3Mbv9M9ojxBE510T95dJ/6O3cp9HdQH8ev4VHJNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6394.namprd11.prod.outlook.com (2603:10b6:208:3ad::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 15:24:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.025; Wed, 15 Mar 2023
 15:24:03 +0000
Date: Wed, 15 Mar 2023 15:23:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZBHi8LilKnutuzQG@DUT025-TGLU.fm.intel.com>
References: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
 <20230313204519.158888-3-thomas.hellstrom@linux.intel.com>
 <CAM0jSHN+vy8R48HRY72ZCmmfv4LG1uMV3zBrY0GMMe5P2ADCYw@mail.gmail.com>
 <f1dd8fdf-09cc-01bd-f4db-f2991ae77883@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1dd8fdf-09cc-01bd-f4db-f2991ae77883@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 00879133-eaed-4135-ff74-08db25694f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Nf3+vfpmS/sUXjhIDiUgUSPAZOLS4uRHD3DNxtNE5j6PdqQtObg4s6S6BY1l8lXGt5MZCpqXgB3+b/NzytHedtsJblv+xqiEvvqdkFUM7WhiceNzJV9f3sDUllB3kuiHZ3nvRSGpft0cQLUYt+EQ3cnMdlKIN510X276IMwKLirerIzZkfGU8FR7uwl+CzsGuxIcis6J1GIBKql0rR+2VftyovfWfVexdIVzCvXTlqJXbgmwqs38NQ7kKF/TQjAFZ3G2bX06fW4IVcHvcPCY1Dz/kGjXYMrx99PZ1rDrEiIVzK57ayNAtREnTXDtMtvb4O+vYISVPyQQJj/5e5KqqrqDvgLwJfHl56oY1gDgo0pxKIVGLu/mfazFEGTGwwT5M8oEUEtbUj8d+rhUxvQCFVZrmjwMxRndRcTBxeXvL9hTCNZSB+VX04ACcdiWRYMFzfO2qsb8TBdflUTkQYFhI1/sEhovTDtBPB/ZhLyXH+ePfr20p797iULyg8EhbVbb7uUlIVqBOJuUFx/0GNpIYr+MEXOVsy2PvLfnUg0VVhN/0LSOD3OEPIqVlS23wjqQUMPCPAMKTBKpocpyqk908WDQ3SBt/N99DxWs3xdy5z3VucY4RGK9lU8HBSerVqjzkfGJQjmVANmmLu13i6LqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199018)(316002)(41300700001)(66556008)(66476007)(66946007)(53546011)(186003)(6512007)(6506007)(26005)(8936002)(6916009)(4326008)(8676002)(44832011)(5660300002)(478600001)(6486002)(15650500001)(2906002)(6666004)(86362001)(66574015)(83380400001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?R1REiBbg0IQiXP6GWdmqu6czthUla6wlG4vHoX43icodcoo0k/jaD5QOYB?=
 =?iso-8859-1?Q?NzYX/gob/U0dIurxbZKn4ITrYAT5A3mGKJ+RUpDOzP2hu1S2UJGnkXtumb?=
 =?iso-8859-1?Q?xBUZrEi74GJ4lKRUtGSYVctkeFGDqzEGaqNLEu9k9VjicGReXr5ZH5SAcS?=
 =?iso-8859-1?Q?m+3Ndj0FFMjgmuDh3UmUb1mcDuhHg3CEXiHyoGXrWkku734g2imM8NIaBu?=
 =?iso-8859-1?Q?DxZQuAFMCE12A4Z3SIiuOsE6JwTyNXi80T0ORUlnu2CJbcEmFkKCHJ+owj?=
 =?iso-8859-1?Q?D7UMxutRQV4bwTvPP8GmVcQ5IYagSyhlmyhUjtTOuF9FGk+J0h+Fr+r3xH?=
 =?iso-8859-1?Q?C1HtyAfad+c7bm7vHYqP7AGS3mUAqD7zbpkwFqLHX/HwnwIZUkle4WtRsr?=
 =?iso-8859-1?Q?gEBesDGPi2szd2irttA2AyvYUbVfq2WG6AdmWyo2mdx0JBS/UlZT6K8gYz?=
 =?iso-8859-1?Q?i7Bbv24N1iHXxZqwWdXkBwIUWO1pBK5Itcb+cKF38ysHMCOKx8Vj+Fb/5o?=
 =?iso-8859-1?Q?cblKJU0rw/+VwLZOTBu2dKcfvpnxtzullawQW6q7WE1scnKKbjXNIOD/02?=
 =?iso-8859-1?Q?OJSUPCMvj46jXiDyNL3FQDKVn/D/5NMvdhjuUoLLShSTjNYVVOEBWksfeg?=
 =?iso-8859-1?Q?EuAO439nY6YvINHZhTns076ld8L++iuyo8Zx57HnZVLlcOsxjm07QBIvnF?=
 =?iso-8859-1?Q?+A83B+pg7WvaalguHKiaASAT7vAquH+x7rnQzloLnrOwrD4RjWHBMYsMky?=
 =?iso-8859-1?Q?RCrGJ0mcjpWndWUFTRrBPvSCCWQo14KteUsfSWUsuNWpV2wDj8wZ3MPAvB?=
 =?iso-8859-1?Q?+zjSgVfh6Cux5jTFvJ9sBA8TQlXQFz3tYRR0qyE7FaoiSGKFUt10zrOI2e?=
 =?iso-8859-1?Q?JE38ufIB5VSvQ52TbA7spzAtG1J2jsBvUSNl6orBGV8nUiMKGj7If6PFv0?=
 =?iso-8859-1?Q?TghILt/hi1AftBiJ+oWZpwENrr0jXNRDmIlPIj3qWFxcyMbhmuLc2Wz2BK?=
 =?iso-8859-1?Q?NgGD2hffgWFt0Vv3ciT0JQyJb42RTYGPF2wmHLDleonZKCJ68ILD8pP996?=
 =?iso-8859-1?Q?9/SXVTVZfTsAzFDbeusrOv5020eekcfUiyIlPRRXqff2x7jxFWmqhhAN2R?=
 =?iso-8859-1?Q?KbzCDhJXNtwk09ymzRG3xV3YkoOoJmo/8MJMqqstpAgM20iGUUngyhtDXu?=
 =?iso-8859-1?Q?FpBn7ZZGacz24AsvC8gd/xEYgRPaemJNNOo6wNvUGP/iacdxTpCxDnwH/M?=
 =?iso-8859-1?Q?u5In2pKgav1SjFrIxP/xUJxgNr+JJGPAQyr1SlxJdAjXX2dkxe1naKc7sS?=
 =?iso-8859-1?Q?dCEekBUNvfc7isODr0kUhgs1MVBqdBcLDGPqmOwygnTaOogAeHyJRxJyaN?=
 =?iso-8859-1?Q?JMr9V25rCyCUVfr2/n9Cb48BkzPY8YblyhBPf/y49vf/PDpc5B/eVp8CB8?=
 =?iso-8859-1?Q?r9g8U6TL+/2Z1uYVVAlIJ5UUb0bReg3mBS6oy1sJe7+gjx9u3HkWHmdP1w?=
 =?iso-8859-1?Q?N1rrKDP0yarNzBLUkX9BxOFVPXH+ehH+7x9TjIpWycowB3hWLcW/NSBJBP?=
 =?iso-8859-1?Q?d0U74JIX6xXVL3RZ1Pztn2SPzwbLj4oOmovbbBmHoc9yDg4ODLEjXeomWO?=
 =?iso-8859-1?Q?2K45sW7U1G7FGG33lqfse4JraRU2oouMpNuW4RBl47RPXA0UmAzkvTTA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00879133-eaed-4135-ff74-08db25694f3a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 15:24:03.5835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6d3X9xmbk9u/8O5cXoRwU6ItF8PNjbuST2neMV6BiXIwcLAcfGrmtUQ7uw0CLPtmoPz6g05+Av2cmDTEOXtkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6394
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe/migrate: Update cpu page-table
 updates
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

On Wed, Mar 15, 2023 at 04:19:20PM +0100, Thomas Hellström wrote:
> 
> On 3/14/23 13:15, Matthew Auld wrote:
> > On Mon, 13 Mar 2023 at 20:46, Thomas Hellström
> > <thomas.hellstrom@linux.intel.com> wrote:
> > > Don't wait for GPU to be able to update page-tables using CPU. Putting
> > > ourselves to sleep may be more of a problem than using GPU for
> > > page-table updates. Also allow the vm to be NULL since the migrate
> > > kunit test uses NULL for vm.
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Seems reasonable to me, but I'm not really familiar with the history here,
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> Hmm, it turns out that this change uncovers a bug in xe_exec_basic igt
> (unless I misunderstand the syncobj semantics). I've posted a fix for that
> on igt-dev. With a little luck that also fixes the strange igt failures
> we've been seeing with deferred storage allocation on PVC.
> 

This change LGTM too and yea I've been aware of the issue with xe_exec_basic for
a while, after a quick look your fix does look correct. Will do a full review of
the xe_exec_basic fix today.

Matt 

> I won't merge this until the igt fix goes in.
> 
> /Thomas
> 
> 
