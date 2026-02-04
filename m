Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E95FEA7942
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 19:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6069910E1B2;
	Wed,  4 Feb 2026 19:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLPK1Hhc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B116010E1B2
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 19:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770232710; x=1801768710;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aSK76ESl3O5NtvJwptYFdTzEGuVmvDF47WYu6Ui9cnE=;
 b=gLPK1HhcXsx+d9nyv2GY68SZBrK9nnEVPEZIQT/QsKu/7kfOxNhIXfQ3
 nnCF/mkUCTDuU0R8KpPY0xaaEjKSyhDPRt3o0tkHmCL8LRFUqdHac8AWP
 AM9dxF+Cl9+jfn4BNnSkhw/gqp8pM9rwST6NFYLTJZRsl8yc8tVN6Ayom
 wZf69YkRRToT4igsweqZyoV8asVLwUsBVm1JiAiOZlMACLeG6RjFUJtnR
 /n3THzs+kHFunV/zj+ExmM7mgn6NTOC7aWnBL4Sj/aomsAKQ4WgwAq6le
 5iIKm15SiIwLAiFQPNYzPDqFGBvOkmfrWGzilEY60w9gaJaiAhLoZZrFj g==;
X-CSE-ConnectionGUID: DeWytbaqQYS36chLLrTebg==
X-CSE-MsgGUID: CiET5LpDT6Ks1R0xw9T+mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75046843"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="75046843"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 11:18:29 -0800
X-CSE-ConnectionGUID: mWd79ld2RNq+f5Mgez8Qvw==
X-CSE-MsgGUID: YTLEUwdARwCdljwxq8B03Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="214781515"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 11:18:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 11:18:28 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 11:18:28 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 11:18:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAjsqm10nkcxqgPpf8LGSydT34j2ktnN9s0uHO07/4i8vDqyRX7pMh1ZTBf1rQhRlGU7xWUCZpM0bpmUKws+AoruaNWhbZ4+fgMrM2pdjHXQuVFulcP1LvVI+NXwstkkwQqlXLTCG4tqLvz8ViBSJLp1sH7tp9Y25v4JtZAq4s7KpaogkKsDuWgfW/1JZiLoUtrIwDmaX+4+wxivTt3hU8NGocQiVxF8LndP0k5ghPdntldDNvl2K0AzJ5xgqVMkQhsTIDnbphceQl+4ZPESfwVDirTQJSuO3JD7fEiAhGug8YAuIrx8G6O0kPb/zqDZq5IEDgJQKv8ls0L4LKwmEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEp71ETwMGzeEgGrQ3zgnNsGuUIKdDdnKYwiJQDnnbc=;
 b=n+8QrUrEqG+QF8hrE4hQ6pVaSHdMRowkhokNMEwnnidDcPd5aZ3mvD7v8+4H7e1Sep2BnGbzFKP7iVH/3rEw+kwwyl2INoyXpGmdwjP/jCZBIamQuOZUHdQSsDzUeT17u10FI6idvSETNU5JXPryM3Zks9E5Hs8tfFszqzPuVgXa/xvhB4W9CihChqCAO29fG5VtlJW7dKG5MKWjXld8MNfMyOb7VpkbECQo21mqUS15gMjgO+90PJTC/m+eWTv0qpWkJoulirJ6ZR9eB9ovI8kScNAyKTwRB+szKEPaDomAMqGHdB5dXSt9bfccgbbuwxsbct7JYlEX6AmfjlNy6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB7470.namprd11.prod.outlook.com (2603:10b6:510:288::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 19:18:26 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%3]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 19:18:26 +0000
Date: Wed, 4 Feb 2026 11:18:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe/vf: Fix fs_reclaim warning with CCS
 save/restore BB allocation
