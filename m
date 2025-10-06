Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B0ECAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 21:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD18010E6C1;
	Mon,  6 Oct 2025 21:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtQo5/8G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47ED410E6C1
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 21:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759784469; x=1791320469;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0okrMJJ3fsh5vHklNGWNCtSKeHQTXrlSudIhwnO6dTk=;
 b=AtQo5/8GFGwTSrc8O6g1R/oz9BYdUhhqp2OjjHwDoNEds4VcdFn5rr/h
 nX8Q9esQEzdreWmbnE2+NnQqwSxSl7qnMcF19ChrL3GbJh0Xgv/P2J2ks
 qoDa41saXpFSS15NrfenANUjETXIqoWo8Epa/0SWzR8mR81Bq9jy++t6O
 9xOfqwMPXUgjYnauXqS/c8YSV1EA/tBWXGb6wSaZn71jz4HDDuUVrQvMG
 BL2lC6DWFLVhM9WwiPGcy40pd4+Hc5wXjDIDiOv7/TZ0ywWd61Tseq855
 iR1jYXhCWPBLg8SVnlPF7XqVfstSlDYv7lz5ARrL9hsFZZn7C9t4SbdaQ A==;
X-CSE-ConnectionGUID: lgxLBiOZQ1ySCgrLugUqrw==
X-CSE-MsgGUID: VQIMtjXDSde+dxTBBFXu0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65796678"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65796678"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 14:01:04 -0700
X-CSE-ConnectionGUID: 1U6JCXd3SJmTtTRXeonK7Q==
X-CSE-MsgGUID: OqoyFWQgTYO3BdMbek6xGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="210650322"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 14:01:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 14:01:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 14:01:03 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 14:01:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEN4opjN+HGVbzYzhyKNJcyY/t6Bt9CR9oaO/Q+IhgrpCsTOwq9qNG9eVguKv7Ia50BQj/a8Kw2sThuAQZRntr2dEl4+t3y/ZeqkHK0mvOO+FFdvZuCgeJvfgYl+RiV3YOwtugFrf57iQlc7mhET6ClQyLKoJHWOe3zwDgTLclFHhtnK6OqcLoQ726V+PJW8fW8aGe/N35Dg0V+Nxy8vucLOukbcqCbX8nsd75YQUK/VKNK6e6Q2RmRjgDB3EOlneyOIff8YO5Hg0V2h0o+UWTwOaRxRKh8npurM6SYv1Q1y8Np1IPLMZlCEfNI9VfypbWR2SotJYwDuFHbBvOhqOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HT+WlIsTMktiXK+HgIKXFW0iYvV3Ghv3qemc3QXPcbI=;
 b=o3gVDdW3rEhGYH2LSmKUNjgNjDWL14BkBo7K1e6xoHLojamGD/zkCJoM3e5FEdcpAfPoMEg09lMozFMj+LQ/NJKLCta8VI9quDCtfdLhg/WbEiIMgDSKxm9r5uid+IkA8z6lk9SiAjO6HAyW3RzdxzYhKJkcteJAF2Rh7qItm0Y12loRvXm6MVcTPcxYsPlZLvppqR4LvZnWr9TUDY2o3i5JnoCSo97zCJdjsgfu7OJ032ZfoqtH5lpSswy8qFNTuqChsXEE/k8T6Z6TnER53KEXMSw48k0f/llNTDcoE+mltpRm2gpr+epnQc5QuAr2UtazsAhNJCnZFPeWlKXS+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8244.namprd11.prod.outlook.com (2603:10b6:208:470::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 21:00:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 21:00:53 +0000
Date: Mon, 6 Oct 2025 14:00:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <rodrigo.vivi@intel.com>, <carlos.santa@intel.com>, <matthew.auld@intel.com>, 
 <jani.nikula@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v5 4/8] drm/xe: Handle xe_user creation and removal
