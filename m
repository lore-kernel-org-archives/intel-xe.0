Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87269C83F03
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 20:01:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1894210E1CC;
	Thu,  3 Jul 2025 20:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvKNBtpU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C205F10E1CC
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 20:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751572867; x=1783108867;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+CBA4SMj14U+AdbRf60sSU12j+aTu5Ck0bk6Rm4YBNY=;
 b=SvKNBtpUvF/4hqVdXPgSeQvDoTLQms3q66dJMk1MxwGnahefPOTaxdtG
 xZkZc7q9CWY8ECtI2dFa9K2FmqPjTjkmhgsBUfYVsa8NsYFF3Kj9msZPf
 wC3vQifYr6+dLce8oshxPRQgZvPA33yYXycBRhUl+aMWZGcXOENSEB/X9
 iLCXRFvhKpsGmvIZKxhD801k2/cJ3ng4GyE0PEJHHv4JPhnXPoIyqBaF8
 hMNsrLpxaz7NcF7FuTS8xithdH2ZsBle3I+6o5ia6zz78HpC90zmCsGac
 QtvLl6NwCC0CPc6u6Fdypeh+F3wsiJQnk3Ix7XmTeT/rxkgY3yc459D+K g==;
X-CSE-ConnectionGUID: fDpeT/ntRCmlFFjSAVt8bg==
X-CSE-MsgGUID: HbTMDTSrTp6usA8yZLAnuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53781958"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="53781958"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 13:01:07 -0700
X-CSE-ConnectionGUID: evtRjZ83TBGrvQAA1as5Jg==
X-CSE-MsgGUID: ybX6PJ8XQWqjE1EpwJaQRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="155210437"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 13:01:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 13:01:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 13:01:06 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.43)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 13:01:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFC5XkDmcGELeXRx86GX7XtE9944T/prh3mnrYpjVaXQy9VkOmNbd9dsoznXNp+fBupuCtfD6pArO1AePnYmcL/bpxx2uMSBEHPz/+u4D7/cg485EMaZiZUW5ioLQzOXeoGrj82l2iyTPOU9a1NxfQjKatPFH9eSnYk8BYoC2lVpCFqknrGTu9SSSNWcJ62SMD2/VNyEMluuegkviX7CM+/O1Cd6yywbOaySGERbX/7tW4UsT+nhaXzkC/2uE3oEoIQuQVtmFFPOm+9iw3KXMDJ9ns76t9xm5iYFmwYAneWxZSxlUwgkW20w3j/sfE3oox8t8itZS9K0wCbPPjyRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWS5HOzVaPGur5xydKNqZ08K/JQ9h+hT5fl888WPJNk=;
 b=GCoE37HVFiRbtfnUjny6qAEvU9b5qV6j79ezmFymQH2VbwGf1KO0LCOxEtYuYkfxX/1V08e8ivBZTSPDlsKZA2htBvS3C36vX/0QXT0Lf/CrkIQouPr4kgKLyJTSZx+i0Q0t7DzsUZVdhBInYk6YI0AwthrUMGLmkLrcJKLWIIy2I/K0IV+/KUAsQXD4Nu3KJ1Ycg9a92/kb4sjEen+AJONKTG9dawxB4QS/V/KddjBxeoGGo0LCaHCmCkE77E3mTuS6QMNlWQWbLXsTT/aLNJKXBbsTtmDKOz56XOkiQeT1qH0h3xtKfMUMT1c77hrOEBrqlV2Q3OcRgngmVJjOlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.36; Thu, 3 Jul
 2025 20:01:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 3 Jul 2025
 20:01:02 +0000
Date: Thu, 3 Jul 2025 15:01:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5 1/6] drm/xe: add xe_device_wa infrastructure
Message-ID: <2k3fupejzysc2ir2dm667pljlupb6yc4kihurgmvnkpq5lzxwk@dbsjy7rpwoiv>
References: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
 <20250702193036.1417416-2-matthew.s.atwood@intel.com>
 <svdso2kdn3bgu5gu43lbwj7bnzqd6hsbqzmbxpuydvqocvwjan@pj4pyj36kir4>
 <aGWuD5F4Vqmj7MJc@msatwood-mobl>
 <jivjtyt3j2mxmwvbnrdvvz4d366tqffuv2jh27wtlptfnyhopv@xbyjg2lr53xk>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <jivjtyt3j2mxmwvbnrdvvz4d366tqffuv2jh27wtlptfnyhopv@xbyjg2lr53xk>
