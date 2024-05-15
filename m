Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBCCC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 20:04:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4903610E5F1;
	Wed, 15 May 2024 20:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LOiv2OSU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3066110E5F1
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 20:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715803465; x=1747339465;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=66lZfHn9xS1O0Y790ktoJHZFm5bV+Zd1fT77Srr3T0E=;
 b=LOiv2OSUl2F6sGT7vxN9sRlAkEPgLv03PNoC1Ext5ig4ivUlcphSCq0B
 CfAJgrZJHWiFsm9khfkxYqV20XeOuncMgfPGJ8o7P0kFRq+2CGRn2MFk/
 GEDuMPLN1hna8Y4dSkckyGt8cckTCb5SjDTWrG38OWg1LNdwGuyUfUyH3
 1NIkQuXaBNKxlzXNLV+Yui0Aeh01Von4N4O8E9W9lU8O+dbS+IciGpINJ
 iYUGswPl/aDE4VQ3Q84pU2z5X6be8OjF6oVrJNFCQPsOouG0R0WqIlU8C
 RAyyzjFydbiXmiv6d0l/Yh4296wd8GA2ffsI8OSfFzyB8/DKcagH128/3 w==;
X-CSE-ConnectionGUID: zMRkCn2iSHSpoMIBb1wTgg==
X-CSE-MsgGUID: gijBidq5Q8e82y0sDnZq1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23279434"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="23279434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 13:04:25 -0700
X-CSE-ConnectionGUID: 69EMTjj8SNW/Eksyxp3ELg==
X-CSE-MsgGUID: u6lzgWlDS9Spo3g3AiP/Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35627483"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 13:04:24 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 13:04:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 15 May 2024 13:04:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 13:04:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlMgKX9CUi8oJWRwvEen6JJQtLahruK4uvvUKoL6azqJqJgJfR4CfMLq0jPkITSZC+FxsD4O+4R00HRxIaumIimYZYtFi1vMuqV3dVbP/cLglnEIIO9XtXbZb+7jwpnGvsG4TiRq2JhHUfacRyePKiLZM+0HY2iSs9WUw507ggW/katyLWKyfYgObGPpFRA6zJq+8IEsQ+V7zljPdo9tKWv7o7MEoUu7CliUPuMDqg5vIzkyGE9DBEC05kPtoq2T7oPMPwUn+k3MNe9obkG2Ovv97mIhTb6A109DkAllP+RRK9L6YKPO7y887pMU0Y/GxUmfnD7GM6Xe2gdYvf0i+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9Pq5F32fchIjZMbgXNyrIy+qhx4aCvd6SkRECTkPlk=;
 b=WvpEcyb9f+yH7tcOd1Z+sQHcF7BvXZXwgu3ZC8tH+tJqrFSHCO3RgfQQV0y0EVhBIK8JrO7tLRkYTxTg/cbmlTwOvhX+RoTinscQ+kzCA6uynnKCz1JTovkiXd2yDv4gUu+KulM4DgOu+hW9rVLX0b80IP39kyzWrfJYi+DJzq4WuitfU3kJfxvYt2Q25ntrX76rNbFLTDYuXsxXfuhv2yq3e41qasLarB8UJZAhflDlXkbsecAN2qqYLYlg8udLRxmVHmBi5B0QpActBvNoSABtpRItFlSRq0m6G8zE7ygHwxFKJZJ4zDJBJg4ii/1p08lemoL8iBXM5UyWWsR/kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 20:04:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 20:04:21 +0000
Date: Wed, 15 May 2024 15:04:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Koby Elbaz <kelbaz@habana.ai>
CC: <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>, Daniel Vetter
 <daniel@ffwll.ch>, Ofir Bitton <obitton@habana.ai>, "=?utf-8?B?Sm9zw6k=?=
 Roberto de Souza" <jose.souza@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v9] drm/xe: add mmio debugfs file & restore xe_mmio_ioctl
 as its ioctl handler
