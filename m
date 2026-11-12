Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF71606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 12:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zf9n6vbK;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=RMDTzR0Q
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D147510E5A3;
	Thu, 12 Nov 2026 12:21:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855921120B2
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 12:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794486084; x=1826022084;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R5ZZsb5CnXz8v+CiC84uLn3UfgKb5iRtJ0nLYyFjLkE=;
 b=Zf9n6vbK9HYB2TcLWvD2MIXyHKHcc0ZT+6sg12bGVsy3GjzCzOszFj5+
 P8fIc7AbPwRHQtYPo6QeIO/SvPRY9bQAidjGmB/c1lZ1k091Nw/tWs03Y
 tYW5M8AeeKSyGuntjTWbwsSrWNRT/oNSd5rW5VX2LEif+2T8rclJOMEsd
 zRlqLlBQYWLIJR3zyNfeM/P1Uq12EwD3NMf97yjTrHpFVnE4FVOsNJAF8
 Li92YhW2NyCZhphiYb0LHsHclZ5V7VyXdE2xdiEA1KJ8c91upoVVpSZs7
 rdu4lSym2136sBkHUAHAKG3Q7H4mvFyv0G/wJl5vdCfDsZmfsvLSr9H/k Q==;
X-CSE-ConnectionGUID: Z7CBe8oEQSeBohBlYtvfsw==
X-CSE-MsgGUID: XHuJYkhRRFWsbeWtAiowyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3353410"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3353410"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 04:21:23 -0800
X-CSE-ConnectionGUID: sMFa7EUvR268d3CJBq0B2w==
X-CSE-MsgGUID: vOY8cUV9StGZZ+YqEVI1xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8985044"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 04:21:22 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 04:21:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 04:21:21 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 04:21:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLRqtBpLxc3ucygfiRnzM6cCti1jrEuZMZWJUeyUlCyzZqjbTAaUF/dj+d25QMjWxZRAWBfu6LTiBw/FJHBsuYEoXwfbTj2S1wplD+wSLGIHzdbfhyx0pn02Yjoj8+3Kun1iSwGr9j21cnu0JCtNIsW7W9TdGvw5gXMpBvyH7y1RSo2iQQ6CNVsQsxONHpqTrHQNHx3ea5SPp9ge5S/ord+4y3dbWdkjpmtaax9av4hqKeZKYfKQPQ4N699rqoyeWqCtdZjR3ty+bPZuOB8HSkTLHLvsGrNoX3287pfSC9oXIKUI868/V/FPVlyVY+5cAYqrOmd0mJeyLfepg6qaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VElvguScAl3LWIRSdeaR0pRQ+Bc9aiQyNXYAcP3v/DQ=;
 b=LPn4iDycgwAwCMLUR8F/0TePbakSpgA4yvocSstXOs9iwEdB7sgVy8ouxW+GQ7BXAazDim3rkqYLyJyBbwANaskMhM3aOad1FDYFn5Wwyi//7flCwVTxbNUC//AvyRidOjSTlgIuXSuE0X8M6rNQFpKLq4x5vpXAjfKWW2kHE6ndaNFA/93l/6/WeXbJ3DGPw47kf/JdvG4X28rrkemTECzSNVSyVmDds3YWJ0TXXUQ7itezvODGGVkombsa0zUmMlHgoF3C/z6/TfSthufWxWla4ilcr6TtGPdfqI1GcK3ZU2jmgunJhRZzFZ1JLoWBEKa2YWWSA8Q6nuSwN/YSFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VElvguScAl3LWIRSdeaR0pRQ+Bc9aiQyNXYAcP3v/DQ=;
 b=RMDTzR0Qq5YfyY3h/ODvpHCpAt51YIiu7ZSAm11bBENiHP5sTEMqf8z1S/UuZxNHvXzyoIMyzL/ANMmQw6WEEpHFQzfvqE0doG7DS0+hE9bJA+NeQmMwX82OF3CBM1UkjvJgBco9qbc3+2NQNfhPwO4/JkXx7G3t/nZJn8V/1VQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DM3PPF1CFCD9AEC.namprd11.prod.outlook.com (2603:10b6:f:fc00::f11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 12:21:14 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 12:21:14 +0000
Date: Thu, 12 Nov 2026 13:21:10 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <matthew.d.roper@intel.com>, <fei.yang@intel.com>
Subject: Re: [PATCH 00/11] Allow boot with only media GT
Message-ID: <20261112122110.ixq4r2ywlbtfup4i@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110231442.218721-13-stuart.summers@intel.com>
X-ClientProxiedBy: VIZP296CA0009.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::9) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DM3PPF1CFCD9AEC:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d043d4-388c-4971-520d-08df40b771ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|5023799004|11063799006|56012099006|22082099003|18002099003|6133799003|261102123227099003|261022105027099003|10067099003|261026140227099003|261028144727099003|261026121527099003|261022075727099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: XDOh05n1C766RIvq66eYdPnZ7x3zWK6qyg93rIVRK0dsk+KbFHCeVW2f3UJ1Q1cT1/jRVHHw06tNKDLzoHk4p7V4SLGBRd5+icsLfwXfRdYzJE/kFepr36V68sc0qToR0vnH1KdbL9i3uCuFmDYauzMV4ym2mwiGhD90zlMtMAAtZRi6sf9hNoXIIRjmv31p9JSoCS9a6QWf+H8mzUDH6asRqZpPAL7IuKC2/jVU3on5C6yfSVykhcDTlhGESfqJ4TsDI0q5HhCSLNPkejZ/jjWAPGxytrtvL4AvZ/lNwJvXGDnxk+EGlX3fyiQguelCjEoKRd45kDEAniHli97NeM9pPg3uxyiiatU/l7UvEDKrSOttc0RFBm1lc6gn9SBXwLJ6YiWEQmhIo5BBjmcZTr/TIrvnEC35imR3y1NhEPreV8SUVfl84Dbl4lWoPH9sP11PlxFRQZ/tQlK1/xeyHzE6DvpCRp2am/4yxqk4qFMbP6SVQSOLKJwi3tCBqV0CHS9+KGg3ndzG5Rl3F8/paAJCzabYBUtU4RxyK6BlEncy4WByN2d3xsFjA8kb8KDKOHWXrX7gFqzMLBaP5ihAUuHeJvWp8SK6VbUYNRn5/f9AqIvkWbqRrorxAtOnCUlF6iJY3BbVtvDaCza2LArUx5NFGldvxiUbNKSQjTkzRqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003)(261102123227099003)(261022105027099003)(10067099003)(261026140227099003)(261028144727099003)(261026121527099003)(261022075727099003)(261021123027099003)(261021121427099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3pWSEZybkxpN1dLOW83aUV2OTl3eDIrR1FNZ1huRDUxMXB6TGJ1NCtNUWhG?=
 =?utf-8?B?LzJGdFRPcFU1Z2d0Vzl4cFpWVUtna2hCT21RaW5NZm5rNVpqTFlUL0dVU28w?=
 =?utf-8?B?WmJjc09MNGIyeHQ3TGxkL3hJM04yc05maGxFRUY1MGtkVzYwbkNiOWY3RW9s?=
 =?utf-8?B?TERyaVV4djlkTWsrcWlHQVJXdFRBN1d6bXNvbGxMc2h3TEJnZmkwVW5pb1dn?=
 =?utf-8?B?c2RlcXZjc2pKTXVhUTJYNlBBbk50bU5oT3VzQzV5cTFuRzgxcHFrdzBwUldE?=
 =?utf-8?B?ZXFXU0lEeXA0eUVhY210UGJFbnJndjBpZXRaRXpxQW1EQ3NKTHZib2ZlQlFK?=
 =?utf-8?B?R2ZCNzhVOVpWRm9XNXBCRThoVGwwY0VkRno2a2k0NmNucGozNFhPVnpOUS9B?=
 =?utf-8?B?VTFGUG0rMkxtSjEyVE02cEw2bW1KT0dWcExXVDh4K25aTDFqdmtpaDNlbTlL?=
 =?utf-8?B?MHVlM01ubXVMU3liK0pNTHhDTjUwOGgxU1JxaDBtY1hTMGlJcC8vQWRBelZt?=
 =?utf-8?B?Q1F5eVpYZ29kTTF0SVg3S1F6QVo1VHlsa1FRY2wzakQ0Ukw3QTYvM25PaTly?=
 =?utf-8?B?NEVHcHJsZnZFdXcrS1JUOVBQTzM2M01BSFZoalhzelR0clllNFFuSG93bzN4?=
 =?utf-8?B?VDYvY1RyME5JVGZMdTkvd1kwdHFNZzNoWi9PVXhBYXRKWUlxOHBBS1p6Ri9W?=
 =?utf-8?B?VW55SW5ldlRnLzlLOGZybWNhVCtCT2ZMVTlDVStVRjNycTBFZFdLZWdVenFj?=
 =?utf-8?B?RzZkc0NJQzc1UGd5czlVd3hjL3Z6L05veTExUUVXZzRZYmZ6T2c3azNRd3NT?=
 =?utf-8?B?L3daTThLczZuWlJBaEJNbHZId25UR3AwdGdIUXJhNEcxRTRzREtZajdFeU92?=
 =?utf-8?B?aml0SHppK1ZzSStrUXR0dFd2dmE3djUrQ0xNd1lBejhDTUNqQzcxTmZpMVp6?=
 =?utf-8?B?OVU5UXhrazlIcHMrS24rT0NDVmFscHpIQjNpNzhZOXBMcHh1aWU1S1NEYzdp?=
 =?utf-8?B?dDZWTnVNUjJTRkM5QUtuVkcxODFtUk54dTlFVXR2QVRYcDJtQlQ0SnZNbGFr?=
 =?utf-8?B?T3AwbVNFTTRsVGJJTGU4cXZSbXFsck9oUVF4S2pKK2xBWmxIRFpkQXJLa0Rh?=
 =?utf-8?B?anlUeHIyTkdoZTdpRWpVRVA0bHhNYi9kblRLNG9wSnVXYnVxQjY4cjdVeEEx?=
 =?utf-8?B?V2ZuMWd5UFNqYTg4bDVabjB4ZjhYRnRrUVkxSE9Sd1MvUnJaMDZkSzVUK3JZ?=
 =?utf-8?B?ak1nN0cydGpZVlhmS29rakZkSmlUS2NJT01zZzR5TjI1eFJhOHhqU0JibVRP?=
 =?utf-8?B?THNRUFYvcTBCTXpyRHR6QS9JVmVYcDNsUjJrRHFwZ2tNWnBKZ0lLbVRtaEdz?=
 =?utf-8?B?ellESlp4NjcxTGRRU1dhMnVneVFrVzkydHNEak4xNm9tMHdENlFsTVVnWVZx?=
 =?utf-8?B?VVBualcxZ3l5VUxNbll2L1REaDBzSy9GZGVWbGlPM0pMT0JiWWtyc2p1Z0gx?=
 =?utf-8?B?dmFUaFcrV3hwdEFzcHFRMk83M3B6OVBRU2ZDdDB2ajRTdGJScVN3dncwK2NI?=
 =?utf-8?B?SU9SczJScVNla2xlMWxaZlMyekVSTGp3cHpJSXRDdTF1dUVsWjR6R016Qmx6?=
 =?utf-8?B?U29qYW9tdGJDZDJXU09DMG5PVEx3VWJmT2U3dmNqaTdnR0RzZEZhcXlGVnFa?=
 =?utf-8?B?K2dOdjlDUHVKVTJzZDBwZ2s3bXh5d1VXM1FsWXhjYTE4SXRJTEEzekhXNE1X?=
 =?utf-8?B?ZXlGSXM4TG1jTllsWFRLazhBeHpVTUxuNFl0UEkwR0lUaStsTDZPTE5Edldo?=
 =?utf-8?B?U0dJS0pLcUhrTHBBQlJ1enJRZzRIQUVVd1lOOHEySmNiZmFmd1NIV2NFS2FG?=
 =?utf-8?B?Z3FGVXFyUFFxNDAxbmNDcEtDTkUyZnlyMTZZb1VzeGVBTS9JdnprR0JGU0JH?=
 =?utf-8?B?bDNEbk5BVWlWTXZjUHdxd2YrSHN5QWV6S3FQT0RKWFo5N05PRU9KQVJHQ3Iz?=
 =?utf-8?B?TEV5YmFXY296RU1Pck4zbTlWVGtGbmNZOWR6cER0emxVMmxxTCtXdHJqK1N4?=
 =?utf-8?B?cEpCdy81S2tCd0JwNktTbFdUSGhLUTF0eUoyOXQxYkpuc2c0REZkd0t4OGlJ?=
 =?utf-8?B?Q04zU2Q2VzVPSHFlMjROSVF4NWtHWlk0ZjY1MWZsUHZFZzBqaFpkNTMvdnlG?=
 =?utf-8?B?cmdVSmprZzdEYWZ2b1FwVm9yUnBuVDVmNW9sUjNScGx4dHc1UndLOXI0QU1T?=
 =?utf-8?B?V1NnRDdjVWx4eGdrc2c0ZGtiWGdwRlZjcGdKQmNHb0lSQlJUcnZ0TkxObkJX?=
 =?utf-8?B?N1dkMlBHZTFLNEgwcFFHd0g1MG1jangvTko4emRaUVpmZWQzOVp3QVJpOVBZ?=
 =?utf-8?Q?GC3Cou6A4+EzLaiU=3D?=
X-Exchange-RoutingPolicyChecked: yGyaKcCNlDQXIS7h/1fMF3dmkD+LKQdfVpPY9e7SCVR1YakCsYOPHuL0F0EJDm41fAE2BfPSiCvWW9XNViR0bxGDLixYKFyNX9i6r6uZLrn5fTy1gcIXnJJ/XoEGSSXdg2BEzTYu/puXbG5PXyr98VpGotRAsIkkdAo/t5JyUmgGep5S19VWtyBEqXOC/4Pc8x05DqGyAun5z8vGeCM67ESDn79GKi/k6XUdzzZ+c9Wy6HBshn9ErX2Hr4JhL5EvlArTNAUDjXRpPcQFGJ0uPip5Obtpg/FOyXhC6mA7WIQ30bxpVBvWXZoCv/Nd6Vgq9s0uKpPItQNtBcr3Dxp/XA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d043d4-388c-4971-520d-08df40b771ff
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 12:21:14.6483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKdgHuchJymvlclHA4P3o7ADfNaV1BFuFaquorI6C7hIEktO56mzDoMEG8sfzs2klH/0BAp4jForVj5FwtlFcT+uxh8OnX1KAkYo/cZJ9kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1CFCD9AEC
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Stuart Summers <stuart.summers@intel.com> wrote on wto [2026-lis-10 23:14:42 +0000]:
> There is a configfs right now which allows enabling either the
> media GT, the primary GT, both, or neither. The driver right now
> cannot load without a primary GT though. For debug purposes, it
> can be interesting to load with only a media GT though. This of
> course means we lose access to blitter and a lot of the core functions.
> 
> This series attempts to cover the most basic scenarios needed to
> support a media-only configuration by splitting the handle_gmdids
> function, adding proper NULL handling and reworking some of the
> root_tile logic. With media we can't use flat_ccs or
> resizeable bar. These are as much as possible split into separate
> patches to help with reviewability.
> 
> I tested this on CRI in each combination of media, primary, and both.
> The configuration without either GT is still not supported and the
> probe will fail. But at least now the driver load can complete
> with only the media GT.
> 
> In addition to the split, there is a patch here which also starts
> checking the GU_CNTL register for IP presense. This is interesting
> because, particularly for debugging, we can fuse off one or both
> GTs and we still want the driver to comprehend that at runtime. Of
> course the VF can't access this register so it still spins off of
> the GMD ID. I confirmed that the GMD ID reads out as 0 when the
> media is fused off since it is powered down.
> 
> Note that while CPU copies used for migrations and page table updates
> when only media GT is enabled, instead of reworking the migration
> structure to move the VM out of the migration queue and back into
> the migration structure itself, I decided for now to just add a
> kind of "fake" engine (just VDBOX class). This isn't actually
> expected to work, but since we're doing CPU copies it shouldn't
> matter. Hoping to get some review feedback here before doing too much
> extensive refactoring here. I can look there if this isn't acceptable
> though.
> 
> I used claude opus 5 through the process here.

Hi Stuart,

I'm a bit concerned about what this series means for SR-IOV. A lot of PF and VF code assumes
the tile always has a primary GT, and the series doesn't touch any of the SR-IOV paths.
Once probe accepts a device without a primary GT, both a PF and a VF running media-only can
hit these paths.

I used an AI assistant to search the code for places that could break. I reviewed its findings
myself, but this is static analysis only, nothing has been run on hardware. Migration is left out;
the list covers only the basic flow: probe PF, provision VFs, enable VFs, FLR, probe VF.

PF side:
1) VF GGTT is never provisioned. Fair provisioning (xe_gt_sriov_pf_config_set_fair_locked())
handles GGTT and LMEM only for the main GT, and the bulk/sysfs provisioning paths only walk
XE_GT_TYPE_MAIN GTs. VFs come up with no GGTT.
2) NULL derefs of tile->primary_gt in the PF config code:
 - pf_push_full_vf_config() for the media GT takes the GGTT config from primary_gt via pf_pick_vf_config(primary, vfid)
 - pf_validate_vf_config(): pf_get_vf_config_ggtt(primary_gt) and pf_get_vf_config_lmem(primary_gt)
 - pf_distribute_config_ggtt(): pf_push_vf_cfg_ggtt(tile->primary_gt, ...)
 - xe_gt_sriov_pf_config_get_ggtt(): pf_get_vf_config_ggtt() / pf_get_spare_ggtt() on primary_gt
 - pf_update_vf_lmtt(): pf_get_vf_config_lmem(tile->primary_gt, ...)
 - xe_sriov_pf_provision.c: the bulk/per-VF/query VRAM helpers call the *_lmem_locked() functions on tile->primary_gt, and these are reachable from sysfs