X-ClientProxiedBy: SJ0PR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:a03:332::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5190:EE_
X-MS-Office365-Filtering-Correlation-Id: 388fa8c2-fd61-46ce-49c7-08ddba6c5664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?chl6EQf37QXi4bOV0gt80PpMUDyXlhoOwoWxsQyDeZCfxouaGV/fo6rkgf7h?=
 =?us-ascii?Q?LjgQZq9JKTu5NEwFmTQMR43g/DNa8GO06LRpaIzZs54MZRLjMiYq5kwwYW41?=
 =?us-ascii?Q?J6T/6z07bdzPwQ/96c0rjyJF4S0dapOqU+fK0z19L2nHdUq3emSee0iyiCj5?=
 =?us-ascii?Q?HfRRvt5C3LUcfh6H4DJf5HVP4veuxivaMBcnksuEtWoQTPpdLKt6YpI4g/xD?=
 =?us-ascii?Q?kBx9E2tKDa0NS/SYmUxIqmy8iMLcnw3Swe3gv6VxwviMpPPJPuAIm49LZltp?=
 =?us-ascii?Q?sgm8+pr3OHvio+2sKMgbmPkVtCK5cx/DLcMjzEf1OUlKAdHa2GFPTnIkC7hh?=
 =?us-ascii?Q?7cF9rtCoTSLjl2yeZ7AqCiICMYE9h8zCwRJDMvHfaPafxdZ+USC/25Cd/ywZ?=
 =?us-ascii?Q?9Gshh2aT+6vJEtBeLOs7dzIykN34Vmpm/f+Re9Sl1ES3Qon35wvpavAtTWbD?=
 =?us-ascii?Q?7ZrYiwltPtJR0ARlo1xTnxfFKQE4pvz1haOx6bUGkOWgtnct9e02bWDQRBhR?=
 =?us-ascii?Q?oQaivk3vm4f+7xRB033yt8q/dUgwcI0x7Kff4xUd6EIIeQq2urbA/5t2vb3R?=
 =?us-ascii?Q?9PEEfuTOsMzah/e7Z1b7QKzof27IylL8zTEPzCJwHRGHvx7XBabMEYk+BCE/?=
 =?us-ascii?Q?4aRjdTjTzdSGQL+3+gfP/E4UBPgASEHyiQ5B7nFA3lCJ1ozZU5q4x4koicoU?=
 =?us-ascii?Q?+5s7sHAsizNBAqNXPbGuYQeQxExhreTZlsPA3T8Q28Q0ygkTYaFiuRZIaUG6?=
 =?us-ascii?Q?uamOpQCVpEZ7Zh2faFDLqpUuyT3tzsgSZYKKp7tO6I5WgExfksSGxzHHPJaR?=
 =?us-ascii?Q?1LF2C2MTI0Sol8aY0ACGotA+zZHtuc0ODN4b5Hs3JwJTD/IwWDjaBNtPuWjM?=
 =?us-ascii?Q?UDQ3a8uQ2apPI0vLkBcQVfn87Gdf8k0uPKiZ7w8gTUOc568F7mbLcr1OONX3?=
 =?us-ascii?Q?BBPSbGnUirLknw0LAqy5ImfJ34ErqZzBCRsdpv2IqNCio7fnLzbfSq9lmi6V?=
 =?us-ascii?Q?NVLUfIkg0wdj0/MIXROQvEuLoSqMPv5uqEb9RUTAwp9E4a3LlQngkrEe2Z9q?=
 =?us-ascii?Q?QGeOPg8LHNNg3Ev9qH5Si9PkCM9x+9K0kFotBdaZfqMUEENTAIDRHRQPgdM1?=
 =?us-ascii?Q?qGr6Ms5eoJgr26AMO6ywCZaGmvUrFkf8T7/WFDId+gRwVMPkU84dn92bJsH1?=
 =?us-ascii?Q?jDm+E+v2WzFCIEomofxf2lyqUuOblzNp+fNVy+It2+yhgSn+1UhBnM1U5mry?=
 =?us-ascii?Q?dY609yBOJV/n4+0iNCcOOcRdR9RCd5krA7dayjWLBm2i+FAnNBf4LfauY+lM?=
 =?us-ascii?Q?l1Ngyk8bwoNNnrLdhfxxBg2nMkb/X6j9GuN6DEK16opDpp6Fe2MJorbr34ei?=
 =?us-ascii?Q?DC+W3W5Nc3E/dFxKBGfWg78OhG4WijSDT72Jg5LzOgQGmhOqA5STENBSGa4D?=
 =?us-ascii?Q?PYzGPFTz+j4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wuG3bXldLnedh2pZUsKzxlRwxNKmcIN1jPpqvUn4tMdv28FYu+QDx7knX1zg?=
 =?us-ascii?Q?FZYERmDkWWZIo163s2X+bdPl0CSIvKtwla2AzC3tJp1cl3KA+TCzAay6kclp?=
 =?us-ascii?Q?V4ymb/SrrVYAfooZmg4kjt+oP9jbz8LeLn6ubNjH5IKSixHy7wf4a46a5wYD?=
 =?us-ascii?Q?d0C/zbn5s2gYnV0b6huOcfOJk7y6UPjPLPP2CvyTbplk6MqzEpchlNgH2rTh?=
 =?us-ascii?Q?D+/nnctQzIFTBGrCIp77vejSR97qa3pUSTkNgXeLN1+pB04KNwR5Zq1UL2rN?=
 =?us-ascii?Q?Chm6VXshW4S6dZHBDXRu2EUx+lYJMNrSVgEzIlYQ1ToRnYr7vVy0qa/lDZbJ?=
 =?us-ascii?Q?xK5SKuGBPDU/FsQOC3k8hOFarAJBLfWEXMdnp4WKwl7ohg0B6UU4P06WqEEn?=
 =?us-ascii?Q?h+XmNOerZ73oAZwg8X5JoItGhUeDVpoteRw1L5RAJiTl1VuDuqU4Yx2XYLUc?=
 =?us-ascii?Q?GyYXgwxuMGZQLXSIH0Fwfm3PyM/o85pKuBXhgVyhM7xDq9WpmKqrng2wuvwj?=
 =?us-ascii?Q?LNhJBD4cCHl1wDVya1ofTlYZfd5Qyb1VEdKnTpemKiAAFDs2M+wrRZ0324LV?=
 =?us-ascii?Q?Oz6HMEjhD6U5XfJ66r8DZQJkdcShHz3bKfR6s4VxEBLYVwxUGV2MLEEXvshO?=
 =?us-ascii?Q?X3bb5QQcrqzby4GgaUvVDgsJ4RY/Y9uIC+5GsUWqEUf1miOmtT0UHeoB8TXK?=
 =?us-ascii?Q?n+UDe/wzF3Ky2CLudQhJRhhlrng1zPcDf1jQb/+9H+pRugQEYLe6qynuE+lt?=
 =?us-ascii?Q?nSuGbSOx7fCJrU4YZr+JHH3Yep5YsNy6zNh0ILbFL223VgFdFqFDaw+msixC?=
 =?us-ascii?Q?05q65otQ8m0oNgSPJ0ACkEdTOfjDqtNZukv+GfuvKevoKpWYCmoXrZ3/wp3e?=
 =?us-ascii?Q?Jx7aieQZCmuCawsxU9KBSRYi4YBM5HMPSLm9WIxDrf/l/knrGZXMFpaK21UC?=
 =?us-ascii?Q?0xP0bolGR/2l390shqe9X3eh2NLptQmCefcBTwnF1wzLy3bJP53DsDVPDHDK?=
 =?us-ascii?Q?zOesPRztL/E2ZieTvRafTDURTw3z0WQwBJANygjxNQaBvA3XrzkrwRiyANCo?=
 =?us-ascii?Q?pxUVTJSY99X3IxZi2KABNeTHzmRjNlzWAiMZBfQ0clsCCjJHNnxePPeXMzDQ?=
 =?us-ascii?Q?bRZuUrVDqLwAth54p8y31rCs6JDLE0f2WXfJovVyqQVOlnAZxnx/1z3WczxI?=
 =?us-ascii?Q?eowlzoIPdDCyntdxK10gMkwM2Yp1ayrewLH4MIMQxnaQSFhgvR9b4xL5ITaQ?=
 =?us-ascii?Q?oMY8M72r6bGM4b47hFNr9g7MKtffpICA95hzEznu1I/uoGz6FlgC8nmYVwP6?=
 =?us-ascii?Q?0EHm9tIp4fxiopQiDtV+GRxU2YEYhbnOKQHl2K3PoIQIyWRWGE0+kzlIH6yD?=
 =?us-ascii?Q?8uup+l+mGIOjWcwLKWbp4hg4RVxcs6UkyfXeIJHflgDnjQMJuzKz4ZGaMHLY?=
 =?us-ascii?Q?b7lRodKNuBwVz+29cCk96mXSFapNONMBIZZ8sH0Ezbdm260Whd4cbOWg6PkN?=
 =?us-ascii?Q?QmfJSYIJzBvjIx45R513l7M+w0eKIQtdAhK/Y/h4gIEVc5GGWJKXYwTLQurS?=
 =?us-ascii?Q?NOrf7kJFJRluPZ/o1s+aD5PuEyHGR3qHMR6VuYROd+OQXn3Og6c0BBeA8Vqi?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 388fa8c2-fd61-46ce-49c7-08ddba6c5664
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 20:01:02.7409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1GL2OUxcC9F7RG7TOIFCkObQ1nq3ZnBM/C1gDFILU77cGnkJVNd7oGGYd5/aRbGimddSRKiRBjPDDLBoEt7GGG4msa53/nbutTkyQ+kka4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
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

