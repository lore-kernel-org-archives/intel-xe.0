Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F255E7E65A
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 19:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DF110E151;
	Tue, 26 Sep 2023 19:07:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D7710E151
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 19:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695755255; x=1727291255;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V67XlzFwEXs6V7tgrUTl5M+M+8jUYK3aWSYQwV1TgiU=;
 b=F5LPZ2xXxZI4ZvdRV/R4k1rBOByNKckVEfqssNv0MZRY/g10WbOM01UO
 4J8aW1lvds5w7hQJYrrKqqRmLyLt3dFPnAUKgNo/XeSFF9xDLQ0VSxS8H
 W/GEEITWdhnIY7JTVaCqO3XV1Lub3OrCJaXit7tNFUIhMpCwxOTpzm+vi
 km0/6M0EvoqYjEEDKFMvrf4r6WoqPB3lWiUz5s5eF9edCd0xU+7SqvCaA
 8Z+5eJJyfnYWumlyHfN4AUwONuZLYjxkPdLLlL7CTTkgazSUJigvcjuwl
 abdUx8DctcXqWcKh1ZhxpgufHHXW8zmsLEUYrUEVILFhAwGVk+TS1qJ46 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361027323"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="361027323"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 12:07:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="725530440"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="725530440"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 12:07:34 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 12:07:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 12:07:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 12:07:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WihDvadrl8FLeRZPMqLedIvz2xMKBBVySMxKcAOfXonPKE5IvKEP4WCcv630nQguEXMPOdPo4E45rR+sNXcNSHmUfzZkpF2cxNU13UDiB8vrjnU4Ho6e8ke0qyeBg+8GTdST6OG4qvFlTZb4WnvHRmPmr+UYCbqO5y7CJ+GCEaC7rnF4lDomVorYOu/tKgdtZt/LVKT1LjXXk+fXX97FmvDI+Gl9VnMWUHu0lna568PEcnesVxFL0xV00ANfBAKGzgsYlOX6Dd7ITtbYYgJ8pFiRrbr/LmGAHCLG9RWJmy8JbKFoXlqtyZ9bgwPwmFQL++EtkOzwF3jjbo05VrRe9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoIaBXQZcgI4QPtrW4aQ+Hr8V2eu/1zJEyXPmiTgdkk=;
 b=eGp+EwtreXm8OInl7M8JK2lMpnH8cyuJSshn0Sfi0ZquVlEZngWRDxoxrCev0xJQqqoN2kaYy5NNCN8spQ8dWM9kVdpDfGcF5MZWriyVRVlNtmG3UIICy26aC1COFI9SS3MU6g26+066VixW7ZEUpeP2+8nNM1ymrXfYPW0lPZv2YwjdVI+yakhKDn01EgIMseDOvxtlDAvGTifDYxjHs55rkeqKFPHQ/7bpt8mjprhAsfAiszXrqn9+398+cVRT/7vZGhIBoWL5i0ec3/J7A8qSu/ivC/eIOiRhPsnQEw5fhM2TNLHxU4v1bbCzOzp9qgjNWMiDxavt/knJy1Au2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB7738.namprd11.prod.outlook.com (2603:10b6:8:e0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Tue, 26 Sep 2023 19:07:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Tue, 26 Sep 2023
 19:07:25 +0000
Date: Tue, 26 Sep 2023 15:07:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <ZRMr6JXpSurNe90N@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
 <20230920192940.135004-4-rodrigo.vivi@intel.com>
 <ZRI1yPmabDfopQ77@unerlige-ril> <ZRMnbYcsX+GSEgA3@intel.com>
 <ZRMp8rRXkuybDH3E@unerlige-ril>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZRMp8rRXkuybDH3E@unerlige-ril>
X-ClientProxiedBy: BY5PR16CA0028.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::41) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: d38b0519-2bd1-4172-0430-08dbbec3d198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZbA8uehkxYWz7OxASRPlJmMVNXnN+QM009/7BDnb+o31vI4VOrWcmozBToETnQnP5jmgwn7xZCg+IEYQRQObfj+6JbV4gFxvTbyOkYXGQ6rEDMcoSCT4vnHqplyxBH+WvsRGA5YWwU0eL1YMaTU6+/3BdgjGZds5SR06UAqstbuLwC8Z0aOFSBjCDcqS/Nnf+IxZGb8m+3URiCUZsgH5QJ4I9Owop6hSv+ZeQRAvjEacQQttaDOsKHHjTYWRxzLRaXyveY1w3WxMkHELPv3o6EMlWRuNVo4AQr/oX7uPbmBjnEJgdhM2cr3JXWGO6QhYC7IDGrZZsrF7+tC+5FbbwxqC4X8HtTm03IX3B2lqTitg4Bem9Kcbrf7wkLHpTKX6pwvmP9xRHgdlmI7sNCOhjEVR/SSw7xF3vobWmHf25p8oHOlon6n5RKmu9/6eR44mMb4hJypMXr0qu4q+JWX3OGp22NFPY5A87UzY21uXibfR0SCfwha9u/SBO8/PpV7Vnj5bSemHXQkdxBEL7ibxzXWB/uQ3e4yErmch5jhRekWKUYyRKRLmNlJugAl/4f77/CPa6IHggIbStE5nXT6Xag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(86362001)(36756003)(6506007)(6486002)(5660300002)(26005)(6666004)(966005)(37006003)(66556008)(66946007)(6512007)(66476007)(2616005)(316002)(6862004)(44832011)(107886003)(54906003)(6636002)(478600001)(41300700001)(8676002)(8936002)(4326008)(2906002)(82960400001)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FpnVeaTmbLK9wSGFcT24TWgo3NUXEF4Sqw+6vATdpRGV2wHaIYLxKGwu3/Yv?=
 =?us-ascii?Q?NoINlL7Huay+iiyad+qMk2b+iQ7v7hy7En2fdhvlrJYBQS6tNzfqYBj99qbo?=
 =?us-ascii?Q?oPms4sMCxLZ4tCVy1c2Plwc/tosoc8Padmuk2OcO/Fb2Vu25OPcAfbLcKsTh?=
 =?us-ascii?Q?mVgUOBRyYM+aN/V9bEvUei3n5aFUXvxusdQmcwz5/ZwbDEOFGG36HQBYDa8w?=
 =?us-ascii?Q?Obpwjdoi5rLLNuY7QZT53h1SckNVtZm1bS4bM4ocC2tMBXXdnBBAp4dhLBY2?=
 =?us-ascii?Q?SEPE6v31iZMEYyExemD59MFNdLTgFlSDuR46eZbz49g1jKjRjtcpLoy3oyzw?=
 =?us-ascii?Q?JjTwCTK5Y/nQzAqM8YLbmiqfUQ13fe4DUMV5jSGi2cNj+f+cFiyVCZ+uCZco?=
 =?us-ascii?Q?e/zoT60ZPm+rKiq3KQK6kT/oKeelq4uux0GYEXFWPF2ivvdfiXx1MfKIbMri?=
 =?us-ascii?Q?nWK0hqp3FtQdb10DhgPhSjfNHOitYQSvD5o/ugg8udvRgKJhc6wV+pLt7q0o?=
 =?us-ascii?Q?GC8hG1Ep0zBwbE1XKWhJZB4ni+2XOvLtbiQdBsR10SwzMAnnFw42X2cUf9yg?=
 =?us-ascii?Q?OyfvnNHdT0OwvPUe7lkxgAj+liBpfD+acGi9TjqT5RmeLYru8zdPz0B7TTT8?=
 =?us-ascii?Q?rYuAhcs7bBkpgHnAllu2r7Ft/4CDWoXcMt04j3g36AM8itLKB1W6WA54O9t/?=
 =?us-ascii?Q?QtmzbRltEhuu2kw4AUGTyoR7dWNTgqace963RFJ1zDod/3r2OdIgUk4VWWq/?=
 =?us-ascii?Q?iVSW4CRzCp+82/1w+RstzFnL7jYwtsjjHv4Kgs89AIqsBSHZttaaecNP5Eii?=
 =?us-ascii?Q?D+f9XZR+Tz9hCYW/ERfNzoi71VbPj7wdurobHtoaqjHGMM3FyURr01xCbT4H?=
 =?us-ascii?Q?fIR2BuvYwBk1aq2q3tg4ar53LAF3rm24xOqR9IeMPc1QqfRdrFfeFsDxgCr+?=
 =?us-ascii?Q?zx8DvRAeGLZ6ErgTKUI2rJXVVQ0smqlGWE2X6S5oxxYJGo+NCI/8VGhMvtOt?=
 =?us-ascii?Q?XrZUw5ZP/sjfyKSBd7vN+mX9ggOXgXwgz4MmD7AjCFWCObnzkxra6mMeNSZg?=
 =?us-ascii?Q?n9znd9Frg3MK8lA3iqlz1VHiLVX8PK2fm58kn4ytjKduTfGh+bAZoNJzrDBW?=
 =?us-ascii?Q?E8wBLMZCjRCMPc+ftzQ7hGv3ifXvdkXl0hOCes9uQAwN2jZxvjeuYgkmjQoK?=
 =?us-ascii?Q?L8tUWYkPzooTcxYjNuiws6UohhQP+aNZHVaeD6CgpLfAm6+YBu/J0QFOH1g6?=
 =?us-ascii?Q?vTicbbheE5UP4sCP+BRF6QeSci+mvvana8yfN57rrkRS90kaJReJFSThMGWl?=
 =?us-ascii?Q?1hy2mKdHgrWVg0OEJoRdobCwY1oulzviQe8pxpm2UpYCN23ws6kDk2PwBeF2?=
 =?us-ascii?Q?ujDBURSVX4o/mQOLFmL9DLn2+Rq9HmqmROON8vZd0lk2GfIr53XPTEYLDRnd?=
 =?us-ascii?Q?FByisINiuqG8O7GceXtXaS8pBbyeaF0aGpFDIrMAAY5UT2MisRYTVS/00CW5?=
 =?us-ascii?Q?nPvqIcMuXKcSP7pwpyldpfD7BlYL4KCDlgzDKe7xE64JItPTJZ/I4B/wgdom?=
 =?us-ascii?Q?85PBn2QOKY7n2cpnV+cFGsuB2RFCifYWnQWFHqUtYF0nszlbY+z8WRlcqtVn?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d38b0519-2bd1-4172-0430-08dbbec3d198
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 19:07:24.9585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+1nO4vlOaGR0GJ/0LiGn3XVujDga9bxCRDD1PQ5UBQM50cBwWaGoDpWIWltHNtSaPJ3+rI8a21IAQ3pcClw9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7738
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

