Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08BCC83038
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 22:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947A310E281;
	Tue,  1 Jul 2025 22:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSu/0kjh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F71110E281
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 22:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751409368; x=1782945368;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sDiVxdFTSjpNESgYlEeDrSZg0NzHXIbxfp3eZqtW5Uc=;
 b=HSu/0kjhBx6IzS/9TLfFgbZSPeZrsN0gi/LNdegkIeeJSFMKh2IH2ZuE
 8QdZCmjA8djgTjoDMWr+5RjpgWkOyDxOML7+0QfumFFfwdtqKsv+XXGx/
 aQYGMdZrP2ADfG4AwwTvue2OpqelJCteQ5ELsiDZCaynprSfFfy6p3PSK
 9FyuU6/wZJGaAT/VnTQqsNGftKnzVpHG9AwirKtKtdUnRoERhQWmjW/kn
 e+Jds6uFKfQBdGos6uewP4Rsa1dOVLXqCMDeBly8+kY9j23diuMEGRXF0
 k7FbD97PgslSpMFk8ogvO2K9cQ6dMkBEMcKvM0F8nvYFcVCG9p5Ik/t1o g==;
X-CSE-ConnectionGUID: rZL8xEhFQbm/enyjaqpbbQ==
X-CSE-MsgGUID: jIJebtQtQmOaMZo8Ws8Zog==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57501312"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="57501312"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 15:36:07 -0700
X-CSE-ConnectionGUID: 41lww6CeSqWazFpjnkgh/w==
X-CSE-MsgGUID: Ba4EZWKJQuCmhNSi/z/QXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="184847738"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 15:36:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 15:36:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 15:36:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 15:36:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgsNfT2OMhtUJRW2beFPXZMUP4+/tppit1HW7nx0POeDXLadSQKJJWC7ckxyaCmqMeRR+J6AiaOdbWWbeYgWqVTXG9946V+PSrG67QZplEu2GIG12JLhLL9+GtAXiu/1fSQIccevzy4SZnRpUnwC41nEQw/1cRtCDhiCycMRTNJVeTPssdsio93rgRu+9IFn4nPsH6ewnF2whJudvA0XV5M8s1n+ohkfpMy39DLmOdwKQCFfzpSiuVY/YbAQCMEaw8N1Y/UOXIX8OVbKS/CmRAC04OO5mK8oGSYW4ZvjDHvIXMyzAYiB+V9taEyqlC80GVdtIuMsDI4j0KB2QiD2Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNeNGMHrvBW5/niizKkJ5fR3Z7mSc57pPAicMbBK5bM=;
 b=kNiaG8GKG80OiqpjPyQSbHVn0+7I4wkDwH+F8SyBquDwh8asG5a6KHMNGXujOKIohLWjJEVAk/am7HMQ6sS75agz5IxC8+DFwepH7hxfxemAgRRQnoLp6XfOQq703vz4GzKcO18kmEpTokMT7GxgetZ/7t4VB8oGFj53VaWEAgcvW6W1q/X5pWkEVBKT8Z60CqL8Za8tgP3Tu7fhD+OV0Xnu5NO0xiJH7vQnN9xAVoNcqN9G5Vecb15WdPOC29+CJuPOOQXkIne3HXUYHhmpNUu4Quo7AkRnrzjx08vNCEs2jCPN8AtaFbOFtX1q+U1XxpEQBOJDCWrkjU0+pUESZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8321.namprd11.prod.outlook.com (2603:10b6:a03:546::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 22:35:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 1 Jul 2025
 22:35:47 +0000
Date: Tue, 1 Jul 2025 17:35:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <umesh.nerlige.ramappa@intel.com>, <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe: Make WA BB part of LRC BO
Message-ID: <jln4pokd366qsotve4ub5a7y6knzld3mh4swdpobgdose26a2a@lsasuvelkf4r>
References: <20250612031925.4009701-1-matthew.brost@intel.com>
 <131a3a652e25e68a63145fc20f0c6e23625bdb84.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <131a3a652e25e68a63145fc20f0c6e23625bdb84.camel@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: d116849f-28f0-4b3a-177e-08ddb8ef9fcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6pJZfCpm/JCzuTUo12coND6YVXZbDkY7wl7gNFZZalQo//Qwjf58AW/oG9?=
 =?iso-8859-1?Q?zAVgC+tNwA1WAsqbIPSwApyFIPRKp45eum2SV7vUhof7V2h4LvFhRDKNdL?=
 =?iso-8859-1?Q?cjUVXDKjo0FZ6j33vX8pgBXMxNMo09CQXF9gXMR8OTs/Gve+vyZNqLMXtV?=
 =?iso-8859-1?Q?IAUzFl3dTxgD6GiDh0SrX3t66Ptw1M0ncPB0wdIFSIjJ1oR5ekPHTsNBSm?=
 =?iso-8859-1?Q?s2ow8JFeoLVoWAhVVuspVIR9pXvAxEBkvgdQYbXc+l3NcOeg7Lotm4Rlgu?=
 =?iso-8859-1?Q?TU7wzJDURbzU63cGTmvJWeF4R/+fKEF8GJgo2CwIn9mFOi8PmbZEV4yEQ/?=
 =?iso-8859-1?Q?6nkchhRYGDPsRNJY3NhlSegtj2iUMJxcc/aLi01VaWhRXSQx1fYQwtoyfj?=
 =?iso-8859-1?Q?CB0J12HLnLnwjvHI422PLS+1CYWXp20crxAbwjdTvmKEYdioHplCsYVGfx?=
 =?iso-8859-1?Q?StOmyOsRkl3qDM01ItivmjvlOLu7BA7CJpF0YGc+I5VBEOSKt3xgjQkj3R?=
 =?iso-8859-1?Q?7+WXmCDtVb6NcVSeo/DPOgNHPizJdWG+ez5Ts0O6bOboLfCncZWW4GEZTX?=
 =?iso-8859-1?Q?5qQPjab1R++uZyUc03W6Z6TWccBtuLW/x105BEOb+WnzIDb94MlGj+TCPm?=
 =?iso-8859-1?Q?Qhss6MbhaYjA1mK9d1NWhY4sMFU59qjlImZ83YbP+ZVw+jzXPOKTtVURqx?=
 =?iso-8859-1?Q?Nj64yCCf4EoY5s+G6Vmgt27x4V8HvHAM0KkTuIuOITLhgUqlMJLORSnYnn?=
 =?iso-8859-1?Q?N/S6fLWhtUamsE7ijcMU2sXyQWr2chm/cBe/Dq2cnOrpj6UCJ4HQos/Yj4?=
 =?iso-8859-1?Q?NOO6HQ+sOF+4oVSfEZkgUruoDnRRs3E1S+iGkvZBAOXGYd/ks2gH+tumJM?=
 =?iso-8859-1?Q?Eux7A9Flq8eklh4o0dKMB5BLW/RPOQncEfjHL6ewD0wmBTvthQtRjVXThz?=
 =?iso-8859-1?Q?0PUW3/dXeY/XQYV6k1v+CjZ1eRMPwUl/oRWHh1OsPF0IjgtpdFvyoEZyy5?=
 =?iso-8859-1?Q?toOz9ygm94oMg/06Dyj6Ize6YuyLEE3Y4KUN6FcEh7tZO2U2fkIRrVOCkm?=
 =?iso-8859-1?Q?ozzzDE89NyPAYs24vEyiQ/rK1qwKTrCrgdSK+cslsv3CUBMPCz1bpxha/p?=
 =?iso-8859-1?Q?jz9Tvb775pvYbQ/+e0PoFXZI5ERdSEdCH6QZeDMXqpx2O58cBZmgvhuu0d?=
 =?iso-8859-1?Q?8i8/oGS6hJAdHg86TrxWYWNICsZ9/OqfQ2Xw4rReWVJGfdIrTfuxKyMh9F?=
 =?iso-8859-1?Q?VcJJoEPgW4M9jUcnZCXZAx/FF/KgGbh7tvIXo1rpdAaJQ8GuCZsgJmrI65?=
 =?iso-8859-1?Q?VUKZZJO2OlMij/T1j8LdGYLSCzCOEjK61qeHbAAzK08KPIrZ03gh6sQ96N?=
 =?iso-8859-1?Q?1zyzqkdt1xsdu9+tbq+cgp4YowNpfESLhMl4IycuIkYVOWEqAY/HK7HOOa?=
 =?iso-8859-1?Q?uiMfk98rPqyTS5FhztjPA9q88WKxUQFEvI4Jf4C1bhLfiCimX/EboIP95G?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?z9ZMaO2wIS73tFv2zMn5HFAlTk3cLUxJabM2l9byaHRyX6LZ2Xq0xqV/43?=
 =?iso-8859-1?Q?YqTXZxMcy0muo8A4sekjrre1jYH2HMYUx4N0gIwf6JjHt2WTIWnfIJvMJy?=
 =?iso-8859-1?Q?gXBbpv/B66+WjC6xNgmFWZphG6g6cLHIolhT2LIv/yKB/ihcQT2HWfnas6?=
 =?iso-8859-1?Q?pOQJfZ5AgilYVcygEEA0XnmooUnRSxO4iwtjd3Dk3E4CKBXK2wNDcDE+oY?=
 =?iso-8859-1?Q?58fUwhnkOyzH7YIr2pe9ZxgXQtlAhF7+nZcpUh75MrQbBhMtZMYgPIYXKC?=
 =?iso-8859-1?Q?MLF1RJKPlR5iwS1Mevcm6t9zENkcL7QnDK7i8PQYvPPjOIL98y/EizfwgH?=
 =?iso-8859-1?Q?aRIsz/f+qFA8p7xpdvCY5GxROG6TIwF2q5a1MCkMo7PHfabf/DRDW6r85j?=
 =?iso-8859-1?Q?PPrKkeka3i7wDEHQsyKeXyQsBWTh6xFVEv3S/utaDycsRMt/dH8y83XQdp?=
 =?iso-8859-1?Q?809T7dDtZEJIMWDCE/PU/vQF6JSG9jznLvA5MysPfKsCoK0ZoG0iUixjg0?=
 =?iso-8859-1?Q?152F7ev8yXi85n+md4qIOnT7zgN3cAdWz/jaVCvk0W7CP6uMsgm1/VSfeA?=
 =?iso-8859-1?Q?5ATbxndFXpAVT1ssP2+jgVrKuUMYUHykCvAx516Ch7sVBeIVSBtXjIDGTi?=
 =?iso-8859-1?Q?6veUQZkBGxf3XAKlWmwyH5podEYrI9Ie6YE6rImQS/lPbb4ahhNHB6n/kG?=
 =?iso-8859-1?Q?BpNJ4Oxon48LZ1si/we7thdO/I7blH8IL2ua5W6DzL8SdOUOMYxZtwvgnV?=
 =?iso-8859-1?Q?XrqogVwA0wkV1EU97tBDtkCn+cG2iHahm2E+GzO0PytlMtbm9AA8bTsQhj?=
 =?iso-8859-1?Q?a0GcN047UBo5B17SDX5FQ00nyPDU6NrJ1aRCB7fRuchHZWc8+F7sTTKGAY?=
 =?iso-8859-1?Q?W+955fcRlDyEmDp/CTePxjjSGLevhMOAck0bvprmmVRLq3iSyxiCC52ZUn?=
 =?iso-8859-1?Q?mZUdkR9rSG3/qHXu5fvnRlogGFIWKiqHbwCgzXXF2BbiXvFIlpK8a3ow0L?=
 =?iso-8859-1?Q?DLmaR2OQyfgITMzIXgVQWqDkbYYHyCK0MbRqYDZBoIV/vXmHKVaSTBYcjW?=
 =?iso-8859-1?Q?1iRuLklTVr0NPn4YOTk7BtN7PPcj+lidAd9LkAPaCHFAcsJBIu35S1MdFn?=
 =?iso-8859-1?Q?17+oQCUQrPfGVdrbsjfvD70N+1ZQX7O/ajiWkEZZsqBBYOv9ILDGc5vLwF?=
 =?iso-8859-1?Q?WBwu0pZy/SHWX+rrEM4AmmWNeXiZuzLJBaGrjDny/6TGggSpHlujFvEmzX?=
 =?iso-8859-1?Q?jsJC74i8uMEYr4hqzP2EsifWaUwIO947iecLztUcsAQbVIdrczj8nMCVPr?=
 =?iso-8859-1?Q?XOg34DoGD99QxguJce5YKzaCtu3ZDcGP4yu/mzDsx7bERKIFXssQLjoONG?=
 =?iso-8859-1?Q?Kn0bpdOchqj0CwrTLuLMwrrC6bJ++O1IJxIr5G3O8nsZowjzlEPOpURHVo?=
 =?iso-8859-1?Q?cGKeluCLOtGnnwFrL1F7ssTKLaIKUAReVZRPyYXjASZjk0986HcjbGqnzS?=
 =?iso-8859-1?Q?dEEmSMSZgZPcr14QDMz5eBmbBfUmvRK8XAoB48sofPzsf1oAPmD1QZOqS7?=
 =?iso-8859-1?Q?ZGzUEEaHJHqzKyzdpxBiGYuCtVTYZy6jX459PGApyJCg3HgFwYT0Ab81ud?=
 =?iso-8859-1?Q?ezxgZfY+E68Ys2CLOYWgPxhCO+JH5NF1YiI6BFThhRGMM+JPNFyncBRw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d116849f-28f0-4b3a-177e-08ddb8ef9fcc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 22:35:47.7537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/HF8sFXWLcliML+FPsvh+5FeZ9JLBXh9XDtSSGfsNOaSWQCI3SiZKAV1NFQO2h9fRgyrlJD8x11nGqDAzpOczUmvpCEbtIVVk2GUZ8wXsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8321
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

On Thu, Jun 19, 2025 at 05:18:12PM +0200, Thomas Hellström wrote:
>Hi, Matt.
>
>On Wed, 2025-06-11 at 20:19 -0700, Matthew Brost wrote:
>> No idea why, but without this GuC context switches randomly fail when
>> running IGTs in a loop. Need to follow up why this fixes the
>> aforementioned issue but can live with a stable driver for now.
>>
>> Fixes: 617d824c5323 ("drm/xe: Add WA BB to capture active context
>> utilization")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>
>This patch has non-trivial conflicts on drm-xe-fixes. If we need to
>have it backported please help resolve the conflicts by:
>
>./dim update-branches
>./dim checkout drm-xe-fixes
>./dim cherry-pick 3a1edef8f4b5
>
>Fix up conflicts and finalize by
>
>git cherry-pick --continue
>
>And please send the resulting patch to me (including any tags that dim
>added).

I solved the conflicts and pushed to drm-xe-fixes:

afcad9241177 drm/xe: Make WA BB part of LRC BO

Lucas De Marchi

>
>Thanks,
>Thomas
>
>
>
>> ---
>>  drivers/gpu/drm/xe/xe_lrc.c       | 36 +++++++++++++++--------------
>> --
>>  drivers/gpu/drm/xe/xe_lrc_types.h |  3 ---
>>  2 files changed, 18 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c
>> b/drivers/gpu/drm/xe/xe_lrc.c
>> index 529c6a972a55..a875b93697a5 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -40,6 +40,7 @@
>>  
>>  #define LRC_PPHWSP_SIZE				SZ_4K
>>  #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
>> +#define LRC_WA_BB_SIZE				SZ_4K
>>  
>>  static struct xe_device *
>>  lrc_to_xe(struct xe_lrc *lrc)
>> @@ -910,7 +911,6 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>>  {
>>  	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
>>  	xe_bo_unpin_map_no_vm(lrc->bo);
>> -	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
>>  }
>>  
>>  /*
>> @@ -973,22 +973,27 @@ struct wa_bb_setup {
>>  			 u32 *batch, size_t max_size);
>>  };
>>  
>> +static size_t wa_bb_offset(struct xe_lrc *lrc)
>> +{
>> +	return lrc->bo->size - LRC_WA_BB_SIZE;
>> +}
>> +
>>  static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>>  {
>> -	const size_t max_size = lrc->bb_per_ctx_bo->size;
>> +	const size_t max_size = LRC_WA_BB_SIZE;
>>  	static const struct wa_bb_setup funcs[] = {
>>  		{ .setup = wa_bb_setup_utilization },
>>  	};
>>  	ssize_t remain;
>>  	u32 *cmd, *buf = NULL;
>>  
>> -	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
>> +	if (lrc->bo->vmap.is_iomem) {
>>  		buf = kmalloc(max_size, GFP_KERNEL);
>>  		if (!buf)
>>  			return -ENOMEM;
>>  		cmd = buf;
>>  	} else {
>> -		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>> +		cmd = lrc->bo->vmap.vaddr + wa_bb_offset(lrc);
>>  	}
>>  
>>  	remain = max_size / sizeof(*cmd);
>> @@ -1011,13 +1016,14 @@ static int setup_wa_bb(struct xe_lrc *lrc,
>> struct xe_hw_engine *hwe)
>>  	*cmd++ = MI_BATCH_BUFFER_END;
>>  
>>  	if (buf) {
>> -		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc-
>> >bb_per_ctx_bo->vmap, 0,
>> -				 buf, (cmd - buf) * sizeof(*cmd));
>> +		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap,
>> +				 wa_bb_offset(lrc), buf,
>> +				 (cmd - buf) * sizeof(*cmd));
>>  		kfree(buf);
>>  	}
>>  
>> -	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>> -			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) |
>> 1);
>> +	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>> xe_bo_ggtt_addr(lrc->bo) +
>> +			     wa_bb_offset(lrc) + 1);
>>  
>>  	return 0;
>>  
>> @@ -1059,20 +1065,13 @@ static int xe_lrc_init(struct xe_lrc *lrc,
>> struct xe_hw_engine *hwe,
>>  	 * FIXME: Perma-pinning LRC as we don't yet support moving
>> GGTT address
>>  	 * via VM bind calls.
>>  	 */
>> -	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, lrc_size,
>> +	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL,
>> +				       lrc_size + LRC_WA_BB_SIZE,
>>  				       ttm_bo_type_kernel,
>>  				       bo_flags);
>>  	if (IS_ERR(lrc->bo))
>>  		return PTR_ERR(lrc->bo);
>>  
>> -	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL,
>> SZ_4K,
>> -						 
>> ttm_bo_type_kernel,
>> -						  bo_flags);
>> -	if (IS_ERR(lrc->bb_per_ctx_bo)) {
>> -		err = PTR_ERR(lrc->bb_per_ctx_bo);
>> -		goto err_lrc_finish;
>> -	}
>> -
>>  	lrc->size = lrc_size;
>>  	lrc->ring.size = ring_size;
>>  	lrc->ring.tail = 0;
>> @@ -1860,7 +1859,8 @@ struct xe_lrc_snapshot
>> *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>>  	snapshot->seqno = xe_lrc_seqno(lrc);
>>  	snapshot->lrc_bo = xe_bo_get(lrc->bo);
>>  	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
>> -	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
>> +	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset -
>> +		LRC_WA_BB_SIZE;
>>  	snapshot->lrc_snapshot = NULL;
>>  	snapshot->ctx_timestamp =
>> lower_32_bits(xe_lrc_ctx_timestamp(lrc));
>>  	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
>> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h
>> b/drivers/gpu/drm/xe/xe_lrc_types.h
>> index ae24cf6f8dd9..883e550a9423 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>> @@ -53,9 +53,6 @@ struct xe_lrc {
>>  
>>  	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last
>> update */
>>  	u64 ctx_timestamp;
>> -
>> -	/** @bb_per_ctx_bo: buffer object for per context batch wa
>> buffer */
>> -	struct xe_bo *bb_per_ctx_bo;
>>  };
>>  
>>  struct xe_lrc_snapshot;
>
