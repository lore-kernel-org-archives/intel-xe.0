Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1C2C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 15:01:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9711A10E339;
	Fri, 14 Feb 2025 15:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPHW/6VE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EA310E339
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739545265; x=1771081265;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U8e84UlW24LHF7Ot/oZbcGNqpAHtoQYucfdwysnl8BY=;
 b=jPHW/6VEvn/KkrjHT1ntWexGqFgHvTlmVPqDsp9DG2HRVjEMP3lJUugA
 6HXim7WK6WGnUhAAlNpjmlgQ6mrbhxdIr96ofc/YWrbHwIhhhTPQlVJmN
 yTeS3+q/QQuFa39K+EvuCe1fPLwJjiNcYuZ0Js4gn0pWPl/YidNV8Tzcl
 FloNRBEw/Eb1z1PMnOhUZj6GmC/biNHXuTaecLIHup4LZ9CGVQvfw71h3
 z/hf0E09ENDlOuI8COvs9qkgEegoHmvjGTnxwmFY/AYrs4aZnRKXBC7q6
 Ec2t0+Nmblj7+ucg7GZmKhXN/ElpKVWRMyj9ZMh9Fu3v/wm79OGz72cmL g==;
X-CSE-ConnectionGUID: i7KJlGN8TB2csJB4c3O1nQ==
X-CSE-MsgGUID: mvDAOqg8SUW/IzQmnehSQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="27895749"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="27895749"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 07:01:05 -0800
X-CSE-ConnectionGUID: 2nqUIiHTSeiONovZ01uJQA==
X-CSE-MsgGUID: zzDcFUTeQUC1m77oycKzLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="113994178"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 07:01:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 07:01:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 07:01:03 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 07:01:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+vtFldrGhaaC2TwG013BcI4Ltt/Q0cfmLiMjIlLTRrA/DserQfOLpwm1eWEyHx/cXNotvPqs+QHQHm+DKTWocEh0Fvh66V2cg1h0oDNSvX4i0JX5b1SSCUIzvqpJFDHDWeGDG2TOQXpoA4VuIYR+Tvn1FBnra7+0PcU+mNbufVYtybzT2L2YRbzPPgMGjatRhfyoBdCaLL/VZV55OmnZayQqIYs424YtoUgnr783z5JYfRSI5w3yLxjzpGXtKlx3/JJ5unKw2uXbdKesyIOcGYDYcTzbULtmEoJuznFGJ05R20m2kcJ27wNHtqvBsFMUxb21YEwHy6XQyocKcVWIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQl/m7TxIrgsP4YvClfp9tKR3X7XrPvAqariHZHDx54=;
 b=PIMzZM/RYA3R8gWQtQwAH6UiT/Xo1NbUz/xw5Agdvg1aUrpCgIGnfsOIiZfLBXL7H4oK2NVGAzW2WjcMqbPIep78IkZAXkKo6gu5I4P8gYUYSu4Qyyuba0TKeGrANRi6Q95M9Iey3PuA5HdypEtwNMAePz4HId1SYmaYwIgUNUudnVe4PuJ/38l00dsk4v/gV+0bs/VUHka+DwLDI0rrZGcrG2hU12YHyoFsfJlb4qCsp8EpOqozYjGWmCHHyDtl6CJyeGv3r1dISV8ISxSrc9p6Lc1E6fhkhAe4/iWD2M6IzflGyat/fXYFi8eH9V1K3OPr1ITKgkMsCqvVc/TyBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by BL3PR11MB6436.namprd11.prod.outlook.com (2603:10b6:208:3bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Fri, 14 Feb
 2025 15:00:46 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Fri, 14 Feb 2025
 15:00:45 +0000
Date: Fri, 14 Feb 2025 10:00:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC
 fails
Message-ID: <Z69ams0A3W7BLHma@intel.com>
References: <20250211200911.199213-1-rodrigo.vivi@intel.com>
 <46c8e0b6-59f1-44f1-b3e7-30075d86bcae@intel.com>
 <Z6zlUOQkRtA5RI7X@intel.com>
 <0c223a7e-7078-4905-abde-1e2924352937@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0c223a7e-7078-4905-abde-1e2924352937@intel.com>
X-ClientProxiedBy: MW4P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::16) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|BL3PR11MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 122ede10-ca6b-4863-49b2-08dd4d085c01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Yyg37iRPEulZe7qc/b0oBrcsekQgrkZ0CD5cemvL6gozH+lFLPZfpbL4zchK?=
 =?us-ascii?Q?fhFWNxdqUI/D+SqQ8iPnGpQ0AWlt0GzNz9/IpxfIt07KStz9+kNsHiBOoADf?=
 =?us-ascii?Q?57WhbL9SfNyax/x0mzJ7ev0C1hpPgvpSOznknZFkSBz/FpYcZk/pWQ43ga9g?=
 =?us-ascii?Q?AcxKJHKgmUApVNCb6jxF3oEU2+RKdd5g6m+XHbULB24vjxEYH2hqDSbBEOYl?=
 =?us-ascii?Q?lJhdDkxEHBZrrmP5jwjvIIl74e3yfzk/3Q/ZdpcyNLVvZW59mutXvg5cfoab?=
 =?us-ascii?Q?ZiMVgJh1pxzZhFCzpUxOhiSSz8GiBRj7AYi+cdTqRlZWwQ6JGrrYU7s/CXsc?=
 =?us-ascii?Q?1uu+gIMQNejULUN4KvbKYWOZcrC1QQyFTVIBvPL5chJtEoLQrFmRcx7/v75u?=
 =?us-ascii?Q?LRMkLakzgN4i4yUo7Q5oRlLXe+sbgAt6nn25EfMlwPV8S3aLp9PUR/1ZCYYW?=
 =?us-ascii?Q?O9IBHOnolSt6LsLI7WEVf7ocWM2bKykbwf/or2yCjs1wjnEodGOyTlQIRzyW?=
 =?us-ascii?Q?gx9TJGfhPNmvDjZVla4pJq3ue6wuOOx0lNleCD9Hz4dkVOl4tLylen64CHVA?=
 =?us-ascii?Q?AUxAZiH5ZkBvg8sAT6qiAMhZhe1ACuEZBfZqTXGg3F5Apemvd/TUGVUmD4++?=
 =?us-ascii?Q?uodsLUiVj+BOgVViPQciT+Ejg8f7dn0gXxWp2HG933CbpQpZZ01kHxCwdUDf?=
 =?us-ascii?Q?HgJuBtShljZx4mHpSpW2D8lkcJikGAjRSUmaB9CYh/vKmBKGfATVidTqrIFH?=
 =?us-ascii?Q?cUPoP+rqMSZyN7TdY/GY3hjYntlq3UC/8f6q9ED2rWKqVnpxSrp70IjoyDMT?=
 =?us-ascii?Q?wtSySpMbtNky8ZYa9yp7NAvCkr84shKXzxAceiqzfZjBk6t72J3VDRy9srI9?=
 =?us-ascii?Q?eKEmLQVbK1P2GZlwhz6T3Bs3hVunPKL08qG2Wc4jC6KPc7/jMgjJgJu2I0V4?=
 =?us-ascii?Q?pJGCv8tqoId+TTVNldRvcLh2uYekdP13QBnTTek+/BohYcYSNA2yCzszOeYe?=
 =?us-ascii?Q?CLqQ2K2aQAyJ1lKLZQ03lISjJ7qcFuOzLuQtEUvSQkF/FundPOZv8yhoS0lV?=
 =?us-ascii?Q?UoMPr2AaVFm/Bb7zNcO3vilAY3q7IYLthwkQVbujLDa9VB9whQA0M/gZMwdO?=
 =?us-ascii?Q?syvgyY6HK3X63CBrRaDbBY2ZGLPWDQXbNTCzaDkNrLt4lmZpAHkIub1mSO1z?=
 =?us-ascii?Q?Vtf6i4Hsy+jK0rK3pVWWfUbA3rFNgM9fSQVXu5JNqsvoHiMuv/DwgKwdM/29?=
 =?us-ascii?Q?BBD+xdTkIpRmeoYk3o3tjelVvSbC0RhOKL6gdpYqz73V/ttu+YPZ4/4ZEYCx?=
 =?us-ascii?Q?fypWtP456eT8RqeflTcrZpWWjFXSOu0rz+AmtoZ0iyhSBjBNPYIOTQT3euv4?=
 =?us-ascii?Q?bxMWHlAkcMckmRyk/amQdxSgayWr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k3uGTM8tH2ynNY4sYqwVV9dxghwPp2mvKXEmz2f7lJWOUb4ktizgiZfDR5nj?=
 =?us-ascii?Q?/pXS0kOklTzyOtWS54XTsRwX3zMr5qLqedW9R8z/0XVUw6NVQ8MgEr7a7DQn?=
 =?us-ascii?Q?OTBOmo9IkgN59RfcsEEUDA0PovFDuAy8IyQhfqFq6WPBKsjCA86GztNftZ7f?=
 =?us-ascii?Q?PL78evl4RJb7MPjQLg0ZcE9KpHr3AoyffEnqF8+8sb2EgoutSczLFBRlhiJu?=
 =?us-ascii?Q?sGSF0xwxfc99lLqvxHzMzLf6qHI/IeDe614qPXm2R8bTwvfo3l+TfNvqhG3E?=
 =?us-ascii?Q?ltt+y5vUNaarJz7SlygymIcCR84v11q6z2Rbm9TU9q7mQEhepg2TwhuikJA7?=
 =?us-ascii?Q?QvBRByl2iXMcdyEXKShYyhoDYKNTuCa2kTAg/aX2X1qD+vNK4ZRFHA00kjjZ?=
 =?us-ascii?Q?4wbxS+x0AwK+9AaCLlhLomzWZfhx78jrZ3h/oosA1nKcfq9TQihND3OsXy3W?=
 =?us-ascii?Q?4BybOByxoN9geHssH/4+x946Pn/M2xxe2V3sr3AJtzZCEzbIio4vpph7uHeB?=
 =?us-ascii?Q?evaic+/I83HLYNdN3JOXQ8CluchuvZtH1R/EHjjvR5dmKVLR0x/oe4wMB62a?=
 =?us-ascii?Q?P6wvF3gpvPPfAFouhyX+c4KSKRWpg2mlLjkdq2Ze9UgRs5/YaothrH1uplKB?=
 =?us-ascii?Q?e13Km5yrGhyf3+CVEL387Vk8hObmDOM8oks+8ZfGQLBQt8PF2anB0T3hCN9A?=
 =?us-ascii?Q?+r3J2KaSiPQv/ThWnwOI0jPYpbKpUOiCDyZiBY9HZLuEpDdnXLswDu2C7Cib?=
 =?us-ascii?Q?+DpsFgeENyXLclDKRvuQuxVxxj3YJPn1HTt/BZNZd4h8RnXvhFuaaF4uwQgO?=
 =?us-ascii?Q?rPfXogZucIl0ifKMG3q/0I7F/WVQ8n23ugLbyHhNA5PQkc0yD/QIWOGXUxA8?=
 =?us-ascii?Q?C12tzih39TvkMhGraoqTxNG4XQqr0nSXdrpJvjqwu/JdHFc+lYRK1dm6iZ7K?=
 =?us-ascii?Q?onOyNKSsKwnitHJCaztCbLlBHu7gBHpGWwyL2Q5VoOT5mYaXv0E8ohNYDyhL?=
 =?us-ascii?Q?q68Yk9udg4owOm6LTohkQmZuNHO5sIRooO5R7+aJpN1/wfq6Ef+KSB+dRMMw?=
 =?us-ascii?Q?9e6IUDdSzAmVTRVX11n1LywU7pqTuME8foXPWOBn9GFQVP62eG3Sb3zG1ZGV?=
 =?us-ascii?Q?FsoTdY0dUSjfnr0ePZuzOG8x4brnHyBvf16cBlDWd4rcNpf2XXfvrLgwou/t?=
 =?us-ascii?Q?+LJayzi6hend+k4TN+ol+1jO8vPpZ5AhGvanXxo+7s52bMAHWQwoLmVaLmWd?=
 =?us-ascii?Q?ZjT7yd7phZ7OvKF/VLQF99vKj+n6ECagFl2K+/BPF5v9i+tbJPK/bWR3u+Z+?=
 =?us-ascii?Q?VD3XvXbY498xy9bSrVEUrwgE1ya+1C6Otk/97pyf+rARxRErRkTNFgYpWekU?=
 =?us-ascii?Q?vgaxSMaqReTgfcloYeMyZ2vHX9g8aj4OXv37pDWm/Saa0B806bZ45CmOKHoi?=
 =?us-ascii?Q?fgiDPX/FWfcRaG5CDdmiJPpAyX5gjjTLX9IBgAmzFfx2NrcW4wzYlIXC7lQl?=
 =?us-ascii?Q?WewLclYvDZX9np4/NsAZ5Iq8hvGdbe8/ik2DGCkSYfEvYhifCHm63Jrc4yW0?=
 =?us-ascii?Q?fAGpSk6DFMpdqFFuSmxtTgOCACCXhjQppgu377WxSMohP0Uk6fdkLBtaBkOT?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 122ede10-ca6b-4863-49b2-08dd4d085c01
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 15:00:45.8422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYxQ/8XZFT+K9BlFGljYb2qhwQM63ZzpV7/gWsLEbjBo/pabvcZEl9hvWU5TYhf6NMuSni6VQ5GKlcwiFjaLCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6436
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

