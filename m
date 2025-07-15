Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0F6C83F22
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 15:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6C410E602;
	Tue, 15 Jul 2025 15:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hqjl+SPn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD0010E602
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 15:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752594835; x=1784130835;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Vo5uEaFzPOJTcSS/Rj1ciuWi7WWpa5WbG0UKUKX5BoQ=;
 b=Hqjl+SPn4krkdTN4tdhZDn0rIoh9T+H3pwKew6YNcYrwRCZNYs3Y99bU
 GnWZjks/61D1X1YZ+kWW49iwEMB5zTp9KuyM56L/p88iztEOGP7sHYgur
 JzbuT7XTVwltwM2mu9mV1EoTX0eNQeAqwrO1D2K/dqOB962sLIs4Z7xpv
 c/BxmWYQisC9NNwF8lJl41K9VqzAyVutxDzXL8o2ZpZKou8E+UIixx5fE
 KHvK2qi2n5ap9/vLlEY81kUajbS6K7eIYQ6WO5HIi8YWy6tEOweK+nLLz
 WGWh8JB3aBG6KMYb5AXdQ8iRibk1Cj61lak1mkTpKlWS2JKsvxMBKdOCn w==;
X-CSE-ConnectionGUID: BWlTe7T7SeWV2hmW8VXjcg==
X-CSE-MsgGUID: HXkF8icSQ7CTCwqiienK3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="57430757"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="57430757"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:53:55 -0700
X-CSE-ConnectionGUID: GAWYVnPeS2+FE25b0xUrKw==
X-CSE-MsgGUID: 5DWk3DQkQy+khFTHcJj6xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157984696"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:53:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 08:53:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 08:53:54 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 08:53:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6VN9GllcrF9A5YQssn5HG/hOYEl2LA6+mZLX4mToNYJGaS1QmD/FVP+IDpcutzRn+vm1yb+eI7M6IEbhWALhHDwX5XAlT9mxCZjZudxphnhM1BUYLWyrIKkTicDmkDpkOLhB4yfun0pMRdDAOoy4tf/ieMIaeYZQXPFFyh+WihMSUGC6lw1iL/QI3LRfkvc4SB7VXQNZtdk94npQ260SWA3XjLxcJjc0uVHTDCoWJxG/x7qJl0OuGEI3yn7pI5WssYVZoiaLJ9MSS3caN6O4PESJvqD35v3npjlQ329TyW3DeNTov6e24LfBxJ0rQrLWygm8LDFsiH7x2VX+kYddA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZS5lWVYEFvWml950x7HuUETe1ijU2xiJTsXxk5roKjY=;
 b=LFVVQlvT1aicwiek2tbTBhn/Oiu6mt/mecJxMdXaQLu6woSkvjvCAqsstf9QHptpWakAPTffAEHC2NnzW6dJdKk53LTG1mc9AmDQ6kgnhgh9U6jRAOdPtMOb1UTNP8lXkwiB5Z/H2lG3YN48D4M4ib2Dl5PPp3ZxtfsYJtPcxY/PwcH4BMZ2tqevrLF5YPxitVfa3bSwe0P80PqMMf6oBJSzWMrU+Xh8pWXIjRDL/kZI6etLrex1ug7Pus/5Ms+49Ygcu5/sDNb9mLi144Txn73fwYT6EC/h8qrhB86EdJaK0yITzoJw+4NF1IAYRJrkHbakl7bZpSrTeAWkvoKKVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 15 Jul
 2025 15:53:38 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Tue, 15 Jul 2025
 15:53:38 +0000
Date: Tue, 15 Jul 2025 08:55:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 <michal.mrozek@intel.com>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Disable compression on SVM
Message-ID: <aHZ56qiFgFN0MZ8O@lstrano-desk.jf.intel.com>
References: <20250714173342.2997396-1-matthew.brost@intel.com>
 <20250714173342.2997396-2-matthew.brost@intel.com>
 <338a3400-1202-4c12-a99b-6a45004ce548@intel.com>
 <cbec761a-4f18-45d1-8bf3-20791e0de82d@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbec761a-4f18-45d1-8bf3-20791e0de82d@intel.com>
