Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A65C36008
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 04:13:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AA110E24C;
	Tue,  1 Apr 2025 04:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2GgZe2Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28DA10E24C
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 04:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743480795; x=1775016795;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5RtzCRQBivku6wY1UY07OWLqm84SwCU4vZSQTn2G2cE=;
 b=B2GgZe2YtITSXbdhm3WqUxXlTTRhBrfAMVrlo4TWOap02GgQv2W8Kc5w
 7Ub8LLcsbB+WPDJ2b7qNIur9guTz40mMPVzP5HG06Odssp5dISdpHW3io
 Smy1WYcmeU5nXtAtgsxF4AElKqSPgvXteDAuYL5hRxIlMQasAD7zqzlVe
 05JaEWSJXReXz7t9v78Xn9igNs7u6hFuIy7E455XuJB/iLPYVu5JRdxcg
 9P2/3ZHRv+ciStvOwiiOjuMgtsl+oak2LZQVsvTjriYFj7jdzvn9l96Vw
 xk1ANWlenU91yxqRTEfFcvlts3GG3IzY5RJiaWiPMv5TGHzZWlva2aBTy w==;
X-CSE-ConnectionGUID: ZqTmn+FQRHi7IVsEayCTyA==
X-CSE-MsgGUID: xKQfD2ckRwmO2G0TLCLSnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44958908"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="44958908"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 21:13:13 -0700
X-CSE-ConnectionGUID: 8pBjF9ALTiam4Wwrpenj9w==
X-CSE-MsgGUID: NiyljLkjS6Gbldtu4M+k2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="126781473"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 21:13:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 21:13:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 21:13:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 21:13:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAnI/cHWFthraZWul1XUKYVhjHhckl0VjhQNXzua8LnBaVOybbpT4cAjbdki2UZ2Z0h04WmOchPmI5g+2nHfW+7dvGNZNKxslbg2OpUNMVnUbTbVkuN3B5P++qZZpPcO1ml7DtdK+zsAXXjlBGcOvtB4rcjoQAwF9NmUaf7T0xkaAZs3YbEYsDEGLqAkj9OnG/YxZ5qjLF64UpjfhVsuMwCR9wNpyqooub3EOMQx5CmW/D64Vqf8eOti+yE6mjQbNAkKqc/ccpkXNqPNqOfQYkl0qxUhXJ15oP7LI1oHNY1Lu5ft7mvSVvMxH6cl28Kuv/earYWYb/kuGA3GyISNKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAPUWg9Vci8YpWujLhBPPx+j9REEZlqw8JFVXWms7/s=;
 b=juFxVAmBjUxJ3zhcOVae7RKDxAdZyr6sMRjXS+ovNdLpFhFxGisZYAKHDuGEMYLzIkwpMMYLnk5gLvHmB5mILKPQyilniBj3y0eC0ujDNXz5vdP+8Q2gFPBHVrmAlv/U+qR7O7skUwKpAFQzDHV1fQo5r/VOu6HGZzSrjBdeKx6NNgoEVJ09u2WtTIDVDPza1OqcqV3s9a6WOdIaqIV4MbgDgWOdwqs/opLdLQHWVz0v2exY6i852jSWuYGjDGuv1K9QTfKtp3ig7bM5zEVtpD7cV3/6+LXA9OcdyK/SiUKP8boGNQQNV9P7pOKVwyWMl6mzvq/qAFG80nwTIxgp0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6067.namprd11.prod.outlook.com (2603:10b6:8:63::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 04:12:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 04:12:29 +0000
Date: Mon, 31 Mar 2025 23:12:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Koby Elbaz <kelbaz@habana.ai>, "Daniel
 Vetter" <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Ofir Bitton
 <obitton@habana.ai>, =?utf-8?B?Sm9zw6k=?= Roberto de Souza
 <jose.souza@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: add mmio debugfs file & restore
 xe_mmio_ioctl as its ioctl handler
Message-ID: <2yaatghz7dberaakuddebwwhbjfweuvy53oedssdxead4ja4ql@vdcyd3gthuyd>
References: <20250324110730.2521805-1-dafna.hirschfeld@intel.com>
 <20250324110730.2521805-2-dafna.hirschfeld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324110730.2521805-2-dafna.hirschfeld@intel.com>
X-ClientProxiedBy: MW2PR2101CA0004.namprd21.prod.outlook.com
 (2603:10b6:302:1::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: b0659617-3726-49a6-28e1-08dd70d36afb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ohzjaz+1ociXVvH/7XehXqCm2P9TCV4poTOmzttrUwlvuWnVbjC8BPw9Bc?=
 =?iso-8859-1?Q?ZE6AyO2P7c6ZLdsKJGNO4jbaZBNXCha9eUICPB1cTKsuR3+8oJxIXn9Vbl?=
 =?iso-8859-1?Q?fJGDrOTu3eanwGnqBzPdJAOFdYd6pPhhGPfhIdnAHVzWbzfVTuVFVJAZQO?=
 =?iso-8859-1?Q?tbjfGh0SG0vpPQzVMgTlXMrCB2HVpr4x9fwhNjjRr0HAlOxUy/vE2XVw5m?=
 =?iso-8859-1?Q?rggTRoCqcniWqK65zl7C32UJdOR+XKJJdVaAKSITnBapWkNeWa+jGK9Hq/?=
 =?iso-8859-1?Q?aZRjAxQkGBMyBG+cHpTOSyPp/oE7CNTZav9Q3wtdI7BtW5nnbAyMVVShou?=
 =?iso-8859-1?Q?SrPEIKc4c3Z8+8zMrvjPcFOW8+sEJdu/P6SsiI3b9o1W1tOkglUQcrs7SF?=
 =?iso-8859-1?Q?okmChJThLfrPO0nmU38HgaWaD5L2NBcubE9FKlxPe5KU7s995uWw0EaCT2?=
 =?iso-8859-1?Q?D2pSgVfGbGsxiPFRFCDvhQmSRsHTnc+fcnrJvjktSkNIz/avFHVmMHnwp2?=
 =?iso-8859-1?Q?IBsmE+029Y7HPhFuN7H/lffGTY92TAvjfLu/anFq1raxO9XZ1arkdXHbY1?=
 =?iso-8859-1?Q?8xypLfp0gan5Kasron0R3NoRkWLLU6ylflalkqSjW7wUVNqnQmNruSv8FF?=
 =?iso-8859-1?Q?jeyKIbMMNdlKM+3CLmbCN8dUR1RPFXFsFfmhH25Fk0Ay3jjQDVFLj/YI2d?=
 =?iso-8859-1?Q?9u7Yr7uHK0F5udLVbTKJSzmVihma9qHU0egfI+RtGKjgZgH+CAk+/hPYDr?=
 =?iso-8859-1?Q?wcTZsb6Gnyn4Ct4V03tEcdgJkAaHimX3hPY6R5+1MhFmGllYFp6jy1EZM7?=
 =?iso-8859-1?Q?KyB2yNDcVyV8cPkkXd2EGAlD0tjcIfBfDh5mVVqZ3Um/YgTXqrQXAljLb6?=
 =?iso-8859-1?Q?vm/zyse0VPmKNs6hYqO3aYpYigtukeNQX1ZtLVfVCFwjejETZ2Cko/tYoG?=
 =?iso-8859-1?Q?H6XIoo4nJHuU/cknPLaSav4ZNVmyAId4uR+rwbE0MyV2Rw0wC0+GY4VlyN?=
 =?iso-8859-1?Q?Wm1s6Fs3CWajQHAHaNZs6vmC2rUyVhfZfwwUXmxTpIY86iB0K+0tCxWhJL?=
 =?iso-8859-1?Q?QsF+FpgX/4uaxFWP8QgrJANRWd38q/vGQ9yMy7JLxejP+beqiU9kIU4Wtd?=
 =?iso-8859-1?Q?mCrFB1CNzHReHYCT7Lc/2mzUTIRUOuhzwDQXHU0zwF+ScKqOtmSs9awMCr?=
 =?iso-8859-1?Q?DOoC9h1uswqyIkCPQmoZglOBBipNSwFyAkhzrwgy3OvXZ92SyQUU3Psedu?=
 =?iso-8859-1?Q?qfntZyuRu/5oOX1GVuAK5zM71IwuV48t2kxkGn1yggSrSHAShMMxyP9bN5?=
 =?iso-8859-1?Q?d+4HXI5asnRLPQtFp7kI+8QcEviC90Gng5MGNqLE9Ea/yPegDgq/eqrrmD?=
 =?iso-8859-1?Q?UvJERnHpcGOtQXtjPujXE3CCIpC0USrn47J4GGTGMDUfs1YrsFxSHMPL2o?=
 =?iso-8859-1?Q?qeO4vM/IzSq1+vR1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9CMiTEBEolgfrgVZu4MF8PEfJYsU/G30Z84HZ+CLpzLEfOa/vSYF9yHb9T?=
 =?iso-8859-1?Q?xY/5alcCKlQ2KjFPQ1qXiS/p2PgPat+LVTkOjxuyox9Yeq2ak6TkZaPsJN?=
 =?iso-8859-1?Q?QF6ErrLk2Deh8DezU8lc2jTqSL2DjyZRf6TaSEkwyOdS9wUSVY0z7Oqrjh?=
 =?iso-8859-1?Q?aU8pJPdFBGG1VzNJmCzWlNubmqbHU9QEuIMubvwgIjNcGOvsb8VgV0BK3Y?=
 =?iso-8859-1?Q?OpPX5FsnG8A5InNXTb3zbK3wc96OIzzUVyqpStFa7D2fJcoc+EnKQkrGBs?=
 =?iso-8859-1?Q?GHKxST0GpboRM+PV1KAeN/RdsWMt0pbzuqRt4YAE6x6XCXjIcQB8NQ87fD?=
 =?iso-8859-1?Q?mE3jd8rlU7MtrPzfBWyo2niSQEwSPHX3ibwH1f3vCuNIpvl2qgVtfPlpkE?=
 =?iso-8859-1?Q?Nq1T1AVL0O9YeCulEk5VCkijZLcQbVfC04ZWqYnnyEfs5VOVWBgI4UEGS1?=
 =?iso-8859-1?Q?Ruyhi1pDDepYwvfh7bG3JyqvIlwiL27eJpceI2ozTNx+J0MjE8F9T+LIg5?=
 =?iso-8859-1?Q?qPe6Xg+i9SAtxg69uYLzg3bRnKA9sUFgZTwXfQMfWsjd6ICHimN3TDYIcH?=
 =?iso-8859-1?Q?12ZWyMUMfY3s2sU2mGZnNuNzvul3iHuCt2Ij/6H0u3ZIYlBYq+hMXE3Ygm?=
 =?iso-8859-1?Q?N5TVxsDqL8e3Uhq89oKFnN1ocyoSWzTCxAzsvgW8542W5utSSvkj5tD5vW?=
 =?iso-8859-1?Q?53E54PmwkhQzRbgF0p3XSMZIA11IprWjYunWs+SMOYZEbcJbPuNkjfri+H?=
 =?iso-8859-1?Q?fXp4FEBHdYhH43vwVOeF1ly83hHXXGNNUiEdGaxio+SlRLW3TaMjVEsHgk?=
 =?iso-8859-1?Q?wuJKbgsRGo0z5WP4Cj899Yocivok4NpJqes0ai1qnRmBJcbBg8VDe8d7JN?=
 =?iso-8859-1?Q?zabdYByEfvQ7/58I21s8q7rUZEBAQj0w7rxmbquHH6ZpeHpIO4n+1WdkNO?=
 =?iso-8859-1?Q?fDDdiCuEE70rtUynVBIxUtXKS2GKlv58AfAQxmqmYI+ROucEkpoNolGov7?=
 =?iso-8859-1?Q?SN/tky67WdKgDBa9as9HUat/zJl7W5/sabCmyuSNqPoF81JZqoiRTnBx+O?=
 =?iso-8859-1?Q?MK8VVPUXkEXkwMWUAEr3PlUcstqeyureBt8OLdaMnWwfCAfaoPcSkDfscE?=
 =?iso-8859-1?Q?QSD1e3A7pjoad1mBDOa03m7tIhRS2JtQWMrgBpqE28Yc1iDmVAlf+iPc73?=
 =?iso-8859-1?Q?fQK+f45MP/CSsKMz8FGyt3e5MZAgFJSJX+VBppKzwfM4cEiiD4fTcgC2AN?=
 =?iso-8859-1?Q?AK6JV16ZU6Iohbqe8zWTGWq3kiIxwtSVJCrwocyyiHpR4ywTgR5Ad9y5tF?=
 =?iso-8859-1?Q?59/Ghad/EArUs3z0IMvSqyhEhrtjHf+1gh5uw7q9dfuHekOskfgdL6SBVD?=
 =?iso-8859-1?Q?OiHMwNIuCg3l1yNftTtAROvWMnnEjrCbs5edy5VFrX81XWAoBeEqqWNddM?=
 =?iso-8859-1?Q?r7j1rl1FMPOtxmZHNyowh1vLYqFtZXgmFqClSeGYil3jettfy3NqZ/pMvO?=
 =?iso-8859-1?Q?zaqI0drJEjhn4cwfrcFLkpSm39ejVeTtswNIXfSCP/MuV+rAVgOi+UQU2h?=
 =?iso-8859-1?Q?halXoZixXTimIYzXunZ9b8ZCjn2jelDcuzFW03ayRpl3Ql3mhCCgzZMj/d?=
 =?iso-8859-1?Q?ikkD0mK8dT8PGOr0dZDqELuVZ1N90JAsheI29LJoXUkJ9u7kg2ycqBgA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0659617-3726-49a6-28e1-08dd70d36afb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 04:12:29.5867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTvDD3IPVYAElaZu+7/UbEVpdcXyzYYZC3JRiWcU+zFQ8pT/9Nkyh1xQfy+MLox37n0QPzVD4f4lwN88UOADEn9S+Vq5p55kC8QZanZiCD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6067
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

On Mon, Mar 24, 2025 at 01:07:30PM +0200, Dafna Hirschfeld wrote:
>From: Koby Elbaz <kelbaz@habana.ai>
>
>The drm mmio ioctl handler (xe_mmio_ioctl) wasn't needed anymore,
>and therefore, recently removed.
>Nevertheless, it is now restored for debugging purposes as an
>ioctl handler for a newly added 'mmio' debugfs file.
>
>Notes:
>1. The non-admin user's limited mmio access (aka, whitelist),
>was removed being irrelevant anymore, now that a user using debugfs
>must anyway have root permissions to use it.
>2. To support multi-tile access, the tile index is now dynamic and
>will be retrieved from the given mmio address itself.

humn... but each tile starts from 0. It's the gt that uses an offset
inside each tile.

>
>Cc: Daniel Vetter <daniel@ffwll.ch>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Ofir Bitton <obitton@habana.ai>
>Cc: José Roberto de Souza <jose.souza@intel.com>
>Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
>Reviewed-by: Ofir Bitton <obitton@habana.ai>
>---
> drivers/gpu/drm/xe/xe_debugfs.c      | 157 ++++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_debugfs_mmio.h |  40 +++++++
> drivers/gpu/drm/xe/xe_gt_mcr.c       |  16 +++
> drivers/gpu/drm/xe/xe_gt_mcr.h       |   2 +
> 4 files changed, 214 insertions(+), 1 deletion(-)
> create mode 100644 drivers/gpu/drm/xe/xe_debugfs_mmio.h
>
>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>index e60eaefdd4a5..fb32679e88f0 100644
>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>@@ -5,12 +5,15 @@
>
> #include "xe_debugfs.h"
>
>+#include "regs/xe_reg_defs.h"
> #include <linux/debugfs.h>
> #include <linux/fault-inject.h>
> #include <linux/string_helpers.h>
>-
>+#include <linux/security.h>
> #include <drm/drm_debugfs.h>
>
>+#include "regs/xe_gt_regs.h"
>+#include "xe_gt_mcr.h"
> #include "xe_bo.h"
> #include "xe_device.h"
> #include "xe_force_wake.h"
>@@ -21,6 +24,8 @@
> #include "xe_pxp_debugfs.h"
> #include "xe_sriov.h"
> #include "xe_step.h"
>+#include "xe_debugfs_mmio.h"
>+#include "xe_mmio.h"
>
> #ifdef CONFIG_DRM_XE_DEBUG
> #include "xe_bo_evict.h"
>@@ -150,6 +155,150 @@ static const struct file_operations forcewake_all_fops = {
> 	.release = forcewake_release,
> };
>
>+static struct xe_tile *get_xe_tile_from_args(struct xe_device *xe,
>+					     struct xe_debugfs_mmio_ioctl_data *args)
>+{
>+	u32 tile_mmio_base = 0;
>+	struct xe_tile *tile;
>+	unsigned int bytes;
>+	u8 id;
>+
>+	if ((args->flags & XE_DEBUGFS_MMIO_BITS_MASK) == XE_DEBUGFS_MMIO_32BIT)
>+		bytes = 4;
>+	else if ((args->flags & XE_DEBUGFS_MMIO_BITS_MASK) == XE_DEBUGFS_MMIO_64BIT)
>+		bytes = 8;
>+	else
>+		return NULL;
>+
>+	if (!IS_ALIGNED(args->addr, bytes))
>+		return NULL;
>+
>+	for_each_tile(tile, xe, id) {
>+		tile_mmio_base = id * SZ_16M;

so the interface is such that you encode the tile in the address and the
userspace side knows that each tile has 16MB?


>+		/* Each tile has a 16M MMIO space, but the contained CFG space is only 4M */
>+		if (args->addr >= tile_mmio_base && args->addr <= (tile_mmio_base + SZ_4M - bytes))

this addr validation looks conflated with getting the tile.

>+			return tile;
>+	}
>+
>+	return NULL;
>+}
>+
>+static int _xe_debugfs_mmio_ioctl(struct xe_device *xe, struct xe_debugfs_mmio_ioctl_data *args)
>+{
>+	struct xe_reg reg;
>+	struct xe_reg_mcr reg_mcr;
>+	struct xe_tile *tile;
>+	u32 mmio_offset_in_tile;
>+	bool is_mcr = false;
>+	int ret;
>+
>+	if (XE_IOCTL_DBG(xe, args->extensions) ||
>+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>+		return -EINVAL;
>+
>+	if (XE_IOCTL_DBG(xe, args->flags & ~XE_DEBUGFS_MMIO_VALID_FLAGS))
>+		return -EINVAL;
>+
>+	if (XE_IOCTL_DBG(xe, (args->flags & XE_DEBUGFS_MMIO_OPS_MASK) == XE_DEBUGFS_MMIO_OPS_MASK))
>+		return -EINVAL;
>+
>+	if (XE_IOCTL_DBG(xe, !(args->flags & XE_DEBUGFS_MMIO_WRITE) && args->value))
>+		return -EINVAL;
>+
>+	tile = get_xe_tile_from_args(xe, args);
>+	if (!tile) {
>+		ret = -EINVAL;
>+		goto exit;
>+	}
>+
>+	mmio_offset_in_tile = args->addr - tile->id * SZ_16M;

here you already leak the information about the tile from
get_xe_tile_from_args()... so I think you could just as well
validate that the address falls into range here.

>+
>+	if (xe_gt_mcr_is_mcr_reg(tile->primary_gt, mmio_offset_in_tile)) {

humn... it seems that what you are doing for should be done done for gt.
At least for a reliable lookup of mcr, you need to know to which gt you
should be looking. You can't assume the primary_gt is the target of the
operation:

xe_gt_mcr_init() {
	if (gt->info.type == XE_GT_TYPE_MEDIA) {
		...
	} else {
		...
	}
}

the steering ranges are different depending on the gt type.

Since this interface is supposed to be more "device-centric", you could
loop through the xe_mmio and find the offset based on the register.
Currently there's only 2 primary_gt with offset 0 and media_gt with
offset 0x380000.  So here you could direct the operation to the media gt
if addr >= 0x380000 (but doing that by looking up the actually GTs
available, to be compatible with platforms before MTL).

Another idea would be to make the gt part of the ioctl args.
And yet another idea would be to have the mmio inside the gtN dir,
so you don't need the addr lookups.


>+		reg_mcr = XE_REG_MCR(mmio_offset_in_tile);
>+		is_mcr = true;
>+	} else {
>+		reg = XE_REG(mmio_offset_in_tile);
>+	}
>+
>+	ret = forcewake_get(xe);
>+	if (ret)
>+		return ret;
>+
>+	if (args->flags & XE_DEBUGFS_MMIO_WRITE) {
>+		switch (args->flags & XE_DEBUGFS_MMIO_BITS_MASK) {
>+		case XE_DEBUGFS_MMIO_32BIT:
>+			if (XE_IOCTL_DBG(xe, args->value > U32_MAX)) {
>+				ret = -EINVAL;
>+				goto exit;
>+			}
>+			if (is_mcr)
>+				xe_gt_mcr_multicast_write(tile->primary_gt, reg_mcr, args->value);
>+			else
>+				xe_mmio_write32(&tile->mmio, reg, args->value);
>+			break;
>+		default:
>+			drm_dbg(&xe->drm, "Invalid MMIO bit size");

what about XE_DEBUGFS_MMIO_64BIT?

>+			ret = -EOPNOTSUPP;
>+			goto exit;
>+		}
>+	}
>+
>+	if (args->flags & XE_DEBUGFS_MMIO_READ) {
>+		switch (args->flags & XE_DEBUGFS_MMIO_BITS_MASK) {
>+		case XE_DEBUGFS_MMIO_32BIT:
>+			if (is_mcr)
>+				args->value = xe_gt_mcr_unicast_read_any(tile->primary_gt, reg_mcr);
>+			else
>+				args->value = xe_mmio_read32(&tile->mmio, reg);
>+			break;
>+		case XE_DEBUGFS_MMIO_64BIT:
>+			if (is_mcr)
>+				ret = -EOPNOTSUPP;
>+			else
>+				args->value = xe_mmio_read64_2x32(&tile->mmio, reg);
>+			break;
>+		default:
>+			drm_dbg(&xe->drm, "Invalid MMIO bit size");
>+			ret = -EOPNOTSUPP;
>+		}
>+	}
>+
>+exit:
>+	forcewake_put(xe);

as Rodrigo said, just use xe_forcewake directly. No need for the first
patch.

>+	return ret;
>+}
>+
>+static long xe_debugfs_mmio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>+{
>+	struct xe_device *xe = file_inode(filp)->i_private;
>+	struct xe_debugfs_mmio_ioctl_data mmio_data;
>+	int ret;
>+
>+	ret = security_locked_down(LOCKDOWN_PCI_ACCESS);
>+	if (ret)
>+		return ret;
>+
>+	if (cmd == XE_DEBUGFS_MMIO_IOCTL) {
>+		ret = copy_from_user(&mmio_data, (struct xe_debugfs_mmio_ioctl_data __user *)arg,
>+				     sizeof(mmio_data));
>+		if (ret)
>+			return -EFAULT;
>+
>+		ret = _xe_debugfs_mmio_ioctl(xe, &mmio_data);
>+		if (ret)
>+			return ret;
>+
>+		ret = copy_to_user((struct xe_debugfs_mmio_ioctl_data __user *)arg,
>+				   &mmio_data, sizeof(mmio_data));
>+		if (ret)
>+			return -EFAULT;
>+	} else {
>+		return -EINVAL;
>+	}
>+
>+	return 0;
>+}
>+
> static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
> 				size_t size, loff_t *pos)
> {
>@@ -203,6 +352,11 @@ static const struct file_operations wedged_mode_fops = {
> 	.write = wedged_mode_set,
> };
>
>+static const struct file_operations mmio_fops = {
>+	.owner = THIS_MODULE,
>+	.unlocked_ioctl = xe_debugfs_mmio_ioctl,
>+};
>+
> void xe_debugfs_register(struct xe_device *xe)
> {
> 	struct ttm_device *bdev = &xe->ttm;
>@@ -245,6 +399,7 @@ void xe_debugfs_register(struct xe_device *xe)
> 		xe_gt_debugfs_register(gt);
>
> 	xe_pxp_debugfs_register(xe->pxp);
>+	debugfs_create_file("mmio", 0644, root, xe, &mmio_fops);
>
> 	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> }
>diff --git a/drivers/gpu/drm/xe/xe_debugfs_mmio.h b/drivers/gpu/drm/xe/xe_debugfs_mmio.h
>new file mode 100644
>index 000000000000..20074a691e44
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_debugfs_mmio.h
>@@ -0,0 +1,40 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_DEBUGFS_MMIO_H_
>+#define _XE_DEBUGFS_MMIO_H_
>+
>+#include <linux/types.h>
>+#include <linux/ioctl.h>
>+
>+#define XE_DEBUGFS_MMIO_32BIT		0x1
>+#define XE_DEBUGFS_MMIO_64BIT		0x2
>+#define XE_DEBUGFS_MMIO_BITS_MASK	(XE_DEBUGFS_MMIO_32BIT | XE_DEBUGFS_MMIO_64BIT)
>+#define XE_DEBUGFS_MMIO_READ		0x4
>+#define XE_DEBUGFS_MMIO_WRITE		0x8
>+#define XE_DEBUGFS_MMIO_OPS_MASK	(XE_DEBUGFS_MMIO_READ | XE_DEBUGFS_MMIO_WRITE)
>+
>+#define XE_DEBUGFS_MMIO_VALID_FLAGS (XE_DEBUGFS_MMIO_BITS_MASK | XE_DEBUGFS_MMIO_OPS_MASK)
>+
>+struct xe_debugfs_mmio_ioctl_data {
>+	/** @extensions: Pointer to the first extension struct, if any */
>+	__u64 extensions;
>+
>+	__u32 addr;
>+
>+	__u32 flags;
>+
>+	__u64 value;
>+
>+	/** @reserved: Reserved */
>+	__u64 reserved[2];
>+};
>+
>+#define XE_DEBUGFS_MMIO_IOCTL_NR	0x00
>+
>+#define XE_DEBUGFS_MMIO_IOCTL \
>+	_IOWR(0x20, XE_DEBUGFS_MMIO_IOCTL_NR, struct xe_debugfs_mmio_ioctl_data)
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>index 605aad3554e7..c0d46704cda6 100644
>--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>@@ -540,6 +540,22 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
> 	}
> }
>

missing kernel-doc

Also Cc Matt Roper. We should probably document that this is only ok to
be called from outside places like you have. We don't want to keep doing
this lookup from regular in-kernel callers.

AFAICS it should work as long as you pass the right gt, which was not
the case in this patch.

>+bool xe_gt_mcr_is_mcr_reg(struct xe_gt *gt, u32 addr)
>+{
>+	const struct xe_reg reg = XE_REG(addr);
>+
>+	for (int type = 0; type < NUM_STEERING_TYPES; type++) {
>+		if (!gt->steering[type].ranges)
>+			continue;
>+
>+		for (int i = 0; gt->steering[type].ranges[i].end > 0; i++) {
>+			if (xe_mmio_in_range(&gt->mmio, &gt->steering[type].ranges[i], reg))
>+				return true;
>+		}
>+	}
>+	return false;
>+}
>+
> /*
>  * xe_gt_mcr_get_nonterminated_steering - find group/instance values that
>  *    will steer a register to a non-terminated instance
>diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
>index bc06520befab..93328b536b7c 100644
>--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
>+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
>@@ -26,6 +26,8 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
> void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
> 			       u32 value);
>
>+bool xe_gt_mcr_is_mcr_reg(struct xe_gt *gt, u32 addr);
>+
> bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
> 					  struct xe_reg_mcr reg_mcr,
> 					  u8 *group, u8 *instance);
>-- 
>2.34.1
>