Message-ID: <aOQuAzLb6fcoJq4g@lstrano-desk.jf.intel.com>
References: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
 <20251006142034.674435-5-aakash.deep.sarkar@intel.com>
 <aOQrXGKw30BJiL+8@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOQrXGKw30BJiL+8@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f7a5af-79c7-45b8-8521-08de051b7029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Zd4NZmsKjv04J0qzURwuIXjAvU1hzkgQPhRMZhbDQTJ+/sf2SdpRZgCjO4?=
 =?iso-8859-1?Q?tErlgMmP1VOr3dmysV0TLsQl58jKYqKSuhJkM45Uw5dG9aKNgMTY1Rn0YK?=
 =?iso-8859-1?Q?ZfGpF8OwNDLntUp8UOBe0ZT3ymCYaNBp/x5N/QLZYwkuYbTe9LRfFcpMzv?=
 =?iso-8859-1?Q?hcPgyMTs5btIgDblRwSAWqhZYu5RqFfdu/IDK7RHaNcXGFua3t4apO4rmg?=
 =?iso-8859-1?Q?SRtNjTZwZyLilJUqgiNDaxTFefD5p4/7s8SclpV1ucYi+MhJI50asxFQ5J?=
 =?iso-8859-1?Q?VNJ6+cvRtPeYZ8buGN8DnetX1IKbem86grhRyXXmr7yaHQ4ju2fAWaVOPd?=
 =?iso-8859-1?Q?i9RfrXhXrMyXvFPb75kcTe1o73CcgU/KoofSYHO6jibO+c0Dj4qxD6AmSE?=
 =?iso-8859-1?Q?12VBhhIZhz1cttYSJN+I+fSXdP/ccwvgiCScq05SYaHrMFGo65STWVhX14?=
 =?iso-8859-1?Q?tUhhXwZtpG0m++Aa6ccFqLLFCRyudO+pZAy21eFVHEql8f/hwDuoF8c35u?=
 =?iso-8859-1?Q?5si+XZNH9kPdcTGUIOkVVIcwutbcTPmrsETk6WLpW6c6fBGcY3/0GEegjU?=
 =?iso-8859-1?Q?3BY1sPkeg1vctp3I3ZEZjCKrfguQCszFIC45PC8Vs5FXO9Q7K110peexF8?=
 =?iso-8859-1?Q?k5Q62tffXUPkPQn0QNif3OIhzU2RJ+8011nekqTp9WkgwGplYuo6zyVPOb?=
 =?iso-8859-1?Q?B18T7Q+hb1zDj0yqRZCI06e4HSplCRpaEu5oTB8BJgP6O1WndpIZfk5YOF?=
 =?iso-8859-1?Q?AJV/PbZQ8XhRyqAN78NVg0wCqW5eXhKRg0fn2F4mlDBM1qbbv/yG78k8Jy?=
 =?iso-8859-1?Q?rR8swq0FTEnOIKA1Wd1GEHj+7e09ZGKMvOVJeyonVi7cGGdgsB/nsbVCEm?=
 =?iso-8859-1?Q?9Xp9cjc5BBwjIDDBXBuv5jybKcJKI23j/uKS2oL9pHZ2dYThdn4jGf7ltj?=
 =?iso-8859-1?Q?zhsdTMrhDwIlQIlWBs2TMbyGmQX/ZDYXnHOZXUXTXLsY5yzBNOT5DQRgoV?=
 =?iso-8859-1?Q?kabg+734NRZwJrpKyt+MWYnURmj3qhpggLfQ4piNiOtVd01i9Pk5JTshxc?=
 =?iso-8859-1?Q?53Cv0FbQTH/YMHz5O/dvi6Im6uOFOJcmnNNgWU4OuWhCJp7pFbY2/cX90B?=
 =?iso-8859-1?Q?GmYY+C6Xj8welFD8xDJqucmu5B6HKBC9R8J3C+nwYrMeNODyL/MLgDM/AD?=
 =?iso-8859-1?Q?b3/SFDXYlUccMOoqDzllKcPCWdruz5WdYBrHzhu1CLuXIGmFC6ZtAVAwVU?=
 =?iso-8859-1?Q?V8JjVFevxV81DHbZ2pi0vf+HlPwGyrLMJR/7KOi79AoCeRlpW5kdzjGVl0?=
 =?iso-8859-1?Q?sDkJP9r6M7XHmISiumBKHFOrUp/P83mi1yvmVwCWfoLoqjaa7B95NCT04f?=
 =?iso-8859-1?Q?1NZ/jWosu6I6uf50nna8IpLg3jf/2hYyaD5TkSJ2AERyh+vljFyRfLqOq7?=
 =?iso-8859-1?Q?6YdhlpPb4MTkOkp4KzvrhOzR52oxrU4HItwAzAMixfiFuDbwk7xyX0GydG?=
 =?iso-8859-1?Q?tuXDYEbyxzBCz4Xb83QpAD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8+9oZLQuktsvuChEe/Lmno+rodcWa3PU5rmmkGKK7UHq/A/w1EoitTDjo8?=
 =?iso-8859-1?Q?iL+fSlwres1QMzb48CX6m0G7fSeNUvfIK8m+mwxvDV6Bph88cwHTLNDno/?=
 =?iso-8859-1?Q?C1hW50haslamSLb0bLB3WeKJZJ0maXShJ+V/HSO4NjfcKlBn+87uyenVcZ?=
 =?iso-8859-1?Q?QLVLYw4sGRoaDd/73vO12AH3l0FFXFFDrth2A5I7fyKv/CUy86toxDSJWX?=
 =?iso-8859-1?Q?mWpNlY9K0Vf/RSw+8m3kz5BJ8XTj+BHWclD7pH2z61zEAEGv4pDxZ0luaK?=
 =?iso-8859-1?Q?EmBU9zviyyaP0NdFzAB02Aqlwdz+LZ3ua7wkqoUpSPZ4ehJEr5VpcCkL4B?=
 =?iso-8859-1?Q?8FNvDGYjK0U6w6DQKO/IAHiq87VQebx81RNGZA6dLqg1gCDURETf71AGHw?=
 =?iso-8859-1?Q?pODs4/QhhEK1hQTWH2zAFkwiRoKOuptXm9w+WfLw4n3Dg0a9TE7YyXswoZ?=
 =?iso-8859-1?Q?Ew4NR+ub4tgahhJlhRylge+Gp6dHAlXnhAFGiA3J1zUbsTmEL0p+upmkuw?=
 =?iso-8859-1?Q?vllg+PIje4dvbkRo+VS9M8SJOaWNK4XkEi5CzoLZM46ILn7vmzEG1pSRcL?=
 =?iso-8859-1?Q?MxZbB/TlRIZjseN2WCyEu1oZMy0AjZMllwVFWjo5/uFVecSK+OCC9WHck9?=
 =?iso-8859-1?Q?Kpu95TsdssU/BafyxRbRHl42hQ7TC+0Y7I6c1JbisJBBUOjB+u1C1iKjVI?=
 =?iso-8859-1?Q?nbuWgKcnSVQ9lKu5SKfcYdraXQjeO7XfNswuw0NIqXMphSYjf5qxNT1KRJ?=
 =?iso-8859-1?Q?vtnoq7XC9Dw2xPDFuBAr24k5eUaiSuAy5FTFWVQIBMULyURyFZ4QMnlPYk?=
 =?iso-8859-1?Q?L9ZcRkxEhjSrSdkQTywrY/HWD90NYj/CnyB6086S4humi84g/O7kEJ9/ZY?=
 =?iso-8859-1?Q?KRpcERRacd/wOV2AfvnuX+5gCcZk26SdR/SQ+fP3tec1MwWUxldVR9M1Yj?=
 =?iso-8859-1?Q?RD3LySwR5QDyBXpTf2WOfhT2csjFKBK7HgKmI8GIk9pXvtYC65IaRYmwhg?=
 =?iso-8859-1?Q?QGvCR5KjTlYqIUocovmTCf1E4nG1av93M054Y5NaQLjAK0X+iKz8gm1CFr?=
 =?iso-8859-1?Q?SVN+JMCvOBty6Lr/KAofCOxesCI3gHk7fztu7mhuOa4qy+0JQj8oc0p91E?=
 =?iso-8859-1?Q?U+lGtnVOPbHcAp4TsoMLygk5WpI4LDLfrPgjOXNzUGh6DKZSc+i7r06JV9?=
 =?iso-8859-1?Q?kL/umJPF0LTA2Z51VnKan1S7OqG2X/9l7aHc1fCJ6S1Wk9T7fGm9mCXgr1?=
 =?iso-8859-1?Q?3eDk0DVq5slL9GnX0B03nt6qCT5fMFyi2+jHuFdXiEVuuHc9vbKvkNFeMf?=
 =?iso-8859-1?Q?WPwOgLFuuQYoRn6GaAVAvk2B2L3olCD+CWd8euo/woznYLU9VLbblhYgE3?=
 =?iso-8859-1?Q?/lYpxMLFwnrBnyF13yLptmaubc9SvBJxepfOtstWL6O+Hj4noW0vXUpK14?=
 =?iso-8859-1?Q?3/dQ010EmkkSm2nnKbZ0lEx/1/yJx1vGvB23xDDXw9BogF37wucHav+hcs?=
 =?iso-8859-1?Q?yIk4gDQXupyxecng7U4aBfGQHtCWqMiw9rB7Kyy3RP7JRBgGGR/UbpljvN?=
 =?iso-8859-1?Q?wzU+qpyc+W2GP7FrnYlVPBQSh11r7k/ipC2l9S4Yj0j0a5j8FwlidKaYqH?=
 =?iso-8859-1?Q?P3hiGAAbJTy6EXCWFtxFY5HeMx8x521FEoSHMyzucwA0rHnQnJvGUTAA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f7a5af-79c7-45b8-8521-08de051b7029
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 21:00:53.8797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iC+WK7PAP+LMSS+F/aNtv4CVJc6tzeMS2IGutSA6oaQOd9rsH713n2rSLu1t0DojMFd305kLqaAD8PHk88xWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8244
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