X-ClientProxiedBy: SJ0PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::15) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ5PPF57F27BA08:EE_
X-MS-Office365-Filtering-Correlation-Id: ed26f2f9-64a3-4252-dcc2-08ddc3b7c31d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cjXRvQnSHKKuGd8UMd6SJ2w6BDrTV8hajNGQTVccthxDlNG4QV0LI90N5T?=
 =?iso-8859-1?Q?onYqGKAjeg1blZ3iCG72WcC9gaYdC12wgb/cJLr0sdbWa6jmTkSV6yBhG1?=
 =?iso-8859-1?Q?g1n03wfFgn+KNcrsGVZc3p3XYopXufLzLqabeSNnvAh7hCTZ6J7v3mDU9k?=
 =?iso-8859-1?Q?SwxRhGmLHl7OdR2KOmmg/DPhqBLrbwWg3FsX1UYr59IYgZo+10YhHv4asv?=
 =?iso-8859-1?Q?UfQWlqlAodhN0uACmtG9n5knd9kdHp877/VI29c4R5j9DRe1pndY5Fnm0W?=
 =?iso-8859-1?Q?fs+UWUmBvbbo2cH1f+h2sktSAochygdV7UpwKGN2QEprqR8rcj5UF7Pv/x?=
 =?iso-8859-1?Q?UxMJ/ErA3YQq736NKXwr93/JmxS+s0haRgnPF3viwanBwNtCeESOvht/RH?=
 =?iso-8859-1?Q?Elo6zS/HqiM9yWxZ7a3pI5OvLT22A+5negp6KGSVY5Rf+3qcQHoSDdExMP?=
 =?iso-8859-1?Q?HsWbghaHdrfBZRW/BJF3aiJjgNAGyv4Q61TsKn1bBhMh0cqf+Al/np2ldv?=
 =?iso-8859-1?Q?PG92i6H7Xdf1VCy5r3DWy4SK8JfJ+w1gy5pa571fq7HxeZVsdmuxsVBRmp?=
 =?iso-8859-1?Q?T1/8PKFMFttyRrfdMX9h/A4YrOKCb/jrUDlD7A7Syh/r9fxVO4VaPWOj/i?=
 =?iso-8859-1?Q?gtV59XqIxbJsjTvm0Zp2CxAOnQaJXnQSZDcoLnCLvP4XKmMw/Kpw/X7PeN?=
 =?iso-8859-1?Q?a4ejanxc1bm0twCZCBafqERM+7r9l7Q8p0NmjuarpPBT+TDGfITGkuyD7v?=
 =?iso-8859-1?Q?J6pJ2UWxdNWbXi6ELo90xYwOfChyqpfnTUKVWDo1gzcSVbbD8ajmO3LyrY?=
 =?iso-8859-1?Q?0h5/FQ8VR56K6tshR9xW+5mvJdlIvhEPSvUOz+e6Zpjp7awswgmdPT0uLk?=
 =?iso-8859-1?Q?brNlWfpjHmeCqb5OQYmp3j9PhSZsQB9UaEvvZsnh+Ng8V6k2YKrmqB4rl0?=
 =?iso-8859-1?Q?wfQ5LKi04nlmE92q4TRcdMxkGC5ITQVy3nwthZkjpHMoD4ZupONCAh4wry?=
 =?iso-8859-1?Q?0QuJpEROPtkIkUAOFgedhQ8KOh0OW5PWKanhEtt1HaOF9ZGeGvXaFw74qk?=
 =?iso-8859-1?Q?VpG7XGVidGbk65R/JpRVkawSAbYOLWf1lah4mFlDjDqDohaeqdvOhAKJYT?=
 =?iso-8859-1?Q?EyA0EDzqoO11+rGcvklJMSDZBz/hZR5HG9ToJ70k46iwOPT5Auqp3hfdzI?=
 =?iso-8859-1?Q?/iL2y3ni6g9KWMQ3QX1uWeg5YLt3OcB1BymlH0QZnr+lLfRF0StI1K/4EO?=
 =?iso-8859-1?Q?/7bK2KUF2vnyPcozcvatFM26vnn0y7JDpbJrwD4FjaQmZV5Dr9Fh09mLiV?=
 =?iso-8859-1?Q?t77RdoMCFmC5wim40tfUDPUcf7xkfTv0ymFZkUS75rN9gzjyI3DcYAb06v?=
 =?iso-8859-1?Q?XYIQsiEY50EZd/gByaSjGrFJ4auhdiosgrgvwwGqJP1RAZLrYLqiPYmQHZ?=
 =?iso-8859-1?Q?Qq2yPpyq6283/PfsFDSQLE2uvJGTGpm31EGUtkOWjKTTmua4fdbSUAKAD3?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?R7PbY5TlS6/n7BaqtrSxpYLeF0DKklX0GQvqipK34+9xDrjRzQfqWsDMAn?=
 =?iso-8859-1?Q?x+fjitutS1A+1l7eO/4lSreCDJG1zP8JMR+KYZug7PqDgATUOZuNWQojJF?=
 =?iso-8859-1?Q?3uadavL72LOVwO7dXo7FpZGd/VDh7uoV7NuwDeMhpQfBJN/XOUmI64u/ub?=
 =?iso-8859-1?Q?cvs+KBYRgVHciCEwaCICpK/0NqDyIPNhvO9p7FTGs67mGhOqYTzPuXeLk/?=
 =?iso-8859-1?Q?RUOBYROORaenrrSdY+36hEE96Vg3TXOCnhCLg9ZmxCacdtu7hGYL84MgFU?=
 =?iso-8859-1?Q?dEPFLzHvJyZtemjJR7x7ZNusCi07V8Fywt9v5ab049l77BoLBb5Vd66wol?=
 =?iso-8859-1?Q?NyfG6ZO8nyJeRLKJSniXDdbaAIJ6aUfZzOzN711p1LmHipfckbe3dl89HF?=
 =?iso-8859-1?Q?CN+p31oBBH34XtWvwO2qIFp8lD5XiV9+xMYxIxNy2BGofs4+f5iXRMnX9e?=
 =?iso-8859-1?Q?pI/GYl28ruYIbb0e1Ob06q+Y50GGH8cJXf0a7K/86QtyO9BPUthsdzREoq?=
 =?iso-8859-1?Q?tiHE+iNQ44q7TqSQPnP8Ef4MydG2EBfMTwaL7u7n5pFqM8MqJNKCnmLPWf?=
 =?iso-8859-1?Q?JW0CMdHvekxV9R4YEvbcxx7s8d/jS7aGlizlxeg+QstYQX4EdCyQSLBBQy?=
 =?iso-8859-1?Q?zF0S7JxgZM7UAH9riyv8jElwA5DdevBeh82QQNIbSX1Mwb82gm6XKyXwsU?=
 =?iso-8859-1?Q?+FQo8QktBKB0pHdBmYADhY5jzuR83fTLJzM0iAbnEpA/3ANiOnEmMQI5sf?=
 =?iso-8859-1?Q?xmgQ2SX8mPXme9bDRnOkwZk3mrWY2jimMeLyVsn4TX5JFIhSzBZE+fNXs0?=
 =?iso-8859-1?Q?xsO35sdxmMxKa+trmu2Nv7ci1YUmZSPdphTtC0067zAMcRJWUesxSEiPKp?=
 =?iso-8859-1?Q?+ELSrsN+uswAt96y12kipLCKqDnpQb54gtyOIlj6dc6Dk2ntz4ix0JPvsv?=
 =?iso-8859-1?Q?vdZYnAbd7HhxxZkPjrdnhdA2BpLjvHo+l4Nuk9fbwl09ZHGtmmR1RncuiV?=
 =?iso-8859-1?Q?3eCZ4wk+MXLzwVMz/RLgEY3gVIwZ6A2VRRPD9DBpRGK/eqQ4JoPTIY6d1W?=
 =?iso-8859-1?Q?tOagaaeMWLx/zAqk4vbgLD2nVPiSPQueMPlWVy0uEsSVama973ZT9tM1gc?=
 =?iso-8859-1?Q?IdnvfzG5EH9l6MpFLYjuGTFOk5UY3gZFliQDpZIEAEMe9VJ0VtJj8zS+XP?=
 =?iso-8859-1?Q?E1/b2XSJNEPcAhLiWT/jblcMu8y7VlUVHnFgst4oQjgWtMDeeAAcqnT29E?=
 =?iso-8859-1?Q?CkKSWMiY8YN93RUPGojIscxaN1+p7mNMWwfOIeaBu82NsHcPoF+zO4e0fa?=
 =?iso-8859-1?Q?eeGlpDxt9zHMiFgpT97ExTkV1y8gaJE/5SUenhCGRv1pIPIB/J3hZFtIhl?=
 =?iso-8859-1?Q?aPMvpgu84vt+8fRKNuBZFh2i8ix74T2kLaw+xWbjfDD+dMZ4swPEKUOqPg?=
 =?iso-8859-1?Q?vSjEhfHl4t3Rnno2J2yhjMLVy186upKDnBUrRKyROmYcoSR3Ur4lVAoYzE?=
 =?iso-8859-1?Q?IYGF/boprb4gWIK7K2akWVqtw01xJ2CiFVLnVaWP11GE6bbN0Yp8DGttv/?=
 =?iso-8859-1?Q?Gi9nNYwD85S3XH0t6d2hSq3KTK2g2JW5Z32XTkT0N4uKvumC8PslNNqUOp?=
 =?iso-8859-1?Q?2n6O//Vxee+Adf1clZwlRVhagKr+CiG8xf5y2GnQHJHzxx82x3KKWDPw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed26f2f9-64a3-4252-dcc2-08ddc3b7c31d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 15:53:38.0016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bCH3wpkNOq36Y4Ea5HIhfDAptzT7minHRVtqFJGNc5ePJ3xgx1p7XPzd4r2UFAT/X+iv++BauSsDtiiLAYluw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF57F27BA08
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

