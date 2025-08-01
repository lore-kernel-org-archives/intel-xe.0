Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10655C87FCA
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 20:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6960510E173;
	Fri,  1 Aug 2025 20:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFjVbY8C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2C510E173
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 20:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754080084; x=1785616084;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JMtBxhgsQzNYbTe4c7U/qXPLvArFgfbyJkLIiBJpe3E=;
 b=gFjVbY8C6n9xOq/3SPE/I1NFuSzk90CNuCnOPIPcEU9eauP0yUTz7AVg
 f7xGMT9jqiL9uLf7c7o2FappK9pT/+xMAXDY4W73L3rqP+apP2i0Trc/s
 1sO8FJMwhgtCKI66VIvRXQo2gNEpEo7sf1XohDvntDJgIeGA97LPaDB9C
 0/ITFAzs48+hNq6y7G0GVUsTXFtz7aP+o7mKXo6ezsHrPkNuxhBBdGOj/
 Af0hPb5AlZ3hmdcY4rJ8KdLaZPSuAyh7+6g0e5J0upxDPCSYG9LztmKi1
 PV0FAhlj1XkhJPj6ojF2mH6yFFnw+Z5EnCor88VuCc+7lO0sQKr854tuG A==;
X-CSE-ConnectionGUID: 417LgD0zTwqUwBXWazEpEw==
X-CSE-MsgGUID: D6IFWPjXTiWvxg/T3oT/Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="44029282"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="44029282"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 13:28:03 -0700
X-CSE-ConnectionGUID: moL2APDLTP6L9Clmadoh4Q==
X-CSE-MsgGUID: eeJ7lqH4RiSZ9Wh2b1eBPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="162916129"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 13:28:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 13:28:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 13:28:02 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.83) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 13:28:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dv5Cv6QGlIQRzdWKLld1udAST3S0J7cdevtYqtJTBmEDBmWF8OTGUuu8nPkDQpUkIGmsBF6+Lx8csm9vVSl5c/5QSN3KtlhGj8yCFnGrK/YWBjykEpaqNXAm32zWu6Py9YRYPXRJ+t/MdxxivgoAK/iPAlgFB0VU3Eklmm0pVt9+C+dA4S7l5RY5lpfx8An4phpvPw+rLcInwxrux+0xR9pd+BFwu7dJvfHNG5x88CEvf/bPWHxWrl6D+dQplVJEUunBInRQEeGmZK33CRwA5Uke0IktD9FBX8oz89G4uKFRmKWNXHyM3U2TMtgME1GSlMnQnYpG3ZX5H+SD505czw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9W+yn+drNrNoAvjJqF+JaY8OqdI5D0EVxeFo4JtLiI=;
 b=n3M+w5GPrPXoU0lL280AxmUZqMFxAtBfod00ufRkHfOpm264QWqOrdiyALYO6FPsIlEAEMLhvDlsBc+q1MYC3qbyrcchfPmKrJWaAhFG5wO2762dp+zN3ozMRpcBXZyOm6qh7mV0OWTaK/+9oN0Eo6IN/5Z0J8roAunRM/f0zo+Wu95k5gjVs+808N198YSiPNVLu6isS/DG3kb5eKRVCxfgrkb+OBLUfsY9uGiwUGWRZOho/pcqzFu6tPlWU6lc+D0f9+TvIhc24WSWxyRgLTOE0vQ6IUGBrhlz3bFUOgObHhCh8O8Cn11oyC/pCMweD0yhCwhTE3uiqY22pXlNcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 20:27:18 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 20:27:18 +0000
Date: Fri, 1 Aug 2025 16:27:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Purkait,
 Soham" <soham.purkait@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>, 
 "Tauro, Riana" <riana.tauro@intel.com>
Subject: Re: [PATCH] drm/xe/debugfs: Do not register residency files for
 SRIOV VF
Message-ID: <aI0jIgdc-gF9e3XM@intel.com>
References: <20250729-skip-residency-debugfs-for-vfs-v1-1-3c5edec08c8b@intel.com>
 <BL1PR11MB5445886773D62D4506352692E525A@BL1PR11MB5445.namprd11.prod.outlook.com>
 <175381587860.6473.5932932822031100952@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175381587860.6473.5932932822031100952@intel.com>