3) The tile-level PF debugfs files (ggtt_available, ggtt_provisioned, lmem_provisioned, and
the ggtt/vram attributes in xe_tile_sriov_pf_debugfs.c) all use tile->primary_gt, so a plain read dereferences NULL.
4) LMTT is never set up. xe_lmtt_init() is called from xe_gt_init() only for the main GT,
and xe_lmtt_init_hw() on the media GT then returns early (!lmtt->pd). On dGFX VFs end up
without any LMEM mapping.
5) VF resources are not cleaned up on FLR. Releasing and sanitizing VF GGTT/LMEM
(pf_release_vf_config(), pf_sanitize_vf_resources()) only happens on the main GT,
so a VF's memory would not be cleared between VF users. The VF service reset
in pf_exit_vf_flr_reset_data() is also gated on the main GT, so it never runs.
6) With gt_types_allowed=media on a part that still has the graphics IP, the PF never loads
the primary GuC, so VFs fail when they try to bootstrap with it (see 7).

VF side:
7) read_gmdid() skips the GuC query for media when configfs disallows the media GT, but
it has no matching skip for graphics. A media-only VF therefore still bootstraps through
the primary GuC, and that fails if the PF doesn't run it. gt_fused() always returns false
for a VF, so a VF has no other way to find out that the graphics IP is missing.
8) On dGFX, vf_get_lmem_info() is only queried on the main GT, so a media-only VF sees zero LMEM.