On Tue, Sep 26, 2023 at 11:58:58AM -0700, Umesh Nerlige Ramappa wrote:
> On Tue, Sep 26, 2023 at 02:48:13PM -0400, Rodrigo Vivi wrote:
> > On Mon, Sep 25, 2023 at 06:37:12PM -0700, Umesh Nerlige Ramappa wrote:
> > > On Wed, Sep 20, 2023 at 03:29:23PM -0400, Rodrigo Vivi wrote:
> > > > From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > >
> > > > Perf measurements rely on CPU and engine timestamps to correlate
> > > > events of interest across these time domains. Current mechanisms get
> > > > these timestamps separately and the calculated delta between these
> > > > timestamps lack enough accuracy.
> > > >
> > > > To improve the accuracy of these time measurements to within a few us,
> > > > add a query that returns the engine and cpu timestamps captured as
> > > > close to each other as possible.
> > > >
> > > > Prior work: https://patchwork.freedesktop.org/series/87552/
> > > >
> > > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > 
> > > Should already have an R-b from Jose based on this -
> > > https://patchwork.freedesktop.org/patch/552682/?series=122440&rev=1
> > 
> > While incorporating that and fixing IGT, I noticed the inconsistency
> > present on the v2 that was not part of v1.
> > 
> > Why we have the struct name as engine_cycles now but the query itself
> > is still cs_cycles? Which one is correct? why do we need both and
> > cannot align in a single name?
> 
> Jose had commented that XE does not have the concept of CS and asked for a
> rename to engine. In the latest revision of this series, I had replaces cs
> with engine everywhere.
> 
> We should use engine.
> 
> Latest series - https://patchwork.freedesktop.org/series/122440/

yeap, I got from there...
I still see
+#define DRM_XE_QUERY_CS_CYCLES		6
there 
;)

I can do the renaming locally if this is the right thing to do...

> 
> Thanks,
> Umesh
> > 
> > > 
> > > Thanks,
> > > Umesh