On Thu, Feb 13, 2025 at 05:37:34PM -0800, Belgaumkar, Vinay wrote:
> 
> On 2/12/2025 10:15 AM, Rodrigo Vivi wrote:
> > On Tue, Feb 11, 2025 at 05:19:14PM -0800, Belgaumkar, Vinay wrote:
> > > On 2/11/2025 12:09 PM, Rodrigo Vivi wrote:
> > > > In a rare situation of thermal limit during resume, GuC can
> > > > be slow and run into delays like this:
> > > > 
> > > > xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
> > > >      		 [status = 0x8002F034, timeouts = 0]
> > > > xe 0000:00:02.0: [drm] GT1: excessive init time: \
> > > >      		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
> > > >      		 perf_limit_reasons = 0x1C001000]
> > > > xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
> > > > ------------[ cut here ]------------
> > > > xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO
> > > > 
> > > > If this happens, this can block entirely the GPU to be used.
> > > > However, GPU can still be used, although the GT frequencies might be
> > > > messed up.
> > > > 
> > > > Let's report the error, but not block the flow.
> > > Can we expect other random CI failures due to this? If GT is not getting
> > > expected frequencies, certain tests which rely on this will likely fail,
> > > causing a bunch of noise. Is that worse than driver load failing in this
> > > case?
> > This issue which I pasted the log above is blocking the resume of the
> > a LNL laptop. Everything goes blank forcing the user to reboot the
> > laptop.
> > 
> > I prefer to have to deal with CI noise with bugs that we can work on
> > than blocking users resume.
> > 
> > But well, we are still waiting one entire extra second there.
> > That should be more than enough even with the thermal limited
> > condition there. So, I'm not expecting more bugs than we already
> > have.
> > 
> > Also, our IGT test cases are prepared to deal with some EAGAIN
> > returns right? The probe and resume functions are not....
> > 
> > But well, any suggestion here on a more robust approach?
> > Or can we go with this one?
> 
> True, this will unblock resume. However, if this is a pcode bug, we will
> allow boot in spite of a persistent failure to get anything above Pmin.
> Maybe we can print the frequencies again here and explicitly warn about the
> loss of dynamic frequencies and GuCRC (and all freq/c6 related interfaces)
> from here on?