Thanks,
Piotr


> 
> Stuart Summers (11):
>   drm/xe: Detect each GMD_ID IP in a loop
>   drm/xe: Tolerate a missing graphics IP in xe_info_init()
>   drm/xe: Verify IP presence against GU_CNTL
>   drm/xe: Guard per-tile primary GT accesses
>   drm/xe: Stop assuming the root tile has a primary GT
>   drm/xe: Do not claim flat CCS without a graphics IP
>   drm/xe: Run page table updates on the media GT when there is no
>     primary
>   drm/xe: Document that gt_types_allowed=media now probes
>   drm/xe: Fall back to CPU copies when the tile cannot blit
>   drm/xe: Require a fully visible VRAM BAR without a primary GT
>   drm/xe: Allow probe without a primary GT
> 
>  drivers/gpu/drm/xe/regs/xe_regs.h  |   2 +
>  drivers/gpu/drm/xe/xe_bo.c         |  43 +++++---
>  drivers/gpu/drm/xe/xe_configfs.c   |   7 +-
>  drivers/gpu/drm/xe/xe_device.h     |  16 +++
>  drivers/gpu/drm/xe/xe_exec_queue.c |   5 +-
>  drivers/gpu/drm/xe/xe_gt.c         |  11 +-
>  drivers/gpu/drm/xe/xe_memirq.c     |   9 +-
>  drivers/gpu/drm/xe/xe_migrate.c    |  45 ++++++---
>  drivers/gpu/drm/xe/xe_migrate.h    |   2 +
>  drivers/gpu/drm/xe/xe_oa.c         |  24 ++++-
>  drivers/gpu/drm/xe/xe_pagefault.c  |   4 +-
>  drivers/gpu/drm/xe/xe_pci.c        | 156 +++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_query.c      |   3 +-
>  drivers/gpu/drm/xe/xe_tile.h       |  32 ++++++
>  drivers/gpu/drm/xe/xe_tlb_inval.c  |  41 ++++----
>  drivers/gpu/drm/xe/xe_vm.c         |   2 +-
>  drivers/gpu/drm/xe/xe_vram.c       |  15 +++
>  17 files changed, 295 insertions(+), 122 deletions(-)
> 
> -- 
> 2.43.0
> 

-- 
