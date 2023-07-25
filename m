Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E67EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 20:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7467A10E400;
	Tue, 25 Jul 2023 20:42:34 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDBD10E400
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 20:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690317752; x=1721853752;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SCo1Db7tUFeMmxT3zYmaOhcQwzObA1S95ZnqapCQjdw=;
 b=jOIbDwvGdsymia3lcFKFjdsM7a5hezfXJ3Fz0fL73OquCUJ6WUM/SWRU
 7GN+Hfc6vHHTwOzvtPqE8VwIkpgyWZPLb76HImDNFFfyxGxaApvCtzJfs
 khGJkSFdDmu4ErxYCc7OBojoIlAclwKZOAUFatoiA0UVH6mmsanzHDGRO
 EhVwyNDEMLltkPJEwRgBTPNTNCZGN7YpkIwL8vZSD/VojnKDbTMhGX0+D
 sfeCFFki/DSiUFVNJiqK/qBNnCFWFNLve3DPiMFVAcgQpLVQm9O0uDzrG
 phyyJtbjW0DJoyU012OHB2KvM0v3vpXoTE8Kn3konJ/RpYJRRSgzAEAwn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="365300681"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="365300681"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 13:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="761348396"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="761348396"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 25 Jul 2023 13:42:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 13:42:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 13:42:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 13:42:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 13:42:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=In9uzJuc9xMDS4M9fOZBPY8Rn6lWzOoJpdNDP75twHRwTpPJw1kzcssGKMmxwlQyetFzsK7AOL11WeIo1KTpi0voc0+XvavZ3rxMJePlF/f+EDLd4DxGobk4Yh8dK64i1qmUpqcV4W/Mv8oC6Ink3vTh45Z5kf1yO6329QtvGAjPThE7UPReJ2+FX4FqqbxEopBgNoLu8MT9OA/b0APoVujUl64DkqsZYI5Sb4Ng46ntHYwYDrrJvxvCWVFLeK/c8ULx4CwQU3zqhnzeJnZDpEsw6PuiDSai0QMMiy/ArxWfXYQAAcDIgTyRtnLJjW0V1SSYqSCws1tXXLn24gcFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVuE+bBPeaOMR7iAlrui1o2TupxrpIDP/8fzFeNsGPM=;
 b=LhGYDd7KQjCiMxG1Fl04uGwTKb7f/gQXFUSZJE41us2swx3Sfj4ZBfU6KGy3JRTTZOdr6bO0lLZp2tt0d1MPtncwcT/PS+YSa7i3HHN0sGRdNbWkB4cv0Sb7X+rxaPp6y1GYJJhhtPZOChQmLTgGTL9eTGoB3w61AC1ci3rFAdE/3LM+oVAOekbTqSvcBwR74f7DkFZYnBa22nCiO4odAx4j1+C/GhDbKihfee87WMVXZdsQi0aKXL0ECNI6YSKY2LE/ozTiDY1OV/I++ewLen7e0XRF319ZpMknkoEF5+7pkfPLyuhqNjMiNJcDs3h/8Eqqmwwyf0x5PWXJ0iMoYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5508.namprd11.prod.outlook.com (2603:10b6:610:d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 20:42:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 20:42:29 +0000
Date: Tue, 25 Jul 2023 16:42:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZMAzqxx2JVgsMhoj@intel.com>
References: <20230721202144.269837-1-rodrigo.vivi@intel.com>
 <20230721202144.269837-4-rodrigo.vivi@intel.com>
 <0a4f11d54a1349b750a87d322c89e939ed6fc4e6.camel@intel.com>
 <ZL4wEOdDSEVA5yyl@fdugast-desk.home>
 <ojes27pyo7okvuw5qw4ddfru2szt3rji52gno5nclgpgoacop2@s4m4c5fjrvpf>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ojes27pyo7okvuw5qw4ddfru2szt3rji52gno5nclgpgoacop2@s4m4c5fjrvpf>
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5508:EE_
X-MS-Office365-Filtering-Correlation-Id: b2019693-2eb5-454f-04ec-08db8d4fa971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b7q5o3mz5XzFXq5tcFylD0knxhZ/nNeHh7DDTIW2WlShIQIoFSVe3bnW2n/TwEcZ+CyMyMQbfuYKTH2ojmw/cI+o0/M73Zx7Zlaz2ppClj4KGz1MBRZLF8e6PvcS6KEgn2pSAdP47gRdMugPXxL2POSFhYEPAcE/cRZgWghBe2xWPNZaAX6DmVIiP+pk+mv/rUBNjq8NvT3D44ARAPF++7UnYwwH14OR/y1DoznFj+F8Req8E3astjdEJfm7+YdzyBt+9SdYjsnrmnwEYqwq8UuHht0omz0hocK8KduOnRl62LiqWidN50J7S3GQ7aPPVgNLuOzWO5gXLnI4FEGepBjALVFl/s0MI/d5jdF6eTHWLdVWPz2UXbLbj1Tk2OxDSLcWoiZcSTCpTS+UCm/ChwuvIQvSTki7fUtLg3g7bCbPc9VonRh13qjJYfO26uQLHqqnI7NToLe9V2MrImXv2f2q+cE7lv2Hkie6Iuu88w/gOB71CQLeCuA0DcIY6QFNkpYTSb0FDeKxVy7lfsnVBC+rGpY7AUatCPDyg+DmjtKUXITVWo++jUP354fPswyb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199021)(44832011)(6862004)(8936002)(8676002)(41300700001)(5660300002)(316002)(4326008)(6636002)(2906002)(37006003)(54906003)(66556008)(66476007)(66946007)(6486002)(6666004)(186003)(26005)(6506007)(6512007)(478600001)(86362001)(36756003)(2616005)(83380400001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vX3KBv9oc+DO5Z+M6qiVUHaGA6NwhiMp5+S9OOwrM43Sl/bGc+/NRIkc00IG?=
 =?us-ascii?Q?l5JKMFlIkE6PcPLjv7SE3IPOxEvYnkw7miCX+/njMSkYuo2iUkpObpwASDL1?=
 =?us-ascii?Q?CB6mxw33Y6vi94CpVCn+EML09rBXz+HgWWhlnODUm8L8ftEm+joN0oSNGLCW?=
 =?us-ascii?Q?YiY9RSYSFfx23TPyq2G8UhHkh/uE7OtsjBVzrrks6vrtmfAo3O8Vrm7Hi+rN?=
 =?us-ascii?Q?Aq11K95kXidaYAeS8auiMSlkHesqyVqmY5TfRa28UhC+KWgh/jQ1Lsig5unA?=
 =?us-ascii?Q?4t9dBhE/Y22qlpoG5gGFEYZcIf+g1vypTOGYiNq6jjSIkxyHSe911y9GuHpY?=
 =?us-ascii?Q?NiqzpXZQxoUEdPpA4WVTjIDK9Uusx9Jr6AfTxAw5lfXI0Cyi9oeuZEFp8eX7?=
 =?us-ascii?Q?pwzjgDFFewvxSO7lYmjevkWQZRck0V7xwPXDQLYDw/aLpENjKjLYv0dXLOgI?=
 =?us-ascii?Q?emhc8BagPAXA8eh2jWVkHef9yaNCJVhRlJjE3xtX9tRAG8cdWu7ZOyyTEG2W?=
 =?us-ascii?Q?UQvr27I62wk1GXmsHd/TxCW8pSLI1lGwBrPe4kdVamDmKJ147llKDBcfzxeY?=
 =?us-ascii?Q?FPXDnjSnHt1gAatdHvS+ylZrZSbRPAX3Rxt1c/j05+HaUWJ0W6rBcNGotF3L?=
 =?us-ascii?Q?bGJHOFBJJGX+tI399Tp3Iqlcq0p0bsuSSw9gFq+NyrtJyjMIBs+OGvoHiLso?=
 =?us-ascii?Q?KEqq1aXXWJ/ssn6y9M3JaSMYQsNvFPymf6HhaZ6B1eRSWMZ655bT/M7w+wBV?=
 =?us-ascii?Q?GbYP3xhKEJBBPZpSPyG9Pv0ilN8BS+ZBfUpYeUXorBUcz7FoXl3gRrZFOlUa?=
 =?us-ascii?Q?uwILiw/HUX37xKS+5KW1Z1/rRq/xP3guUcFuYnTgtAxmK2ZWzC4XxDv/FxcK?=
 =?us-ascii?Q?33AbJAp1rPtjYKsGp0w9moBmBj3pC/nGvylJzKoSGLBO29ZJL/3hcbS3pxHG?=
 =?us-ascii?Q?yT1fhTAmkPaOpo1mfxNluO9kaLZiQSQnH+oPHosFNKGiwtUtRuBmDMMVwbD6?=
 =?us-ascii?Q?O+kP+hEkS8tfouW1DZ2q0ieDdZQ3Y8NLDFpGOSUUEE+3ee4kQboioTgldknE?=
 =?us-ascii?Q?iPbaCGsHHg698gKGPXcJ9SV1maO64gHyb+1ZzddQ2wfKkjkQ8j1bis4POLYX?=
 =?us-ascii?Q?rJiz1heKKXG87+DRLXmI1JHKFM1mnO0FZiyOgxeGGAgRCx6kSxjIQKteHNIf?=
 =?us-ascii?Q?fWrhnwEWzeghj9sZOjaHeskkgRi2i+tj7mMhUvNb0bPhWyMd/U2lsNkiBiwy?=
 =?us-ascii?Q?yLZ/9KrWEwtjRhrEhTpeZ3NehjGvZWMBD3wPnmpcrFw6QaPcaJUqHsMzA0BC?=
 =?us-ascii?Q?+cVStzJwjSVl+hRCbMTcL+7KDXeLR7T3cWmC/jq6VX4K1C3yC7ZSpJcavnAY?=
 =?us-ascii?Q?eDXAUOYxTq7qwFqeYqhvDQxUJJMMiyLU2N+N57VPgRMXZuBKqcImQbNE10O4?=
 =?us-ascii?Q?jv2fPmPthprXFnJ/5X1U58IEVhL7jeGJRKHPv8lOJu+DMqTGoT0X4cllPy34?=
 =?us-ascii?Q?4kYnhmi416lSrjYn83NgvrhgZcQvf5KmlPyDwXE3J9GCgCnaRWYX/GOAn9Ye?=
 =?us-ascii?Q?KMHUvJln21QJD93PoJvlTBSBvYoCKUgZ586zdJ5f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2019693-2eb5-454f-04ec-08db8d4fa971
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 20:42:29.1377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWzUjrgRlmwmVlVf77UUnRxkBZ2BGzOmcbKKCjQzbZXpQqhJu/Gheqrhs3mC118l7rmcMY2pYDTzYqrBZUhMSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5508
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Kill execlist support.
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jul 24, 2023 at 09:43:24AM -0300, Lucas De Marchi wrote:
> On Mon, Jul 24, 2023 at 10:02:24AM +0200, Francois Dugast wrote:
> > On Fri, Jul 21, 2023 at 08:40:01PM +0000, Souza, Jose wrote:
> > > On Fri, 2023-07-21 at 16:19 -0400, Rodrigo Vivi wrote:
> > > > This submission backend is incomplete and unsupported.
> > > > It was left there only for some initial bring-up for comparison
> > > > and experiments. But most of Xe driver and its features rely
> > > > entirely on the GuC submission.
> > > >
> > > > If this code is not entirely broken yet, it is likely just a matter
> > > > of time.
> > > 
> > > My 2 cents here, I think it is worthy to keep it even broken to make sure Xe have a backend layered architecture and don't end up like i915 +
> > > execlist.
> > > Also for new platforms bring-up this might come handy when fixed(if the necessity comes someone will put the needed hours to make it functional
> > > again)...
> > > 
> > 
> > My 2 cents: I agree execlist has potential to be useful but only if it is fixed
> > and maintained in the long run, and (quoting the cover letter) "untested,
> > unvalidated, un-ci, unsupported" are all addressed.
> > 
> > Otherwise I think it is better to remove it and to keep it somewhere else as a
> > patch if needed in the future, because it is odd to keep code we know not to be
> > functional.
> 
> This discussion happened over and over. And it will always come back if
> we keep it like this. If/when someone steps up to add an execlist
> backend, this patch can be used as reference to be reverted.
> 
> 
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks for all the reviews and comments here.
After some offline discussions we decided to keep execlists for now,
but put extra work to make it work.

So I pushed the first 2 patches of this series and skipped this one.


> 
> Lucas De Marchi