On Tue, Jul 15, 2025 at 01:56:42PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 15-07-2025 13:45, Matthew Auld wrote:
> > On 14/07/2025 18:33, Matthew Brost wrote:
> > > This is not yet supported, forcefully disable by setting pat_index to
> > > zero for CPU address mirror VMAs.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Fixes: b43e864af0d4 ("drm/xe/uapi: Add
> > > DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_vm.c | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 2035604121e6..73cb981c0956 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -2362,7 +2362,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
> > > struct xe_vma_ops *vops,
> > >               op->map.is_cpu_addr_mirror = flags &
> > >                   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
> > >               op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> > > -            op->map.pat_index = pat_index;
> > > +            if (op->map.is_cpu_addr_mirror)
> > > +                op->map.pat_index = 0;
> > 
> > Is this meant as a safe default or is this just a dummy value? If this
> > actually gets programmed in the hw, maybe XE_CACHE_WB would be better
> > here? That way we know exactly what it does from driver POV for a given
> > platform. Index zero for example might have no host coherency (might
> > then need WC on host). In some world index zero could enable
> > compression.
> 
> +1
> 

Will fix.

Matt

> > 
> > > +            else
> > > +                op->map.pat_index = pat_index;
> > >               op->map.invalidate_on_bind =
> > >                   __xe_vm_needs_clear_scratch_pages(vm, flags);
> > >           } else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> > 
> 