On Wed, Jul 02, 2025 at 05:23:03PM -0500, Lucas De Marchi wrote:
>On Wed, Jul 02, 2025 at 03:09:19PM -0700, Matt Atwood wrote:
>>On Wed, Jul 02, 2025 at 04:57:34PM -0500, Lucas De Marchi wrote:
>>>On Wed, Jul 02, 2025 at 12:30:31PM -0700, Matt Atwood wrote:
>>>> There are some workarounds that must be applied before gt init,
>>>> wa_150154044425 for example. Instead of sprinkling them conditionally
>>>> throughout the driver as we did for i915 generate an oob.rules file
>>>> reusing the RTP infrastructure to make these easier to track.
>>>>
>>>> v2: rename xe_soc_wa to xe_device_wa
>>>> v5: derive prefix from argument rather then hard coding the values.
>>>>
>>>> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/Makefile               | 11 ++++++-
>>>> drivers/gpu/drm/xe/xe_device_wa_oob.rules |  0
>>>> drivers/gpu/drm/xe/xe_gen_wa_oob.c        | 38 ++++++++++++++++++-----
>>>> 3 files changed, 41 insertions(+), 8 deletions(-)
>>>> create mode 100644 drivers/gpu/drm/xe/xe_device_wa_oob.rules
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>> index 1d97e5b63f4e..48d4aa9d4ecc 100644
>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>> @@ -21,6 +21,15 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>>>> 		 $(src)/xe_wa_oob.rules
>>>> 	$(call cmd,wa_oob)
>>>>
>>>> +generated_device_oob := $(obj)/generated/xe_device_wa_oob.c $(obj)/generated/xe_device_wa_oob.h
>>>> +quiet_cmd_device_wa_oob = GEN     $(notdir $(generated_device_oob))
>>>> +      cmd_device_wa_oob = mkdir -p $(@D); $^ $(generated_device_oob)
>>>> +$(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe_gen_wa_oob \
>>>> +		 $(src)/xe_device_wa_oob.rules
>>>> +	$(call cmd,device_wa_oob)
>>>> +
>>>> +
>>>> +
>>>
>>>drop these several newlines.
>>Ack
>>>
>>>> # Please keep these build lists sorted!
>>>>
>>>> # core driver code
>>>> @@ -340,4 +349,4 @@ $(obj)/%.hdrtest: $(src)/%.h FORCE
>>>> 	$(call if_changed_dep,hdrtest)
>>>>
>>>> uses_generated_oob := $(addprefix $(obj)/, $(xe-y))
>>>> -$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h
>>>> +$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h $(obj)/generated/xe_device_wa_oob.h
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>>>> new file mode 100644
>>>> index 000000000000..e69de29bb2d1
>>>> diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>>>> index ed9183599e31..341840926f60 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>>>
>>>All the changes in this files should be a prep commit: they can be done
>>>regardless of having device_wa_oob
>>So split out the make file change in addition? or move the makefile
>>changes to the following commit?
>
>the change in the Makefile is only for adding the device_wa, so should
>be in the second commit.
>
>>>did you find any issue with strlcpy? I think it's available on all
>>>toolchains, but maybe we need the workaround by including tools/include/linux/string.h
>>>I tried the diff above locally and it worked for me though.
>>strlcpy isnt currently supported in the distribution recommended for
>
>did you check tools/include/linux/string.h I mentioned? How does perf
>use it since forever and it moved to a common location in 2015? yes, it
>may be that we will need to link string.o to get the weak symbol it
>defines.

so... to answer it myself: it's easy to link tools/lib/string.o for things in tools/.
Not as easy for hostprogs that are needed to generate kernel source.

To keep it simple and not need strlcpy(), let's just do this then:

diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
index 341840926f602..6581cb0f0e590 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -125,9 +125,16 @@ static int parse(FILE *input, FILE *csource, FILE *cheader, char *prefix)
  
  static int fn_to_prefix(const char *fn, char *prefix, size_t size)
  {
-       if (!strncpy(prefix, fn, size - 1))
+       size_t len;
+
+       fn = basename(fn);
+       len = strlen(fn);
+
+       if (len > size - 1)
                 return -ENAMETOOLONG;
  
+       memcpy(prefix, fn, len + 1);
+
         for (char *p = prefix; *p; p++) {
                 switch (*p) {
                 case '.':
@@ -168,7 +175,7 @@ int main(int argc, const char *argv[])
                 return 1;
         }
  
-       if (fn_to_prefix(basename(args[ARGS_CHEADER].fn), prefix, sizeof(prefix)) < 0)
+       if (fn_to_prefix(args[ARGS_CHEADER].fn, prefix, sizeof(prefix)) < 0)
                 return 1;
  
         for (int i = 0; i < _ARGS_COUNT; i++) {

It fixes the bugs, doesn't depend on strlcpy() and doesn't use the
horrible strncpy().

Lucas De Marchi