X-ClientProxiedBy: BY5PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:a03:180::16) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d7695b-700c-4440-5d6b-08ddd139cf94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lhkfM1XnxqIVjBCQ+25pdikS9NkYbmamTlQxWyPPgGbnGKvLA7ROELia5AZb?=
 =?us-ascii?Q?uH9mchmhhPXcjJcogyYiwYfZrDaK1SR9dGC8xZ2BIwP+sl0cKAQOggJelnEe?=
 =?us-ascii?Q?2DH8+j1BCAPsCI9k7MlKzv565qXkJ0aw7SqQQjBNfMwoF6V7lERVQXiGEWmp?=
 =?us-ascii?Q?iQ97aB+hu92nXR7iAx0hHLyw/bl7ACRxqHKD7Yciax8WcntdXizQXNtGIhBC?=
 =?us-ascii?Q?CeRTZj8h1wZN1fQdS3KQbIIYRRsL2AZE2WWjyt7psKzza2oMm2INOVCBGXaY?=
 =?us-ascii?Q?ygaZYaV84O4JVFUF1e7g3repq7kRb0zc5l8mFQi2GMEBM2/1TMPbGiJQyeK0?=
 =?us-ascii?Q?gPnVIsgl7g9JrOXK+HYQaKcudJMohwKOMA2dh29kMD8WqEZtuKkzdR37Jrt5?=
 =?us-ascii?Q?y8/vuAi3MQ9MGG4knMD9LGvO1K8hbz2K+W70Hy/Iq3KDDP+J6IlnMuLiZzLC?=
 =?us-ascii?Q?mqS4re/7AjroRne7e1JUQUHTiZw74V54Li/OU86UddNPFBnVGlx7zNyfJRsl?=
 =?us-ascii?Q?ax0JtHNQGhONA/F4ajsIB6zyIx+ACcKSJEHan/pFgotK82lnZbbchT/qsoWB?=
 =?us-ascii?Q?WK3nmPVOruuFJ4tNMzF9aOWoI4hilt/U5NbTGc842nQq6t6srrJ2qyeIQ2u2?=
 =?us-ascii?Q?RGM7LkNAflMfp5XMekVrLRVSnHcewDi+lENJnIijgevepPEkRS0gWI8lrqnY?=
 =?us-ascii?Q?iX+Zu56GBmlRg10xrYDq9220651w4gipXjPE9x3Bv4qSOdUAKkNk5V2A1X+u?=
 =?us-ascii?Q?HvZusg81KsTE1sbTKAX5KJKOlt9Yv5CgYnJL66dnMUJFIrQQUfcm+JtxqkH0?=
 =?us-ascii?Q?y+hYkR+rCCB2bbbJHo3Xvcc1Cd+PBYyT63z5QWhB7XRucqY5e1v5jcFBhkVr?=
 =?us-ascii?Q?cz8IcweT5/XdrNJFLLorURudOSg3hKOENmb/LeCv/XTSVv3d9npbSnP0w6Pk?=
 =?us-ascii?Q?nfmfA7aqs2XmPFMqtc9WdxX1sG7T5Xf0LKIEcBLJaoVgvFBTNf+0oAvyhz+f?=
 =?us-ascii?Q?b6KIStpOEVzfE8uh4BmZ45jL3FFs2mCJobcV+Ve8j1jwnOQP4Qh0FmyAWkIK?=
 =?us-ascii?Q?ShfbjbcZAVtG4h6agDGet+g//fVb2THXkA83jaegnkpog383UA5DEDZogWUj?=
 =?us-ascii?Q?YqWzGXp/IO6J+6ODbfHP4qb04hRtxnlTCNQnB7uF0H7JP1niTz1gWEhTyu3T?=
 =?us-ascii?Q?eSmtvVw1Sl6sn1me1XSeyL1+Y3Ly/mEfSxuqDQZxWUT1DxbFxLh+KNWBamal?=
 =?us-ascii?Q?L3FoI8oDx2zbOiMoY+QEeLLBf/4tVtgyD/zBEiH3f9pjSf/pBO6vvUaGK2hF?=
 =?us-ascii?Q?Rd25EeG9C3Km4KBqrgzOU7On5jrNkzo3LliTsKuF0k20KFcbEaN3ZdIWdF5M?=
 =?us-ascii?Q?OB8qMy4oWiRYh3esvKzl/O02ugO/KXfDgDVDVG2XYbT7+yziQXIOG0Z3c20K?=
 =?us-ascii?Q?rW2nXC8Xuqg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E6T97g5gKE5aIzT+/xkMLYpn/UHU+9qcDxLJ3N+jCWBrlN7jKTOPKixUukaW?=
 =?us-ascii?Q?dagAnLkSpRBtNlHp3X4Hj+Z+hV4T6Y0N8btvxdJWpoAoEnaHLrrKShUY3CRD?=
 =?us-ascii?Q?BlMKBM00eXPWV6DJFXIly9LygInhIMtbLNLhUUWr080e8tOcwOzIFjXYCsTa?=
 =?us-ascii?Q?xV/wNHMc5VGmekDZ4x3Xm3w4bPWgUjof/Ty8LICznTCmYYFN9BFrm95xzst7?=
 =?us-ascii?Q?eSgXrMLgq8PNgVyD445hYTcon328YgS2+qk4quESWsz8h2z0o3UKC8TbRnE2?=
 =?us-ascii?Q?T7mPPNG3TNmU3wJRXju9cjissmbOPnDLx0jrCf7mAhjOVKyE0qmEJvwuxZa/?=
 =?us-ascii?Q?/lPzxaYALsg81j7/rFmHTrxl0ZzL1ZYjwq2K12KwNT3a1UpMfD2d7KB1DI2r?=
 =?us-ascii?Q?8NlBLckFia1pC7FIP39Jtz6EHdWazqDDBka6y6ABRr0tZf3cOfO/JgalwSqh?=
 =?us-ascii?Q?fLIwRE/WXsTQIim2ZFJ4h7zIv9Nr88z6juz+mlDGY/yvKlmERmMqoZqrijNR?=
 =?us-ascii?Q?8jkhi+3yfY1c3kS8Mo+gOJHiOCpbAaNlks3ItMfB7Y5SrWnVZzULNyKA7nEr?=
 =?us-ascii?Q?xxIRshcG923V6gYZe67nrPJ+4WFCNjW5M6H3mIld/GQdzaaQtQ6GU+uDjZZS?=
 =?us-ascii?Q?NCBJX/pvednmMJ8Woj80YT0daXGXaf3JxN324IsXP844OTlY0KnX3NjmPD42?=
 =?us-ascii?Q?DBywJfRNnr0dCVqoJweB6bJHIxzY7aLOYulUpVFuCqCpXFqUCsjRUwYsGU/r?=
 =?us-ascii?Q?2rkqA2Z71I1dNmSq4mcooQnY3NrkxcDrdNDew32R3eC7xjIK0Vb4S6EXJ1Pt?=
 =?us-ascii?Q?3bRe8R2e3ZmYq7wmGhpci3JQcA1SilUOpzDgP5s8jrEwuKRhbP+JkOcleyxD?=
 =?us-ascii?Q?h5cnUX00CIl0tykOkoo72Z5MhUIjOGDwFvG+ny+0nJfiCdBbKzmsWg2ckc+D?=
 =?us-ascii?Q?IZeAwsjk+7WNIKUOHBr7m9XddGv+OWDo7acP+S/9dLbo36P5XLp6tYEv1kVP?=
 =?us-ascii?Q?LiZqvEueUClc4WC+nj9FcxZo8qmEruTYZSEeTBl9XjjGCyouemCBkb0a8Rmr?=
 =?us-ascii?Q?2mb1CDSpwkJfUnzjMVsz0dv8N4t1CoYtd4aNFsDyKiTT4OeydVstsiH//LWV?=
 =?us-ascii?Q?hLEzWoh4pjzgRDfgh9WwxUw0EBS2SAY7Nb7pj1sEN6Zf2En/fr2VS7idRAo2?=
 =?us-ascii?Q?jIDBOclVi8VZRJ+b4OtJAEQfgeztIF5BxxS38oB78NS4PppFmPpdB+2jFU6I?=
 =?us-ascii?Q?8amx+AWuPwrwDURSbSuzhAAUQMtSYJV/cSxMuAx98x2FTbqVpf6J4ov+Kt9B?=
 =?us-ascii?Q?OW8pBHhVfFto9y2gq+VyGZQbmleMc0+ra6gWXrUHRchfi0ZKM2ZIIiylsr1l?=
 =?us-ascii?Q?zT8w6SV1Tq0s99z22yjrolm64pv6cV5KmdTFvJeOQawycwBnI7VuW/OiOTQz?=
 =?us-ascii?Q?BML600d0izv9QHda0NhTZ4yO/4Nc9HMOk1x/wqXyeifhgTN0JRmJdMx2N7ku?=
 =?us-ascii?Q?819e3NGN2FONKCOHU/PeAQTqP5XSqMBtMMUvaH0TNI+aQXEUI1AjuhlgiFx7?=
 =?us-ascii?Q?ups6qGExvvPvN+l97eZH1NNuNJnTguaJuXJGxOc9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d7695b-700c-4440-5d6b-08ddd139cf94
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 20:27:18.5430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlrAKiu1d5X+sXvDK9UDuz7QEq8ZmMIfm+fh3fyzr+qc4dp/fOIlq30WXAiz4T/YfXAYgHhOE9vE8GfMR+sWfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
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