Your gut feeling that something was not right paid off... The ret = 0 and
the goto out were in the wrong if. Even if the second wait succeeded we
would goto out without doing the proper freq and gucrc initialization.

So, what about something like this then:

-               xe_gt_warn(gt, "GuC PC Start taking longer than expected\n");
-               if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000))
-                       xe_gt_err(gt, "GuC PC Start failed\n");
-               /* Although GuC PC failed, do not block the usage of GPU */
-               ret = 0;
-               goto out;
+               xe_gt_warn(gt, "GuC PC excessive start time: [freq = %dMHz (req = %dMHz), perf_limit_reasons = 0x%08X]\n",
+                          xe_guc_pc_get_act_freq(pc), get_cur_freq(pc),
+                          xe_gt_throttle_get_limit_reasons(gt));
+               if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000)) {
+                       xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
+                       /* Although GuC PC failed, do not block the usage of GPU */
+                       ret = 0;
+                       goto out;
+               }

> 
> > 
> > Thanks,
> > Rodrigo.
> > 
> > > Thanks,
> > > 
> > > Vinay.
> > > 
> > > > But, instead of just giving up and moving on, let's re-attempt a wait
> > > > with a very long second timeout.
> > > > 
> > > > v2: Keep the precision comment (Jonathan)
> > > >       Use a define for the regular SLPC reset timeout.
> > > > 
> > > > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_guc_pc.c | 26 ++++++++++++++++++--------
> > > >    1 file changed, 18 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > index 02409eedb914..3b04b62937eb 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > @@ -50,6 +50,8 @@
> > > >    #define LNL_MERT_FREQ_CAP	800
> > > >    #define BMG_MERT_FREQ_CAP	2133
> > > > +#define SLPC_RESET_TIMEOUT_MS 5 /* rought 5ms, but no need for precision */
> > > > +
> > > >    /**
> > > >     * DOC: GuC Power Conservation (PC)
> > > >     *
> > > > @@ -114,9 +116,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
> > > >    	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
> > > >    static int wait_for_pc_state(struct xe_guc_pc *pc,
> > > > -			     enum slpc_global_state state)
> > > > +			     enum slpc_global_state state,
> > > > +			     int timeout_ms)
> > > >    {
> > > > -	int timeout_us = 5000; /* rought 5ms, but no need for precision */
> > > > +	int timeout_us = 1000 * timeout_ms;
> > > >    	int slept, wait = 10;
> > > >    	xe_device_assert_mem_access(pc_to_xe(pc));
> > > > @@ -165,7 +168,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
> > > >    	};
> > > >    	int ret;
> > > > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > > > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > > > +			      SLPC_RESET_TIMEOUT_MS))
> > > >    		return -EAGAIN;
> > > >    	/* Blocking here to ensure the results are ready before reading them */
> > > > @@ -188,7 +192,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
> > > >    	};
> > > >    	int ret;
> > > > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > > > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > > > +			      SLPC_RESET_TIMEOUT_MS))
> > > >    		return -EAGAIN;
> > > >    	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> > > > @@ -209,7 +214,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
> > > >    	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
> > > >    	int ret;
> > > > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > > > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > > > +			      SLPC_RESET_TIMEOUT_MS))
> > > >    		return -EAGAIN;
> > > >    	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> > > > @@ -1033,9 +1039,13 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> > > >    	if (ret)
> > > >    		goto out;
> > > > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
> > > > -		xe_gt_err(gt, "GuC PC Start failed\n");
> > > > -		ret = -EIO;
> > > > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > > > +			      SLPC_RESET_TIMEOUT_MS)) {
> > > > +		xe_gt_warn(gt, "GuC PC Start taking longer than expected\n");
> > > > +		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000))
> > > > +			xe_gt_err(gt, "GuC PC Start failed\n");
> > > > +		/* Although GuC PC failed, do not block the usage of GPU */
> > > > +		ret = 0;
> 
> Looks like we are skipping SLPC init even if we succeed in getting the right
> pc_state on the retry? We should continue with normal init in that case(need
> an else).
> 
> Thanks,
> 
> Vinay.
> 
> > > >    		goto out;
> > > >    	}