Message-ID: <aYObfs0zLkmIZYHn@lstrano-desk.jf.intel.com>
References: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
 <20260204164642.3509298-8-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204164642.3509298-8-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR05CA0143.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::28) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2aa32a-58dd-4b17-80c6-08de64222baf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5alCx0Vlp5UoN8qbx99a8F0p59Uz9d5ULKg+LDlefOiIkhh6bqtiwMMnxv?=
 =?iso-8859-1?Q?ICXmYtwp5HIdqs9N6c9066XtnQObsrwA3JtHy/owXAjpojAZtgkcC+d7eU?=
 =?iso-8859-1?Q?hGF3XOjHajkCnmztqICR2Vu9SI2PIIVPA3oCIz5Pp7PQ/6WrUTAA2uQayn?=
 =?iso-8859-1?Q?kAakzJZoPjLEwuUojjYzx1lhBbJ7si0f5lL1ka1FSCzulz/Nwbx16+AvVk?=
 =?iso-8859-1?Q?SjbLDmv52QmMzD3mGiG+KFqMLUq+3h3hEFTRJzpB0pNHopYL48/s4tGYsp?=
 =?iso-8859-1?Q?dXb7eUkkoSBCUZXK3feudgoxgXb+e1qKg5vPPi8e6E/BIY6/4/IJdfRonT?=
 =?iso-8859-1?Q?+zYXll0Kqah6OwsqVUJHww5gutxfvVYDgi+3MdMkXzXbCou3glHa81pak0?=
 =?iso-8859-1?Q?FD0eYV1HJTCDKhMQByYYjoVGZ8ZYoFUch9mpO/6FVpAy3e0Sv1yF783L9I?=
 =?iso-8859-1?Q?+xTOQVrAdOfHgxbiT+i4HQWN6GgvYHRPFiRl6NBFEy1R9bgMuILbQa8bmG?=
 =?iso-8859-1?Q?0q9zF/56ZzKn5o0eZw1Cr0Opt3ai0Z8v1KXlnMiZRvZ35hxzgh+saI8JeX?=
 =?iso-8859-1?Q?kSKS5CZsn1PkHofEYSf12aOV5QdhF3bwaFl0fOD3DkWKB6JPMb2WzCNYcV?=
 =?iso-8859-1?Q?0AhjxtfaR4pN8h0+GHPVwNowKwTvlDrfu55JLQmh5Yt1/EwCXfFehlrZ/v?=
 =?iso-8859-1?Q?gURLrvoKhKfv496Cobc1W3qczflkkonxNUg4LTj59OpG67GxGUoruuzoBK?=
 =?iso-8859-1?Q?paFNkjs6k6pn7VxhdpwuhXPrVOazxZ0anCisCeg7n3M0FeBqYcrNWcEBeq?=
 =?iso-8859-1?Q?dKWrcMw3KqP3hcVvIwPptk1Rll74bM8jsSugwta77KRI6h5CGknMqzfgkH?=
 =?iso-8859-1?Q?Zp160ETYeBu3cdXEYE7Zi7yGuBo1VV7lT2B2fQGeGMWTVLag9sBuSEsAbx?=
 =?iso-8859-1?Q?dFNc77E2HFudJnTZKexZxIC6wmb53NQmF9mjHJ1ambzspx8yy86Ib00GIF?=
 =?iso-8859-1?Q?BS+h0zbKhGbPY9wcNRWjNJBVZFT+1Yll+VKt7Sd17E2plQbjCQiLDBNwp+?=
 =?iso-8859-1?Q?aJ2/+uCrUuxC9KK3AbrsjE4Uwpqv0SyCvCArU0/lBL0yBnF9XZAH+9G7jy?=
 =?iso-8859-1?Q?G44t4HVZ1Jb+wf8zPLHwoyLjGGAK1LgjkbEt2mJR3KggkV+feKXl0yYAbP?=
 =?iso-8859-1?Q?oJU6+G6Te3Fvsz3mwjpPIvzlDnNRJ2/S8+ZnaZ5KmZALSDLdTJ2BIh8oTV?=
 =?iso-8859-1?Q?xNshqXQQx5+pelJr4qxnnf7i1zFHrauDb2KF+Dt++3uGOFFMdTRc6X0CcQ?=
 =?iso-8859-1?Q?HItN1NntesEjdIFCqvdpUBjjV61ssdu4hf+q4PpzxNC0uybWuJ0N3g8UgP?=
 =?iso-8859-1?Q?TJn3ZQQpvNxi1VmmEt4n3sIknWufS8sK6EuwryhxMyLDZKByQXjmmQiuaW?=
 =?iso-8859-1?Q?Doo8L7P6K64dqNo1sAzN4I6lYJL01TlBU4vjEkM0TyyAXrPvn6ho5phLP0?=
 =?iso-8859-1?Q?Fc7T9G/LATAyq1N+9yuPYCe+MXwJtFqoLwOeEGvLBEIpC7HHva0nbgEVaM?=
 =?iso-8859-1?Q?XH0xw0ekqH6h3WEsmEPrByca0xuW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vZZ1YkYHzLZFiGGni0UzAFrxCseCJ85YF2uYwVJ/61fTceUhbPGHbp/zL1?=
 =?iso-8859-1?Q?bQSw0QvnoDaQfBhD6Y/rQrKfVSrE58iGy+zVk/4sAhZP8SvLJNbgBmHDuC?=
 =?iso-8859-1?Q?3irtg0P194InzAhD/nsjF7uoQu1fy1wmxn3dtYB2bLJA+KWPQaakB6gx5L?=
 =?iso-8859-1?Q?ovxkuSXAjkBYT0SE0ISFoAycS2iyRMJsEtE4xDKNxzUHlIDxgzObMwlI3e?=
 =?iso-8859-1?Q?fZDeAzrWMYQac97sadQXlw+FlxchOoPfeLedLcDTR+0tDGEaeIiKHEeJqo?=
 =?iso-8859-1?Q?o4QgZK5cmnRKD8Uj3U6wwhpZPWKfJ0IJlzGLpDQESt0Du5bmwLiDjTz0sd?=
 =?iso-8859-1?Q?dOKhStwbEjyRAPzb2hS14mbVJzCOYEwXdg8/pbZxx/d0jfhwPCWaB1+g9l?=
 =?iso-8859-1?Q?F5ud7BkIGaplwVGhWzIrxpimROU7ccIkXO31XpQ2ThAy76KI82E1NY5wsJ?=
 =?iso-8859-1?Q?ZQSk7PQGqBjcHXLBjmy59ulyCiuRiF+Xhhd1P3yQH0PdVRdsTjVFqZwJYc?=
 =?iso-8859-1?Q?7hAVJzCpuHl21a9tUqKba1j2636RxDbesYl81Qdg0ngZmJ3zNuO/cyjMWd?=
 =?iso-8859-1?Q?9Lea+idIlS11RTd0IEMUshXbKoKJxpZzcBQZP8iAwOy+NsIEskZx2vY8EV?=
 =?iso-8859-1?Q?XTSYZiMrrGl8yyVC2VSb2eId8R5iFmxRN6cDvBhHTw1n7QEQ4LLYR7F/uL?=
 =?iso-8859-1?Q?tgMYjsGfQWQkw+1KYxz0hAk/itqNMgMCt3s2jNntKHNxRmOjuR4jlIz2fO?=
 =?iso-8859-1?Q?g4KPSyBbUBfOPyrULd/kWVhHzvh8cTRMJS/MO/O2gBWIdpA7vjeEufGFzT?=
 =?iso-8859-1?Q?w3qBVAB85KQp2BkB3YxS8vQXEae9LsaT9cnpNBqrN14Th6RQqahJQNmg5N?=
 =?iso-8859-1?Q?hxAF4R7+T7uAGDqBdvSSVhIXYNuVVYcBsHzI5I63tfKXomyVbYvaoqk50x?=
 =?iso-8859-1?Q?WSLi8dEXDtcsiY3r2bXMS4hb0fQA9y3q7YqE3u3zmr4/P5js8KWUDXi7Mf?=
 =?iso-8859-1?Q?WpLh//nlsCG06XQB3ukqixjkAz1m/T7BhdH0TzLKIvHs/KWEC5FdY/UPJW?=
 =?iso-8859-1?Q?TcrGN9cQw6DkIbp+uaqLET6lN0d9hf7UTCwTYFKmXcS0aKQB4dLQVEO2Jq?=
 =?iso-8859-1?Q?1cWlZqgrGFSuZNh3Sa9X0MKOKEEE02wmHBrXgd5jDXjP5EWlfdqnI6yBoE?=
 =?iso-8859-1?Q?NwydYCWvC9pS4KB46iPI2C9nREexJv/skns1fhZ7PG3z8yhgrtcQgdSaIN?=
 =?iso-8859-1?Q?kYuTGzrgGkHLwAulkMczjrP/JkKMSwkROrWVgXqsRYv5GjGLcY01x4uqJF?=
 =?iso-8859-1?Q?50nqWlv1S0qE4WkWZfkXdtrz+RNrGdLKcmMy7wyzp+rRpWNvEfxCCsFmut?=
 =?iso-8859-1?Q?J3f5noZrqDxVn9hDS1v1y8RTyncoJxFG+8oLw2CDYR/piMyJZ2elGPQPUV?=
 =?iso-8859-1?Q?HjFBFH7mReMaJkUOCZPiuGst6fbVSAPu+b2eXQV0MhUxV+I3PjdAVQUHFt?=
 =?iso-8859-1?Q?22pMOmNxNN4vwRb49cK0qaZgoYncKPhorsoACyodIAfz3qd10KIbXJJeVw?=
 =?iso-8859-1?Q?FTEAX0a65kK2aKCkwR5KwdKFvbq3ncV8DqkuZp8l+sIRhIU1jp24MhuOFC?=
 =?iso-8859-1?Q?Pn3EULOqlxRPIK5wYa35eCdQc4na42rw/NoYTGCeAZMOQyqbP3XPz40g2g?=
 =?iso-8859-1?Q?WQ4Iv8SKyyBD3l4ZraCKU5luMDs9Tn+O4P9Iw2/LH5lTckBOQCMWNDKau/?=
 =?iso-8859-1?Q?iPPj2bATxNVPRzMU0VBwWT1WDGvb6HC+99GI43fT9o+pAA6YZTHBpja1ne?=
 =?iso-8859-1?Q?kd5CtNFVfMAFgUt471LZmjnGyq3n/MI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2aa32a-58dd-4b17-80c6-08de64222baf
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 19:18:25.9505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrrRvU8Q77iMgjVDlSwVNntMyyU21GZfpNS0E/qtZdkat46AtVxZB9ihHZupouk0g2mAu4+ld9VfxsMWmpCqXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7470
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