On Tue, Jul 29, 2025 at 04:04:38PM -0300, Gustavo Sousa wrote:
> Quoting Cavitt, Jonathan (2025-07-29 15:41:00-03:00)
> >-----Original Message-----
> >From: Sousa, Gustavo <gustavo.sousa@intel.com> 
> >Sent: Tuesday, July 29, 2025 9:47 AM
> >To: intel-xe@lists.freedesktop.org
> >Cc: Purkait, Soham <soham.purkait@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Poosa, Karthik <karthik.poosa@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Sousa, Gustavo <gustavo.sousa@intel.com>
> >Subject: [PATCH] drm/xe/debugfs: Do not register residency files for SRIOV VF
> >> 
> >> Registers accessed by the recently added[1] residency counters debugfs
> >> are marked as inaccessible to SRIOV VFs. That causes warnings to be
> >> raised when an attempt is made to read those files. Skip registering
> >> those files for VFs.
> >> 
> >> [1] Via commit 487579fd8524 ("drm/xe/xe_debugfs: Exposure of G-State and
> >>     pcie link state residency counters through debugfs").

This duplication is not needed. Just use the Fixes tag here before the Cc list.

> >> 
> >> Cc: Soham Purkait <soham.purkait@intel.com>
> >> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >> Cc: Karthik Poosa <karthik.poosa@intel.com>
> >> Cc: Riana Tauro <riana.tauro@intel.com>
> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Fixes: 487579fd8524 ("drm/xe/xe_debugfs: Exposure of G-State and pcie link state residency counters through debugfs")
> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> >> index 0b4a532f7c45..53b89528692a 100644
> >> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> >> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> >> @@ -360,7 +360,7 @@ void xe_debugfs_register(struct xe_device *xe)
> >>                                   ARRAY_SIZE(debugfs_list),
> >>                                   root, minor);
> >>  
> >> -        if (xe->info.platform == XE_BATTLEMAGE)
> >> +        if (!IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE)
> >>                  drm_debugfs_create_files(debugfs_residencies,
> >
> >It sounds like it's specifically these debugfs_residencies files, and not a property of
> >drm_debugfs_create_files, that has troubles on VF.

The commit message let's that clear:

"Registers accessed ... are marked as inaccessible to SRIOV VFs"

The important part of a review in a patch like this is to go and check the Spec
information. Even when it looks obvious that telemetry data should only be
accessible it is expected that the reviewer confirms the given information.

Gustavo, could you please point out where in the spec this is documented?

Is there any bug opened or any backtrace that should be in the commit message
as well?

> 
> I think we should not advertise something that we do not support, that's
> why my suggestion is to not even create the files if we do not support
> getting such information for VFs (at least not with the current
> implementation).

Yes, I agree that this is the best approach. Do not even expose the files
if functionality is not available.

Thanks,
Rodrigo.

> 
> --
> Gustavo Sousa
> 
> >
> >I don't see a reason to block this, so
> >Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >-Jonathan Cavitt
> >
> >>                                           ARRAY_SIZE(debugfs_residencies),
> >>                                           root, minor);
> >> 
> >> ---
> >> base-commit: b6a72d53a8082ee6ef701042e7cb8a93d6a2b678
> >> change-id: 20250729-skip-residency-debugfs-for-vfs-4d707779fcb1
> >> 
> >> Best regards,
> >> -- 
> >> Gustavo Sousa <gustavo.sousa@intel.com>
> >> 
> >>