Message-ID: <75pog7eg7y5igqenv7gjgearkwyn66ba2cnxpwhfh5wgjtj27o@nqgpq2vew2vt>
References: <20240515165244.156194-1-kelbaz@habana.ai>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240515165244.156194-1-kelbaz@habana.ai>
X-ClientProxiedBy: MW4P222CA0020.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b32a7f-efc5-4a6c-ffee-08dc751a359c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?DAIgxJOEds81x72xDxhK5xHckJJBEVY39bBidzlRyQM/CU0oT5jNj936iM?=
 =?iso-8859-1?Q?10EqC/eUwXTBiHS5T/i6ldXnZVIFZM/XwFnBBU7W1gjhgYiiszMaCOk2wK?=
 =?iso-8859-1?Q?Pcb082sYuz4O8hEfZgb5d4z7MLhm8+BNaW8tosuy4uD6FcszM0s+fD8oVu?=
 =?iso-8859-1?Q?NzlMz9cdl17xmiq4HXcaZmpN2Ok1Kp/PZSXi4iYLQnCeY+1l/ci3XwaLGN?=
 =?iso-8859-1?Q?Xp2sGpGsb4gBbapwpnctxxF0uThLtr5/w1rr1oKO1L3zwsDKW9OIypojvC?=
 =?iso-8859-1?Q?l+HzqyZxXcfvMn8WzyxNDv4YFSvaRc7Uu+hO7xONBpo2q2vrMPRYUmdhqW?=
 =?iso-8859-1?Q?prneGouCCCDePnmKELPXMbBJPIjeJdukKpy7aqRENbWiHQ1nmOLhti2wD3?=
 =?iso-8859-1?Q?9qmGnVNU9xHekX/0GILXCaLlsGRUNHDV4NVEYksVVtDR4MMHLV30A6SeDt?=
 =?iso-8859-1?Q?jIZjNG5cE1VVCHviaebHcjfnMeSTuW9rSES0I7Mev+X7vZFKYPgywihUTi?=
 =?iso-8859-1?Q?anuINbhjFk8dNd1QOfNYw1AC6k+8trhr7whYIRwotOMT0GkqY2O1SFayCu?=
 =?iso-8859-1?Q?tng4qpTd/oghlXLezl4kMGhyWEwfuRrZNpkOXZd3a8Au464rljsP+bgkCm?=
 =?iso-8859-1?Q?7bQiMS2SWGKuONsbc4ydkwELzA4P6aDTfwbdCjO8xFPCv4qkoexGaDij0N?=
 =?iso-8859-1?Q?r3aWKaE4PnIf/LV73YwXenYmYgAkQyOsjCN37N0Dof8tf7T1bMj4Skgndx?=
 =?iso-8859-1?Q?p60DmGyeod7LFDYziBwk3DKew1lIdsXpMg9n0vxWLvAgbCBe4HqD76xLcO?=
 =?iso-8859-1?Q?NkWxX89oMWFu3UJr4kpxbp3o1kcxTk7vJx785je7JNyBYlRwM5HKJyNU/R?=
 =?iso-8859-1?Q?OsC8OHHHhQDPaNUIy7fRSiQTsYwDs9kiTHgqe2qspKR9v90oFxCzDyfSIC?=
 =?iso-8859-1?Q?Icl9/SZstqU1WdGE88B/bphXoU/ludDi4Q0xmTeFJ9CfNndQpKRRNKp040?=
 =?iso-8859-1?Q?DQDSyKDEDlZX1Sax7gTj1QD1+tap+Y2QB+9E568MypxNm+MF5Cp066AD2t?=
 =?iso-8859-1?Q?nnxGgTHRREvVS+AZkJafVmA9ovb3MpRnmJbT9IfIM78X9gVh6OxDfOrKSt?=
 =?iso-8859-1?Q?D1ikglUcStRI9Fy/53xk0hfmDoAX5pSq8xOf66ymQ5tcWyjt7QxRw2igdb?=
 =?iso-8859-1?Q?Le4SXNL5TMe71KgsU1xBTCTv+5IeLXi6M3srZCZdpIm9szE5GWQQ7/4C+y?=
 =?iso-8859-1?Q?V5Uep8YaJQf2tLT/Js2CLyYub301YzJdnwdKgZzFzg5crVGQZp/PoIAVhW?=
 =?iso-8859-1?Q?GsaItB8muUtuqJMheMCIhSa17Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Leaq94bgC1eOEP2tXIoDD+FRF6JdCVXGzx/Xdpw6xX+H7i+V0kn43b2IaJ?=
 =?iso-8859-1?Q?1BrwB2LWBE9ioBauFx4nexHmTvFPGi9KyaiR5cnXw/yFBLDASeoqPVt5ZH?=
 =?iso-8859-1?Q?XzMc8LV4gMIK3Rl35AX3KW2w6unkoRvZbsL3eD0jIER5gioXvGOPmspLXV?=
 =?iso-8859-1?Q?WriRfNSMp5eRmDfS7s/RBg3gpa+Q7FldCQlOdFq662El5qDdYI9+qhFNxR?=
 =?iso-8859-1?Q?6TlgBnHh4G454GLfdaEa7kahEOoIJNQo/arKZVYC4pt8Jne39cyVvvjxG+?=
 =?iso-8859-1?Q?3cHMh9PbpA+bzlP+RQK3KIJGOMDK2gWcPlSQ+oqmOoehZo2jkxQr9geNn9?=
 =?iso-8859-1?Q?CGNE8s/Z+9yyxNyl0wdo8j7sDHH9T1US9+3zVZs7r9GuPc0A9nN4cZYg7t?=
 =?iso-8859-1?Q?nLd99foItSKNOxVXFNOUe26DE5pRuUhC3YH3Pav8Mq/U9qgbj+18yjb0m9?=
 =?iso-8859-1?Q?aNSvVPY2sCvQseIOmklei6LZ9CuTX4OcaiBpatgEqZ8J8P2U8vs01074In?=
 =?iso-8859-1?Q?CTzJnxsjhUV8MZvdAOZPR8vMyb0OtRxxAdgfS5w+C97Y8lvm4TtfLL6gvY?=
 =?iso-8859-1?Q?wO3jS2tDvFOfNpC4qLQzFdqk6SuKC1D8R5NEMipbtGcUGa0mRcQqWsFwcj?=
 =?iso-8859-1?Q?111PgtcrfiKI0BRlg0pCri66UBk/oRkbVEbzthOMZ1q59GStxBqd0Tyy+p?=
 =?iso-8859-1?Q?p0a3/H++7eZMD2V98nSKLbEETCj45V/i2OvabGlyRDfaKB5fMAeiVzVtCm?=
 =?iso-8859-1?Q?qexkWYmeGcmpNmj9BN5XmyDOwC5j666W2sV5EbmREK0+JV+SiNK769zGFd?=
 =?iso-8859-1?Q?wAZSDO984N5o6BcuS3yu02qljZ3IU/oCo9epjouH8zdvt2VLTEsaMOIly5?=
 =?iso-8859-1?Q?gWnyjVr1YXmtk/GR41J+5ZxeiFis9a5EohCKV5B6HS0jFMR/PRU0+hjPa7?=
 =?iso-8859-1?Q?ZjlIQ1o7ejvqu4IEYro8hrSaI9hswTSQBNWHKtwHScSsdYrWSlM5KQzY/j?=
 =?iso-8859-1?Q?q5JBWQ1ETG5p9iC6WOD5+4KRh97V/XancR8ktVha+GaV+BpDrKbrZPvDld?=
 =?iso-8859-1?Q?Kt3RpKU97+ZrvA7MB8FPduqnSrQje2q2FMOeF0obxRGtBZIKqF4aBkGLxU?=
 =?iso-8859-1?Q?5kSEIf+UNY3la+L9sFvOlmn8a+6G+Lkoh+MZaqc2IZnLZ2U7g4RYgBfNiC?=
 =?iso-8859-1?Q?NMmJwVFycbgGIQHBnpR8Zbc/kOrjESwD1213FA+zY47Cs4XVc7T0/lf7XM?=
 =?iso-8859-1?Q?fz2Gd8IqlzslNyVAZVXai+zZF15D+pP+OnOBY6gxKywj+5CQvlnEqEozIQ?=
 =?iso-8859-1?Q?km+wcafCoITmkEhOK3RRX44Oo6q99HPscUXs46+GHuxXL0QGf0WezBmrSm?=
 =?iso-8859-1?Q?ewa4Mkznm5Oe3DOGc5s/DV8DpWaP800KZCddniKDRdzhjZeB8J8im2Rcre?=
 =?iso-8859-1?Q?+BBW1UrgXaf+ZiulYJ/khb00FcrEbfGvSQDC4jib6Io6Hy+tCiRYNUnDF0?=
 =?iso-8859-1?Q?RKyl1n1WM7aDyd3N24ExRPZTdePTJoM1jfXVyNXkXGISUs+6xyMipkc6ye?=
 =?iso-8859-1?Q?hrmp3mxQ7CQ1B/adPgtukTwUdJQXOoPjIVjBAy3vWvqEbVbxAQgKkE3mCc?=
 =?iso-8859-1?Q?rkwjCbGpqyTkg+3ntrkLLBb0ONqLxv9h8DMqRSlvkTqZKuHLCYve70GA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b32a7f-efc5-4a6c-ffee-08dc751a359c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 20:04:21.3050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9DjY2U3oyyy6Y6J3h/58ZWCzKQZAD+I9CZsuwd6g6LsP0vFnDSdV9qL5bM3Djv1ALXkud0F96q3m7gBoHb7awJ6jQSKqtwJ1tQxUB7D92o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
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

