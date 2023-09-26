Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29632E7E657
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 18:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC0010E151;
	Tue, 26 Sep 2023 18:49:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636C510E151
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 18:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695754140; x=1727290140;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gOtNDqYoWrF8WNL0gSQqmSdByVUZva+z865A51YHvmI=;
 b=JMlIcw3cr26CKGV0E/vepTyNeiG6sabDGn3nGeM5eRBZkeJILEdA2aSG
 D4AGq9srYo22Dg80Csfh1y62eRmGSU0adz0ftun3HEqr3X90rPQ2QzdlP
 LWh5cPbLTEdMVXGEI82EXCj2+52glxj9Eiv29fzkVhyDfXLnyKngeAXXK
 b04ZEqROctihHAWHjHK0etCc73X399TReSVRDbn56J9RQ8BB6H/Y9MHIH
 HlCBHirq5VgTYONB5RGeAmD+2g4BjALQn01qbQU70ik58H/08bFOH78LW
 ySVhh3sIL092BYcqvGuJm/OuHdGf+gQYdyn8Rv/fjIPA05fCZHb8a7Iav A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="384421159"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="384421159"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 11:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="872601907"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="872601907"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 11:48:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 11:48:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 11:48:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 11:48:20 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 11:48:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVxVoqkum1dLLA5/tk+YYCcoaBRrWLZlNJ3QPhVDzYDXbmjwh5kwd1W4GIJuNDpnyo3YL7OHqQdvgMAiJxBfOsQR/UpkzOZHEZBvUQhYFomrq7YmYdKF7iE64Pld0lMXLXlT0QQOEev4XYfwLd1QPbYxSF8unu6O4TNmD1ZLHUzcPpkdMwVl8Gy+PYTTzN1bizZnIy+0RcdhPBza1vjuboN1bh3uHu8Y4ADfBGFe2qSlScFg5I37Zw04sU46IseE6cvwHxMdpJGYtzKgW0OA+9PZX7g08cevkcuUzKyrjdh5kiOMtYMft5OlbCmnilVWUUUuquNnbIDBocrTS9OtiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwS7hvHwItWOR/lAE/QKAd2vy8nIGKWFJGCMQxOcigg=;
 b=VlJGE/q/PPnYSCh6lGFi1t1QvXFB/Ok78VHb3+fOEiFzbV1d0o8Wy0+g9bwnyr6oFbUxBiZSEhuVLO65cDS2M1uTwsV99RXikIYVZ+SbYWNOjKH5PHnDgu/dSwt0HGxvwQp/NGz4HUbHzgGv8OS2gQEhn3ZbqPvG3LcT3axXjxO5UtCFCvKgc9QtQHe+44AaWDOWfutf8VPHRPqbpVTnK5+1NYFjaWqLC32G8WsfbHY66gd4Ky8Pq53wM/fGOK7UiqXz8bV3d8xTyrf9e90IEAww6cMcDb7WkbHWwnhtj3x4YJvltzV7hSqY5e6KQG6AHnjMwSvOYqYUSlkkU0IL5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5761.namprd11.prod.outlook.com (2603:10b6:303:195::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.31; Tue, 26 Sep
 2023 18:48:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Tue, 26 Sep 2023
 18:48:17 +0000
Date: Tue, 26 Sep 2023 14:48:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>
Message-ID: <ZRMnbYcsX+GSEgA3@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
 <20230920192940.135004-4-rodrigo.vivi@intel.com>
 <ZRI1yPmabDfopQ77@unerlige-ril>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZRI1yPmabDfopQ77@unerlige-ril>
X-ClientProxiedBy: BY3PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b97baec-8a3a-4c3b-14eb-08dbbec125b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MVNJUEtgNzC/kBRmYitLeaXq+eMUTF7AOrZQ2qr36APYq2YbDMtbGPdl34Zstho71IUpWjn398s4D56eVGIYhE1gLyJr4ORI6PfNAR9et/7W0H/txki4w3E6x5QXk7mh2WQPLI+43Xw3XcHe7OpItmueH2ATp+b6ceXyI1Fm/HhrWqR2cdKt7+fvv9WG6O4IAMbwyodJCdNj6vAtv8G0W4gBO3Ja6UZWkCZ9LmG9H7j5SBxb10Y5zESJnWAM3pBOQpxl/oU4Z75zw2gw9OzudUsctR+bgHiQuH8NjjdX9kQ7CQrLkeb4o39KJE5A+sjzpcjngcSz7tcEUK2VxTkditxZYwSgQ1BQVk+YE01+DPv2E0DtUVaC9A5PMhZbATJ+CSI+O82jSQMIaO0ZLW6VnO9GEvmHlujULYMWvW3VURfOB+EyUSJVtksSiakYLtIRAMiriKuDlDJrup6tXsxM6UZbKZXH4tcyen6i1iSRS9boztD74pHo/q+8QQD1AyYmQoequy7HW0i8Qi69/qfx09spaMCDphbCKG2Lf7OzOYsT6RhVLEvBxUCn7MpOfqgQQdXjDiSil6iXz8VttWWUHweFHlnq64AwxJxOcT+VBONb7t1Lju6pcy+aABeiYPfJy7Hy2iJM3o8paf7EFZ9uX6ZO6S9+nmQjKkod7iADfWs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(366004)(136003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(2906002)(83380400001)(6666004)(82960400001)(8936002)(4326008)(8676002)(5660300002)(44832011)(86362001)(316002)(38100700002)(110136005)(66476007)(6636002)(66946007)(6512007)(478600001)(36756003)(26005)(6486002)(966005)(6506007)(107886003)(66556008)(2616005)(41300700001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1abqTfukO+mePdvLZ7V9xPNHHeW4f5Pz16ubjVGMaKlHKhqrRx6ZKT0T0DbD?=
 =?us-ascii?Q?WFYGkBP1oGlW1hrF3K7ywp9VDtiUf3jo31FyWyFsGTGGVycl+gmAk3HnGPQ7?=
 =?us-ascii?Q?THEJiiTBUNsqF+PF4K0Lwo3GBMoSogiSXVMxJ+2CBF9OJqk4UcuSZEsYRqiA?=
 =?us-ascii?Q?C+liCAu3B32tE7E0IIEMNDkDu/KuNy+zoRK9NC5g0BBFmQFN3Dh48BdWkaA3?=
 =?us-ascii?Q?IUW6TA+s8522U6v1cMirF/tGYKz2mJnP6JGk5yoA9Od430lHUP6RbTYxrDjs?=
 =?us-ascii?Q?bdjYEOAssE0CxpahYcpUPCCQcNFTnKhfd4AUcsODGw+hqiOiFJ52tA1+y+Ud?=
 =?us-ascii?Q?Y40K+evgm/cwFsgL0vTCYZVJVgXXxXsben0gHOPr6kMPOLMj6y2xdYqrUVuy?=
 =?us-ascii?Q?1/s5xVYqWGf1bMk5CWGm4N7gtJpVLsEViItiZPaJeAq35W/g7mX7Uw3CjS8x?=
 =?us-ascii?Q?ZZmhgZx0Rqlb2Ht/s6ljpdkw5/iHmRxx9gNEAnICHzom1dSKJoeLM29Lwusd?=
 =?us-ascii?Q?8GCFJSAxxe+9QLk+sOslZyUUd6mTbzALDF0kQBYY9tk+IpqlrXn/o2bL9vtp?=
 =?us-ascii?Q?ztTTb7eKKVtXZ6CZoaPvpUTF39gm9jbOPYRCWYuiu/VfEOXCf8hgOwslIIws?=
 =?us-ascii?Q?VhP1mSeTTCjHaIq3NMX+KE6N+qihnxUml0SYufavqYMfRJfFVrypbQHezKiU?=
 =?us-ascii?Q?IuvrRJwvYRvtYzNtO+8m7xG2x28ETadWbN3d0p/YwbRXZRLhXWbPKYTl6Alj?=
 =?us-ascii?Q?mF+20CmEa3kG+agZdwQ4bk94cu9zyYsmS/QEwTlQyS2oKjcXDLzt+N3ENkZu?=
 =?us-ascii?Q?3y4pX3+tcLINehqTtuVv3LFiDor+X2wisvIa/RDsGJMsgSlQ5sQ5Yq2PxDSN?=
 =?us-ascii?Q?pV32sw0HA1sPegc3TEPm+k7R91XEjrTS2QffEI6T8Dq/lsf/4FJKJW16j+py?=
 =?us-ascii?Q?calUNJdRQbD1zEbyT3lGJXRRF46g+yUDra1Rr9qBBQFV3mk07Bq2XrvCHSLV?=
 =?us-ascii?Q?+Gvw0g7ReQGLk3W3iIE8yWVOfQYqyBWFm/7AaW0bY9N2NbEUNJhGsdkLkWzW?=
 =?us-ascii?Q?wUCcXBImBoDXGmAV1NVhM9J8S534bNR551cZYar2yTV9NuJbOQkuy4+MC2IR?=
 =?us-ascii?Q?8wo7vW7ZYGnHRJX7a4enSY4IXuftBOvZoXiEBaafz+wmNH+jirRybVH72TXb?=
 =?us-ascii?Q?szruxDvpXoNca46ITkrPw8HNm4NbuxyoRA2HtlxxJI+qr/NoCG8svqO8j9o7?=
 =?us-ascii?Q?r298zylvSxQKnikhhH7gsPXqR+vIQ6tAUHifNwk9jorI6vLQcruUl6C/XAxS?=
 =?us-ascii?Q?Bi/+Q0aplEQUhnMAnYfitQ7Ztx4OcnO4SpYgKcRxNGFnYE+gN822bQxh7XJT?=
 =?us-ascii?Q?52sUAXMK0CXcDJj/PT8DLGq01x3AKgxy1/BlEt6FyKNLLFJ9eBpCnCRP1HE7?=
 =?us-ascii?Q?L7P6QK1aSk4Msgkn0XzEyxuJqrBkIyG5anEnbnnX+rJZUUkccg52RBRUrZYG?=
 =?us-ascii?Q?TkjFBXb37VxKFIjoN08m2AHGVqfnNmKQouqG/SY7fjbF8vRUMugtk3Vf0ciF?=
 =?us-ascii?Q?9ntfp/aAIFja0I5/A25fISa+OiHCC36baV1NQrplCMVqD7oDBCIOQUHkLBGM?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b97baec-8a3a-4c3b-14eb-08dbbec125b9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 18:48:17.7319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKEPpAnXfkV0VnkgipF03I3Kv8UjaHavH7PwSc462wsOd9XOSYjqVGzneqWCSaSWMEx3s94kEvyFQzYyyZ8bFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5761
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/20] drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 06:37:12PM -0700, Umesh Nerlige Ramappa wrote:
> On Wed, Sep 20, 2023 at 03:29:23PM -0400, Rodrigo Vivi wrote:
> > From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > 
> > Perf measurements rely on CPU and engine timestamps to correlate
> > events of interest across these time domains. Current mechanisms get
> > these timestamps separately and the calculated delta between these
> > timestamps lack enough accuracy.
> > 
> > To improve the accuracy of these time measurements to within a few us,
> > add a query that returns the engine and cpu timestamps captured as
> > close to each other as possible.
> > 
> > Prior work: https://patchwork.freedesktop.org/series/87552/
> > 
> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> 
> Should already have an R-b from Jose based on this -
> https://patchwork.freedesktop.org/patch/552682/?series=122440&rev=1

While incorporating that and fixing IGT, I noticed the inconsistency
present on the v2 that was not part of v1.

Why we have the struct name as engine_cycles now but the query itself
is still cs_cycles? Which one is correct? why do we need both and
cannot align in a single name?

> 
> Thanks,
> Umesh