On Mon, Oct 06, 2025 at 01:49:32PM -0700, Matthew Brost wrote:
> On Mon, Oct 06, 2025 at 02:20:25PM +0000, Aakash Deep Sarkar wrote:
> > We want our xe user structure to be created when a new
> > user id opens the xe device node and to be destroyed
> > when the final xe file with this uid is closed. In other
> > words the xe_user structure for a uid should remain in
> > scope as long as any process with this uid has an open
> > xe file descriptor.
> > 
> > To implement this we maintain an xarray of xe user
> > structures inside our xe device instance. Whenever a new
> > xe file is created via an open call, we check if the
> > calling process' uid is already present in our xarray.
> > If so, we increment the refcount for the associated
> > xe user and add this xe file to the list of xe files
> > belonging to this xe user. Otherwise, we allocate a
> > new xe user structure for this uid and initialize its
> > file list with this xe file.
> > 
> > Whenever an xe file is destroyed, we decrement the
> > refcount of the associated xe user. When the last
> > xe file in the xe user's file list is destroyed,
> > the xe user refcount should drop to zero and the
> > xe user should be cleaned up. During the cleanup path
> > we remove the xarray entry for this xe user in our
> > xe device and free up its memory.
> > 
> > Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c       | 21 ++++++++
> >  drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++
> >  drivers/gpu/drm/xe/xe_user.c         | 77 +++++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_user.h         | 11 +++-
> >  4 files changed, 123 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 386940323630..5a084fd39876 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -65,6 +65,7 @@
> >  #include "xe_tile.h"
> >  #include "xe_ttm_stolen_mgr.h"
> >  #include "xe_ttm_sys_mgr.h"
> > +#include "xe_user.h"
> >  #include "xe_vm.h"
> >  #include "xe_vm_madvise.h"
> >  #include "xe_vram.h"
> > @@ -82,7 +83,9 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> >  	struct xe_drm_client *client;
> >  	struct xe_file *xef;
> >  	int ret = -ENOMEM;
> > +	int uid = -EINVAL;
> >  	struct task_struct *task = NULL;
> > +	const struct cred *cred = NULL;
> >  
> >  	xef = kzalloc(sizeof(*xef), GFP_KERNEL);
> >  	if (!xef)
> > @@ -107,8 +110,16 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> >  	file->driver_priv = xef;
> >  	kref_init(&xef->refcount);
> >  
> > +	INIT_LIST_HEAD(&xef->user_link);
> > +
> >  	task = get_pid_task(rcu_access_pointer(file->pid), PIDTYPE_PID);
> >  	if (task) {
> > +		cred = get_task_cred(task);
> > +		if (cred) {
> > +			uid = (unsigned int) cred->euid.val;
> > +			xe_user_init(xe, xef, uid);
> > +			put_cred(cred);
> > +		}
> >  		xef->process_name = kstrdup(task->comm, GFP_KERNEL);
> >  		xef->pid = task->pid;
> >  		put_task_struct(task);
> > @@ -128,6 +139,12 @@ static void xe_file_destroy(struct kref *ref)
> >  
> >  	xe_drm_client_put(xef->client);
> >  	kfree(xef->process_name);
> > +
> > +	mutex_lock(&xef->user->filelist_lock);
> > +	list_del(&xef->user_link);
> > +	mutex_unlock(&xef->user->filelist_lock);
> > +
> > +	xe_user_put(xef->user);
> >  	kfree(xef);
> >  }
> >  
> > @@ -467,6 +484,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> >  
> >  	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
> >  
> > +	xa_init_flags(&xe->work_period.users, XA_FLAGS_ALLOC1);
> > +
> > +	mutex_init(&xe->work_period.lock);
> > +
> >  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> >  		/* Trigger a large asid and an early asid wrap. */
> >  		u32 asid;
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 54a612787289..4d4e9a63b3fd 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -613,6 +613,16 @@ struct xe_device {
> >  	atomic_t g2g_test_count;
> >  #endif
> >  
> > +	/**
> > +	 * @xe_work_period: Support for GPU work period tracepoint
> > +	 */
> > +	struct xe_work_period {
> > +		/** @users: list of users that have opened this xe device */
> > +		struct xarray users;
> > +		/** @lock: lock protecting this structure */
> > +		struct mutex lock;
> > +	} work_period;
> > +
> >  	/* private: */
> >  
> >  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > @@ -684,6 +694,12 @@ struct xe_file {
> >  	/** @active_duration_ns: total run time in ns for this xe file */
> >  	u64 active_duration_ns;
> >  
> > +	/** @user: pointer to struct xe_user associated with this xe file */
> > +	struct xe_user *user;
> > +
> > +	/** @user_link: link into xe_user::filelist */
> > +	struct list_head user_link;
> > +
> >  	/** @client: drm client */
> >  	struct xe_drm_client *client;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
> > index f35e18776300..cb3de75aa497 100644
> > --- a/drivers/gpu/drm/xe/xe_user.c
> > +++ b/drivers/gpu/drm/xe/xe_user.c
> > @@ -3,6 +3,8 @@
> >   * Copyright © 2025 Intel Corporation
> >   */
> >  
> > +#include <drm/drm_drv.h>
> > +
> >  #include "xe_user.h"
> >  
> >  
> > @@ -60,7 +62,7 @@
> >   *
> >   * Return: pointer to user struct or NULL if can't allocate
> >   */
> > -struct xe_user *xe_user_alloc(void)
> > +static struct xe_user *xe_user_alloc(void)
> >  {
> >  	struct xe_user *user;
> >  
> > @@ -71,6 +73,7 @@ struct xe_user *xe_user_alloc(void)
> >  	kref_init(&user->refcount);
> >  	mutex_init(&user->filelist_lock);
> >  	INIT_LIST_HEAD(&user->filelist);
> > +	INIT_WORK(&user->work, work_period_worker);
> >  	return user;
> >  }
> >  
> > @@ -84,6 +87,78 @@ void __xe_user_free(struct kref *kref)
> >  {
> >  	struct xe_user *user =
> >  		container_of(kref, struct xe_user, refcount);
> > +	struct xe_device *xe = user->xe;
> > +	void *lookup;
> > +
> > +	mutex_lock(&xe->work_period.lock);
> 
> You don't need to take work_period.lock look here. Xa have there own
> locking. work_period.lock should protect the reference upon lookup,
> that's it.
> 

Actually I mis-spoke here. You do need this part with how you have it
coded but something looks very odd with the work_period.lock / xarray /
ref counting / waiting on workers under work_period.lock scheme.

Let me think on this part for a bit.

Matt

> > +	lookup = xa_erase(&xe->work_period.users, user->id);
> > +	xe_assert(xe, lookup == user);
> > +	mutex_unlock(&xe->work_period.lock);
> >  
> > +	drm_dev_put(&user->xe->drm);
> >  	kfree(user);
> >  }
> > +
> > +static struct xe_user *xe_user_lookup(struct xe_device *xe, u32 uid)
> > +{
> > +	struct xe_user *user = NULL;
> > +	unsigned long i;
> > +
> > +	mutex_lock(&xe->work_period.lock);
> 
> guard(mutex)(&xe->work_period.lock) will work better here.
> 
> > +	xa_for_each(&xe->work_period.users, i, user) {
> > +		if (user->uid == uid) {
> > +			xe_user_get(user);
> > +			mutex_unlock(&xe->work_period.lock);
> > +			return user;
> > +		}
> > +	}
> > +	mutex_unlock(&xe->work_period.lock);
> > +
> > +	return NULL;
> > +}
> > +
> > +int xe_user_init(struct xe_device *xe, struct xe_file *xef, unsigned int uid)
> > +{
> > +	struct xe_user *user = NULL;
> > +	int ret;
> > +	u32 idx;
> > +	/*
> > +	 * Check if the calling process/uid has already been registered
> > +	 * with the xe device during a previous open call. If so then
> > +	 * take a reference to this xe user and add this xe file to the
> > +	 * filelist belonging to this xe user
> > +	 */
> > +	user = xe_user_lookup(xe, uid);
> > +	if (!user) {
> > +		/*
> > +		 * We couldn't find an existing xe user for the calling process.
> > +		 * Allocate a new struct xe_user and register it with this xe
> > +		 * device
> > +		 */
> > +		user = xe_user_alloc();
> > +		if (!user)
> > +			return -ENOMEM;
> > +
> > +
> > +		user->uid = uid;
> > +		user->last_timestamp_ns = ktime_get_raw_ns();
> > +		user->xe = xe;
> > +
> > +		mutex_lock(&xe->work_period.lock);
> > +		ret = xa_alloc(&xe->work_period.users, &idx, user, xa_limit_32b, GFP_KERNEL);
> 
> You don't lock here either.
> 
> Matt
> 
> > +		mutex_unlock(&xe->work_period.lock);
> > +
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		user->id = idx;
> > +		drm_dev_get(&xe->drm);
> > +	}
> > +
> > +	mutex_lock(&user->filelist_lock);
> > +	list_add(&xef->user_link, &user->filelist);
> > +	mutex_unlock(&user->filelist_lock);
> > +	xef->user = user;
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
> > index 9628cc628a37..341200c55509 100644
> > --- a/drivers/gpu/drm/xe/xe_user.h
> > +++ b/drivers/gpu/drm/xe/xe_user.h
> > @@ -6,6 +6,9 @@
> >  #ifndef _XE_USER_H_
> >  #define _XE_USER_H_
> >  
> > +#include "xe_device.h"
> > +
> > +
> >  /**
> >   * struct xe_user - xe user structure
> >   *
> > @@ -40,6 +43,11 @@ struct xe_user {
> >  	 */
> >  	struct work_struct work;
> >  
> > +	/**
> > +	 * @id: index of this user into the xe device::users xarray
> > +	 */
> > +	u32 id;
> > +
> >  	/**
> >  	 * @uid: UID of this xe_user
> >  	 */
> > @@ -58,7 +66,8 @@ struct xe_user {
> >  	u64 last_timestamp_ns;
> >  };
> >  
> > -struct xe_user *xe_user_alloc(void);
> > +int xe_user_init(struct xe_device *xe, struct xe_file *xef, unsigned int uid);
> > +
> >  
> >  static inline struct xe_user *
> >  xe_user_get(struct xe_user *user)
> > -- 
> > 2.49.0
> > 