On Wed, May 15, 2024 at 07:52:44PM GMT, Koby Elbaz wrote:
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
>
>Cc: Daniel Vetter <daniel@ffwll.ch>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Ofir Bitton <obitton@habana.ai>
>Cc: José Roberto de Souza <jose.souza@intel.com>
>Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
>---
>Changes in v9:
> - Fix checkpatch warnings
>
> drivers/gpu/drm/xe/xe_debugfs.c      | 169 ++++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_debugfs_mmio.h |  43 +++++++
> 2 files changed, 211 insertions(+), 1 deletion(-)
> create mode 100644 drivers/gpu/drm/xe/xe_debugfs_mmio.h
>
>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>index 1011e5d281fa..ff99f5466931 100644
>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>@@ -7,7 +7,7 @@
>
> #include <linux/debugfs.h>
> #include <linux/string_helpers.h>
>-
>+#include <linux/security.h>
> #include <drm/drm_debugfs.h>
>
> #include "xe_bo.h"
>@@ -19,6 +19,8 @@
> #include "xe_pm.h"
> #include "xe_sriov.h"
> #include "xe_step.h"
>+#include "xe_debugfs_mmio.h"
>+#include "xe_mmio.h"
>
> #ifdef CONFIG_DRM_XE_DEBUG
> #include "xe_bo_evict.h"
>@@ -115,6 +117,164 @@ static int forcewake_release(struct inode *inode, struct file *file)
> 	return 0;
> }
>
>+static int get_tile_id_of_mmio_addr(struct xe_device *xe, u32 mmio_addr, u8 *tile_id)
>+{
>+	/* MMIO space size is identical for all tiles so arbitrarily choose root tile */
>+	struct xe_tile *tile = xe_device_get_root_tile(xe);
>+	u32 tile_mmio_base_addr = 0;
>+	u8 id;
>+
>+	if (mmio_addr >= (tile->mmio.size * xe->info.tile_count))
>+		return -EINVAL;
>+
>+	for_each_tile(tile, xe, id) {
>+		tile_mmio_base_addr = id * tile->mmio.size;
>+		/* Each tile has a 16M MMIO space, but the contained CFG space is only 4M */
>+		if (mmio_addr >= tile_mmio_base_addr && mmio_addr < (tile_mmio_base_addr + SZ_4M)) {
>+			*tile_id = id;
>+			return 0;
>+		}
>+	}
>+
>+	return -EINVAL;
>+}
>+
>+static int assign_mmio_args_to_xe_reg(struct xe_device *xe, struct xe_debugfs_mmio_ioctl_data *args,
>+				      struct xe_reg *reg, u8 *tile_id)
>+{
>+	unsigned int mmio_bits_flag, bytes;
>+	u32 mmio_offset_in_tile;
>+	struct xe_gt *gt;
>+	u8 local_tile_id;
>+	int ret;
>+
>+	mmio_bits_flag = args->flags & XE_DEBUGFS_MMIO_BITS_MASK;
>+	bytes = 1 << mmio_bits_flag;

looks like you are using the value of the flag to calculate the number
of bytes, is that right?

>+
>+	ret = get_tile_id_of_mmio_addr(xe, args->addr, &local_tile_id);
>+	if (ret)
>+		return ret;
>+
>+	gt = xe_device_get_gt(xe, local_tile_id);

is there some confusion going on here between tile and gt?
xe_device_get_gt() is supposed to get the gt id, not the tile id.  this
would fail for e.g. when trying to read something from media gt in MTL.


>+	mmio_offset_in_tile = args->addr - local_tile_id * SZ_16M;
>+
>+	/*
>+	 * TODO: migrate to xe_gt_mcr to lookup the mmio range and handle
>+	 * multicast registers. Steering would need uapi extension.
>+	 */
>+	*reg = XE_REG(mmio_offset_in_tile);

This basically kills any usefulness of this entire patch. It's already a
stretch to require usable driver to read a register, which can already
be done by mapping the BAR like done by intel_reg.

The only meaninful thing here is that it uses the driver's steering
knowledge to steer register accesses, whic is not supported here.

>+
>+	if (XE_IOCTL_DBG(xe, reg->addr + bytes > gt_to_tile(gt)->mmio.size))
>+		return -EINVAL;
>+
>+	*tile_id = local_tile_id;
>+
>+	return 0;
>+}
>+
>+static int _xe_debugfs_mmio_ioctl(struct xe_device *xe, struct xe_debugfs_mmio_ioctl_data *args)
>+{
>+	struct xe_reg reg;
>+	struct xe_gt *gt;
>+	u8 tile_id, id;
>+	int ret;
>+
>+	if (XE_IOCTL_DBG(xe, args->extensions) ||
>+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>+		return -EINVAL;
>+
>+	if (XE_IOCTL_DBG(xe, args->flags & ~XE_DEBUGFS_MMIO_VALID_FLAGS))
>+		return -EINVAL;
>+
>+	if (XE_IOCTL_DBG(xe, !(args->flags & XE_DEBUGFS_MMIO_WRITE) && args->value))
>+		return -EINVAL;
>+
>+	xe_pm_runtime_get_noresume(xe);
>+	for_each_gt(gt, xe, id)
>+		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));