On Wed, Feb 04, 2026 at 04:46:46PM +0000, Satyanarayana K V P wrote:
> CCS save/restore batch buffers are attached during BO allocation and
> detached during BO teardown. The shrinker triggers xe_bo_move(), which is
> used for both allocation and deletion paths.
> 
> When BO allocation and shrinking occur concurrently, a circular locking
> dependency involving fs_reclaim and swap_guard can occur, leading to a
> deadlock such as:
> 
> ======================================================
> WARNING: possible circular locking dependency detected
> ------------------------------------------------------
> 
>       CPU0                    CPU1
>       ----                    ----
>  lock(fs_reclaim);
>                               lock(&sa_manager->swap_guard);
>                               lock(fs_reclaim);
>  lock(&sa_manager->swap_guard);
> 
>  *** DEADLOCK ***
> =====================================================
> 
> To avoid this, the BB pointer allocation is separated from xe_bb_ccs_new(),
> used drm_suballoc_alloc() for SA allocation and drm_suballoc_init() for BB
> allocation preventing reclaim from being invoked in this context.
> 
> Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> ---
> V1 -> V2:
> - Used drm_suballoc_alloc() and drm_suballoc_init() for BB allocation
> (Thomas).
> ---
>  drivers/gpu/drm/xe/xe_bb.c      | 22 ++++++++--------------
>  drivers/gpu/drm/xe/xe_bb.h      |  4 ++--
>  drivers/gpu/drm/xe/xe_migrate.c | 29 +++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_sa.c      | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sa.h      | 19 +++++++++++++++++++
>  5 files changed, 78 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 8b678297aaa2..9a04d0e814d3 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -59,16 +59,14 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
>  	return ERR_PTR(err);
>  }
>  
> -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> -			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> +int xe_bb_ccs_new(struct xe_gt *gt, struct xe_bb *bb, struct drm_suballoc *sa,
> +		  u32 dwords, enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
>  {
> -	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_sa_manager *bb_pool;
> +	int timeout = HZ;

I think the timeout can less as suballocations should always succeed if
it is correctly sized. So maybe 1 or zero (unsure if zero is valid value
though).

I don't see the size of suballocator changed in this series - are you
still trying to figure that part out?

>  	int err;
>  
> -	if (!bb)
> -		return ERR_PTR(-ENOMEM);
>  	/*
>  	 * We need to allocate space for the requested number of dwords &
>  	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
> @@ -78,20 +76,16 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
>  	 */
>  
>  	bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
> -	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
> +	err = xe_sa_bo_new_init(bb_pool, sa, 4 * (dwords + 1), timeout);
>  
> -	if (IS_ERR(bb->bo)) {
> -		err = PTR_ERR(bb->bo);
> -		goto err;
> -	}
> +	if (err)
> +		return err;
>  
> +	bb->bo = sa;
>  	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
>  	bb->len = 0;
>  
> -	return bb;
> -err:
> -	kfree(bb);
> -	return ERR_PTR(err);
> +	return 0;
>  }
>  
>  static struct xe_sched_job *
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index 2a8adc9a6dee..3da4652cf0b0 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -16,8 +16,8 @@ struct xe_sched_job;
>  enum xe_sriov_vf_ccs_rw_ctxs;
>  
>  struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
> -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> -			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
> +int xe_bb_ccs_new(struct xe_gt *gt, struct xe_bb *bb, struct drm_suballoc *sa,
> +		  u32 dwords, enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
>  struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
>  				      struct xe_bb *bb);
>  struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 078a9bc2821d..15d73814a08a 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1109,6 +1109,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	struct xe_sriov_vf_ccs_ctx *ctx;
>  	struct xe_sa_manager *bb_pool;
>  	u64 size = xe_bo_size(src_bo);
> +	struct drm_suballoc *sa;
>  	struct xe_bb *bb = NULL;
>  	u64 src_L0, src_L0_ofs;
>  	u32 src_L0_pt;
> @@ -1148,15 +1149,28 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  		size -= src_L0;
>  	}
>  
> +	bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> +	if (!bb) {
> +		err = -ENOMEM;
> +		goto err_bb;
> +	}
> +
> +	sa = drm_suballoc_alloc(GFP_KERNEL);
> +	if (IS_ERR(sa)) {
> +		drm_err(&xe->drm, "Sub-allocator memory allocation failed with %ld\n",
> +			PTR_ERR(sa));
> +		err = PTR_ERR(sa);
> +		goto err_sa;
> +	}
> +
>  	bb_pool = ctx->mem.ccs_bb_pool;
>  	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
>  	xe_sa_bo_swap_shadow(bb_pool);
>  
> -	bb = xe_bb_ccs_new(gt, batch_size, read_write);
> -	if (IS_ERR(bb)) {
> +	err = xe_bb_ccs_new(gt, bb, sa, batch_size, read_write);
> +	if (err) {
>  		drm_err(&xe->drm, "BB allocation failed.\n");
> -		err = PTR_ERR(bb);
> -		return err;
> +		goto err_bb_ccs;

Hmm, it is frowned upon [1] to use goto cleanups after a guard. I believe
this case works but to adhere to the guidelines in cleanup.h I'd avoid
the goto (i.e., do the cleanup directly inside the if statement or drop
the guard usage).

[1] https://elixir.bootlin.com/linux/v6.12/source/include/linux/cleanup.h#L135

Matt

>  	}
>  
>  	batch_size_allocated = batch_size;
> @@ -1208,6 +1222,13 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
>  	xe_sa_bo_sync_shadow(bb->bo);
>  	return 0;
> +
> +err_bb_ccs:
> +	drm_suballoc_release(sa);
> +err_sa:
> +	kfree(bb);
> +err_bb:
> +	return err;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index 5efbb5a09f77..2cfe6a353299 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -181,6 +181,30 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
>  	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
>  }
>  
> +/**
> + * __xe_sa_bo_new_init() - Make a suballocation with given SA.
> + * @sa_manager: the &xe_sa_manager
> + * @sa : Uninitalized sub allocator
> + * @size: number of bytes we want to suballocate
> + * @timeout: Timeout in jiffies waiting for allocation.
> + *
> + * Try to make a suballocation of size @size.
> + *
> + * Return: zero on success, errno on failure.
> + */
> +int __xe_sa_bo_new_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa,
> +			u32 size, int timeout)
> +{
> +	/*
> +	 * BB to large, return -ENOBUFS indicating user should split
> +	 * array of binds into smaller chunks.
> +	 */
> +	if (size > sa_manager->base.size)
> +		return -ENOBUFS;
> +
> +	return drm_suballoc_init(&sa_manager->base, sa, size, true, 0, timeout);
> +}
> +
>  /**
>   * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
>   * @sa_bo: the &drm_suballoc to flush
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 05e9a4e00e78..9cb8722779a4 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -18,6 +18,8 @@ struct xe_tile;
>  struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
>  					      u32 guard, u32 align, u32 flags);
>  struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
> +int __xe_sa_bo_new_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa,
> +			u32 size, int timeout);
>  
>  static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
>  {
> @@ -38,6 +40,23 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
>  	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
>  }
>  
> +/**
> + * xe_sa_bo_new_init() - Make a suballocation.
> + * @sa_manager: the &xe_sa_manager
> + * @sa : Uninitialized sub-allocator
> + * @size: number of bytes we want to suballocate
> + * @timeout: Time to a wait suballocation to become available.
> + *
> + * Try to make a suballocation of size @size.
> + *
> + * Return: zero on success, errno on failure.
> + */
> +static inline int xe_sa_bo_new_init(struct xe_sa_manager *sa_manager,
> +				    struct drm_suballoc *sa, u32 size, int timeout)
> +{
> +	return __xe_sa_bo_new_init(sa_manager, sa, size, timeout);
> +}
> +
>  void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
>  void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
>  void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
> -- 
> 2.43.0
> 