we are trying to get rid of the XE_WARN_ON. Please use the gt variant.

>+
>+	ret = assign_mmio_args_to_xe_reg(xe, args, &reg, &tile_id);
>+	if (ret)
>+		goto exit;
>+
>+	gt = xe_device_get_gt(xe, tile_id);
>+
>+	if (args->flags & XE_DEBUGFS_MMIO_WRITE) {
>+		switch (args->flags & XE_DEBUGFS_MMIO_BITS_MASK) {
>+		case XE_DEBUGFS_MMIO_32BIT:
>+			if (XE_IOCTL_DBG(xe, args->value > U32_MAX)) {
>+				ret = -EINVAL;
>+				goto exit;
>+			}
>+			xe_mmio_write32(gt, reg, args->value);

I'm not sure how this is going to work. xe_mmio_write32() adds the GTI
offset, but it looks like the desire here would be to pass with the GTI
offset already encoded (since assign_mmio_args_to_xe_reg() tries to
convert the raw address back to tile / gt).

>+			break;
>+		default:
>+			drm_dbg(&xe->drm, "Invalid MMIO bit size");
>+			fallthrough;
>+		case XE_DEBUGFS_MMIO_8BIT: /* TODO */
>+		case XE_DEBUGFS_MMIO_16BIT: /* TODO */

it's not suppored for neither read or write so it would be better just
to not support it.

>+			ret = -EOPNOTSUPP;
>+			goto exit;
>+		}
>+	}
>+
>+	if (args->flags & XE_DEBUGFS_MMIO_READ) {
>+		switch (args->flags & XE_DEBUGFS_MMIO_BITS_MASK) {
>+		case XE_DEBUGFS_MMIO_32BIT:
>+			args->value = xe_mmio_read32(gt, reg);
>+			break;
>+		case XE_DEBUGFS_MMIO_64BIT:
>+			args->value = xe_mmio_read64_2x32(gt, reg);
>+			break;
>+		default:
>+			drm_dbg(&xe->drm, "Invalid MMIO bit size");
>+			fallthrough;
>+		case XE_DEBUGFS_MMIO_8BIT: /* TODO */
>+		case XE_DEBUGFS_MMIO_16BIT: /* TODO */
>+			ret = -EOPNOTSUPP;
>+		}
>+	}
>+
>+exit:
>+	for_each_gt(gt, xe, id)
>+		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>+
>+	xe_pm_runtime_put(xe);
>+
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
> static const struct file_operations forcewake_all_fops = {
> 	.owner = THIS_MODULE,
> 	.open = forcewake_open,
>@@ -173,6 +333,11 @@ static const struct file_operations wedged_mode_fops = {
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
>@@ -214,6 +379,8 @@ void xe_debugfs_register(struct xe_device *xe)
> 	for_each_gt(gt, xe, id)
> 		xe_gt_debugfs_register(gt);
>
>+	debugfs_create_file("mmio", 0644, root, xe, &mmio_fops);
>+
> #ifdef CONFIG_FAULT_INJECTION
> 	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_debugfs_mmio.h b/drivers/gpu/drm/xe/xe_debugfs_mmio.h
>new file mode 100644
>index 000000000000..1dfb8fa2ce9a
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_debugfs_mmio.h

How is userspace going to know about the values?
Even if it's debugfs, we need some way to communicate the values the
kernel expects. Not sure if it fits include/uapi/ though. Are there
other use cases in the kernel to follow along?

>@@ -0,0 +1,43 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_DEBUGFS_MMIO_H_
>+#define _XE_DEBUGFS_MMIO_H_
>+
>+#include <drm/drm.h>

what is this for? Apparently you want asm/ioctl.h rather than this.

>+
>+#define XE_DEBUGFS_MMIO_8BIT		0x0
>+#define XE_DEBUGFS_MMIO_16BIT		0x1

as said above, just don't expose things you don't support.

>+#define XE_DEBUGFS_MMIO_32BIT		0x2
>+#define XE_DEBUGFS_MMIO_64BIT		0x3
>+#define XE_DEBUGFS_MMIO_BITS_MASK	0x3
>+#define XE_DEBUGFS_MMIO_READ		0x4
>+#define XE_DEBUGFS_MMIO_WRITE		0x8
>+
>+#define XE_DEBUGFS_MMIO_VALID_FLAGS (\

		^ this can't be in the header if it goes to uapi

>+	XE_DEBUGFS_MMIO_BITS_MASK |\
>+	XE_DEBUGFS_MMIO_READ |\
>+	XE_DEBUGFS_MMIO_WRITE)
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
>+#endif /* _XE_DEBUGFS_MMIO_H_ */

	   ^ no need for this as it often gets out of sync with the
	   guard above


I'm not very confident this works as is. I think one possibility is to
implement the MCR missing above and implement this backend in intel_reg.
Then you can prove it works and show it's worth it.

Currently intel_reg has a few backends like mapping the BAR, or
submitting a batch and reading/writing from the GPU side. Adding another
one to be "via driver's debugfs" would probably be ok. +Jani as
intel_reg's original author.

Lucas De Marchi

>-- 
>2.34.1
>
