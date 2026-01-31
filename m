Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBAFE6BF3C
	for <intel-xe@archiver.kernel.org>; Sat, 31 Jan 2026 01:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AEA10E14E;
	Sat, 31 Jan 2026 01:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EAHMhKTH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A2F10E14E
 for <intel-xe@lists.freedesktop.org>; Sat, 31 Jan 2026 01:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769822899; x=1801358899;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lp6ZFcme9qZlEaere9EU9PG6pu5AdE177KhDgwP3aJQ=;
 b=EAHMhKTHTUp3hSFZ+504k9eOM3T07Wv8bqNMWGDDT83kOXoN5wBNFbZ6
 Ihw/rvaJptUZg+OjIalso+CzTs0Umw1swgcKfbQ1os/aVp+tUQWUX6y4Q
 Sad/GZCJPAPHp3693f7r18x6pZ77I/knD7ZE8bv9/HGkKrZ8n7BcsuvkM
 a6bYnUD+9JJZe3+/W1+uRjskl/jaNjhrCk4pvl/bCi4EjnrffxDEPT14J
 2xkR66XHACNstc9R4QBqg5fkcnrQJxFbvOLLLh+YQ96RaoWCA5610Da/K
 LiAXPElD+TRYiRNiJQnp8Ad1uxbFadKWv6wNMc+jlzQa/TLxYgBbPGX9a Q==;
X-CSE-ConnectionGUID: z5XVUo+rROOuIlVELY1VRg==
X-CSE-MsgGUID: AY//5XSAQ5GkNxzn0MH8iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="73678282"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; d="scan'208";a="73678282"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 17:28:18 -0800
X-CSE-ConnectionGUID: xQcNJcksSc2rFGaI8fxGAw==
X-CSE-MsgGUID: rrhMzlt9TiaK3c+FLsWArQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; d="scan'208";a="239706697"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 17:28:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 17:28:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 17:28:17 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 17:28:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C29nQz6W2XMhPZZb+l9XtXUk7hTmAG1dw3y1Op/rt3FqhFr7FPc0yAhxfDkUiYj9iw1WeoW7BmsIsOle7ubP6vTO1OHfu+DAXZhPj+9qM1jzQxwaTNojOBpZ0lwty/g8WiQeteJrClfTTmikBDHXdvGK4IytGkQipHwOVBMz8LXN2HGJSe3Z9IUnHy8dvF08N9G8c/EsxQTmKutBS6la/NLbR8N3pye3ui+sXRZWoUhMtu2fcUGWQmxe7rGe0vHdoHB47bZiAfR3OzBq4qsefGE+wYPzPk/Zvf4nOn7VpBQjOY33V19hxw+wUvRkWBXU/IuCZpVjdNxLsEG0MLYD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dynQH8iG9QXPQC7B4uSyxazt3jR/XLhrl31P8D9Fz5A=;
 b=u1vOink8LsvYN1aNmttAkCT/NQQmiCKOvQTsYqo0y1kUkIpztpwMVEScvJkpU/bBFeyFiCBGzAAoZi+SMUuDPDnMuZ9BbrezChNcdNgHbkX7o1LJ1ir5nGEgOuvaen4tIzjehcWqKWsZxEP4ksnftRF8pIWCVUbtjb+6Nj3Zjqx10vqVFrrKRMEYo8T23k+P6L9jG1eBtvvV54LmQN6TwGmBKPOK3z4GYKHxlCk0tdT0UO6eJLNXtkvbCTCs9O5lMAkBezdwEsJQ0PnbMJEjskA0F7eMOuu9BKVPcEtelIa7oY1e/DMmL7DLmyAD9gXKilQSyit8qDfoCHnHCtVAJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7121.namprd11.prod.outlook.com (2603:10b6:510:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Sat, 31 Jan
 2026 01:28:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9564.008; Sat, 31 Jan 2026
 01:28:08 +0000
Date: Fri, 30 Jan 2026 17:28:05 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/vf: Fix fs_reclaim warning with CCS
 save/restore BB allocation
Message-ID: <aX1apf2pApZW4UND@lstrano-desk.jf.intel.com>
References: <20260129125141.523087-4-satyanarayana.k.v.p@intel.com>
 <20260129125141.523087-5-satyanarayana.k.v.p@intel.com>
 <39c1fd57b78f09761867a469fae16c347d879dcb.camel@linux.intel.com>
 <aXug5LbEvo/EKh3Q@lstrano-desk.jf.intel.com>
 <0d8176e7b4e166303aed4ea1b5d57de485be112c.camel@linux.intel.com>
 <aXu2kKg/mBP8aIe+@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXu2kKg/mBP8aIe+@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0214.namprd04.prod.outlook.com
 (2603:10b6:303:87::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 637d2bd7-c968-43bb-81ef-08de6067fd40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Wol5NbkhUIJZBBO9+yW1bgRLF7tlKTLlxdhPmAVoI03crOkmw10Ig/jTJc?=
 =?iso-8859-1?Q?yx6I2ZTQrBaFq+bmE5t3jN/lezZBkfMYPw6sn/NeWIuusMFQs0r2GmPRMk?=
 =?iso-8859-1?Q?O3ZgZeR3E/VG3HkH8BWkgjzdcJxYQ510Z/vzA4IHV68LZ8lM6zBTBEQpNh?=
 =?iso-8859-1?Q?uCgaUqBV87PjaItyfcHK7VIzNjdG1ZV7YAiDra5oAVwrW3REu3z9kRB4Sz?=
 =?iso-8859-1?Q?DhNTzm6hHqzNFwH/FpfB6vhmANJMJFjdRV/LTg5HfzrIxPOOKvszeNIBnK?=
 =?iso-8859-1?Q?8e0vOGAYktVjCXVznqx+cQHzoH41kBcwXrg+85u0/YxcoLlIASzeXWf3MR?=
 =?iso-8859-1?Q?WAKFzj5hkEFAekmR1hnBT3RA0A3tNIZlWeGWecDMeDy/uJ2IwqaTUPUXBR?=
 =?iso-8859-1?Q?pDn+q85RDDbVcHJQo8LJOEXRtNTkz5CoKAGfkyVm17gSszskkyb58oAxD/?=
 =?iso-8859-1?Q?n2wmyj68ilegPtp4nMXyLNJc4WawV5P8YmPFLSOKnhRhm40wcG63ZxppkS?=
 =?iso-8859-1?Q?9lsT9HIAgZ7PCr9Uc6Ynbcu7my4Uip/if+8dHavAurehtkPQPvV4qFHY4V?=
 =?iso-8859-1?Q?eXX2HKpXk4eBe+ln3wt0vf5zo+O3OEt5bv+20u1RUCO44PvSKAMUKXo3dz?=
 =?iso-8859-1?Q?9+8sJe0TmgdIYGM4+z8EV641/KwcvNJRMHRrd2oGmGJV4k+XZxMPl4O7Sn?=
 =?iso-8859-1?Q?AuSoqiassccf3HGak/lSyH/Jw4by+jxgQrN2pIfFcrhQNBRqrSBkNujXJY?=
 =?iso-8859-1?Q?8ib3olqWcFaLL+wRm/VoFagS0KRbN+mhaQkAHuafUfiwnksipr+Tte0JLx?=
 =?iso-8859-1?Q?08EuhY1Rey+0LqLMOYzADQpQX8nnayRAh85lvHu1OsLTMKfi/mZNdbpF2A?=
 =?iso-8859-1?Q?MkuJJEY6Zy3qODXQsGGisd0r1jcnFk2FAwNkcqh6gwkJiw2e355NdRsWNb?=
 =?iso-8859-1?Q?2Qf/zGArPFpvio7ID1hA7SJMHhD+16snSJYZ267/WsdALw4N+21vrS/aa5?=
 =?iso-8859-1?Q?2voCZLejLNPPlrqkfl+EZOnNqn+cOCxLUG7Dwoj3FXQ8zwd+TztKr913Gg?=
 =?iso-8859-1?Q?nxQFd4P9OWabCuNu746LrHYpdt2a6Mt4REU7+WgYQ8/dPd4YVuS4dSVQgM?=
 =?iso-8859-1?Q?f80MxCX0r8F/mC+/oc31+7Z9MwdQphrqYXZQtD+SjuQA26G7baL/8wiBwt?=
 =?iso-8859-1?Q?oYtHt/o9PQvBNPz1U8sS92kamQiHAb0omMBSIWgS5Lp1NVciuIPbhZVAIM?=
 =?iso-8859-1?Q?i3Cgj3ZcYUnSKSEcAJaWZiWUDu6fTOx/lQFkcccIbIBBpB4d9ejODRaixf?=
 =?iso-8859-1?Q?Jn3n1N2FiPgprbsQUWyjlZB67BjJ+zFZ85TyKOhL+DR6u6255tYMVEO+Xc?=
 =?iso-8859-1?Q?7Rwrp//hQm4W7vmr0W1U+rvV1ck0vvJHxRlPrUzeCTiUjrT13Umoh/TeaQ?=
 =?iso-8859-1?Q?E7rVNN5dTj/JpW/2PpHzq95xJfR8Dg/793Bjnoh2Xl4c2YWG0LoNao1AkC?=
 =?iso-8859-1?Q?j0tdM9w4mMR/U+XWoTta44g/5vHt6RQm3ba4f4pN5vE3glIx6UcNyukS0y?=
 =?iso-8859-1?Q?xsNN+LsC3r/b7jCpIX6sRBLhTK8b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Nqy3krFmmUQqvPtomgoLnWyGUj5hIizz76ViAofBLWZyOHlVDbA1lXR4QZ?=
 =?iso-8859-1?Q?TDq5xKRV0mJMkE+4MVRtXIiOrLyXi0U1oGQQNAm0DaMKiWUUjYE8YGdfzn?=
 =?iso-8859-1?Q?ebUb5DT9Q10wgLBVeMjl5v7K8K2NYnx9LCodPhuudoScB7FJsMYAAlmUx5?=
 =?iso-8859-1?Q?ULFemckKTteMfq8cQ5q2Ps81N1GS2khtoLRgCnJx4yLV5TfuD81k89Ggg3?=
 =?iso-8859-1?Q?GdPTiN0v6KGmNODaU9ZdqbyM+RidWlKmqvF81IvRsubDF6Si9kDTJInPnB?=
 =?iso-8859-1?Q?loDn55e5F90cFTM2acxsFDXCoe1DL7BNT8iQck2ha6ALTeq2E7SpHciYvI?=
 =?iso-8859-1?Q?DhCVpA9xy7WE+YwY7r4Di137WXYgMyXfy5x9hRN/+Q4kls5S2tRO2BSSa/?=
 =?iso-8859-1?Q?WcS4iWaqV25qrPKr+M08myozkpEtFsj8ilMAaN5qNj60QaoKeP9kAO5zmU?=
 =?iso-8859-1?Q?yFGatlQVn4DzsuO0MH/hllijCUI1sjLG/lMd3jUMXMrEpFfERcPlfW1+6j?=
 =?iso-8859-1?Q?IgRaQ3fmjtjN0bz8JXwoToPEbnOHxNVnjXLnVnjlagel6F8oNzaev95oyB?=
 =?iso-8859-1?Q?iu6wB338nDOXgXE/WOCx/MMtw2Wmh+39awgtwU7N5eGkaT7Qgo4SK5BJE3?=
 =?iso-8859-1?Q?WS7zQwcyjo/Nl+dR0lQSIRXqwUQlf69iiyyGHubu0H2MFK0LsGZ7KEqi9U?=
 =?iso-8859-1?Q?32jWATmZ1M1GfM65lXf2XxUN9ObEenFIfb7NWdcgZ7gdhqloFHckfECTMO?=
 =?iso-8859-1?Q?WI0HXDVhSIU1EhBBavk5RzhnTPdOAWXQyW26Wtg3ZdwyZEem/gXFK9FsLv?=
 =?iso-8859-1?Q?WxzEarbXWoDU8oIMQdwQvguzFJnPXG89wZQMMhitdH+oitNpoiX36KiKBD?=
 =?iso-8859-1?Q?MfRXoCUVpfLkdPI+m9rcjJmtmpXILRVm/yTXiSlM04DDhoHuw9GHhxEFtm?=
 =?iso-8859-1?Q?6666cqWbF7WEANxUFBMb/kazG6oBMyYwd/Nd1zctuXfoJr7166AdZcw93Q?=
 =?iso-8859-1?Q?TTAmcDcWIUvxrFWcjaIY4loNzRed47SBriyBb1lwtUelDxbwa0d0cby2Zi?=
 =?iso-8859-1?Q?Xi7gpWmTJwAB3OrYA5aIOANO05GfiddgjIUaYd6BwBpefbc7BeeUIT667v?=
 =?iso-8859-1?Q?iSqMB/J5+iKZOS1iJ+7cHKspzbl3dBF8YwOZVOHm2RASMhxmby3vyJF/Q/?=
 =?iso-8859-1?Q?1SWgLS4BN2bo1SOTske76HLWEzsEPnp9cKMrh/xQPDjxZFI57G33ZPJW9i?=
 =?iso-8859-1?Q?M8UCXjIimcpba05rVNVDhh0vSQGffrBByhve5cNKOCo7oSTXIV5wLg5fUg?=
 =?iso-8859-1?Q?vr38M5A5A/zKwZVYNRTT+WCTUugvGo5O3SqgTilIqqehkpywjL0vZrmv83?=
 =?iso-8859-1?Q?CVJgwaBc5ushbYH9m+9Jo+Zx1oulcHBhJkAiVweZtBO8HFbSecsAgJjr4q?=
 =?iso-8859-1?Q?ql13Kgu8aSWkUEX2mBVD3IMJ0LaL0qFsMDtvI4XsYE/eSC+iO8AoqYYqbv?=
 =?iso-8859-1?Q?B3vwckc8dA/CvVqIpC1HkZsCANDNPasKL7uUPazthY3A6slGMENryvQEHV?=
 =?iso-8859-1?Q?LqWUQl/16kM6XRMqBrYioWa+zHQe+fGzJLmyARdaAVc8EXZZxS7QMm/V6N?=
 =?iso-8859-1?Q?IST1Y9Bw+jBAkJMRol7v320SxyGhQ0jw6RRy3nuJj0zvbj63f+M7jCRBvd?=
 =?iso-8859-1?Q?7uelQi8gg8hB5okOT+w1qDKPJGhZPFYAN8jxlXUnn8y15MBofUhDkXrvCU?=
 =?iso-8859-1?Q?o2uwxf3sgEaPos1oDUd1cIqK+568nLTZYsT4RwxfaAtMTouaSGrPo1GXPx?=
 =?iso-8859-1?Q?LK7GHQZhPA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 637d2bd7-c968-43bb-81ef-08de6067fd40
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 01:28:08.1195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GsFixLqOnd+cPg6UEp0aPVnEC3hdlsRmnOACK74acHd6ffKiF2F64QbWxHEO+qTNbce/N/50zYvPsBegm0BLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7121
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

On Thu, Jan 29, 2026 at 11:35:44AM -0800, Matthew Brost wrote:
> On Thu, Jan 29, 2026 at 07:30:01PM +0100, Thomas Hellström wrote:
> > On Thu, 2026-01-29 at 10:03 -0800, Matthew Brost wrote:
> > > On Thu, Jan 29, 2026 at 04:39:37PM +0100, Thomas Hellström wrote:
> > > > Hi.
> > > > 
> > > > On Thu, 2026-01-29 at 12:51 +0000, Satyanarayana K V P wrote:
> > > > > CCS save/restore batch buffers are attached during BO allocation
> > > > > and
> > > > > detached during BO teardown. The shrinker triggers xe_bo_move(),
> > > > > which is
> > > > > used for both allocation and deletion paths.
> > > > > 
> > > > > When BO allocation and shrinking occur concurrently, a circular
> > > > > locking
> > > > > dependency involving fs_reclaim and swap_guard can occur, leading
> > > > > to
> > > > > a
> > > > > deadlock such as:
> > > > > 
> > > > > ======================================================
> > > > > WARNING: possible circular locking dependency detected
> > > > > ------------------------------------------------------
> > > > > 
> > > > >       CPU0                    CPU1
> > > > >       ----                    ----
> > > > >  lock(fs_reclaim);
> > > > >                               lock(&sa_manager->swap_guard);
> > > > >                               lock(fs_reclaim);
> > > > >  lock(&sa_manager->swap_guard);
> > > > > 
> > > > >  *** DEADLOCK ***
> > > > > =====================================================
> > > > > 
> > > > > To avoid this, allocate CCS save/restore BB BOs using GFP_ATOMIC,
> > > > > preventing reclaim from being invoked in this context.
> > > > > 
> > > > > Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy
> > > > > commands
> > > > > with BO")
> > > > > Signed-off-by: Satyanarayana K V P
> > > > > <satyanarayana.k.v.p@intel.com>
> > > > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > 
> > > > If shrinking and allocation is indeed happening concurrently, then
> > > > GFP_ATOMIC is highly likely to fail. In fact it shouldn't be used
> > > > if we
> > > > can't gracefully recover from a failure or if the failure doesn't
> > > > matter at all, like in debugging cases where we can lose data.
> > > > 
> > > 
> > > This is a good point. We might need to rethink this one. Would
> > > GFP_NOWAIT be better here? Also as you have hit on - only the
> > > allocation
> > > path can fail which is handled gracefully (i.e., the shrinker path
> > > doesn't rely on allocations).
> > 
> > I think if the lock is needed, the typical approach would be to split
> > bb_new into alloc() outside the lock and init() inside the lock if
> > needed. It looks like tlb_inval is using GFP_ATOMIC as well, so should
> > be able to benefit. That touches drm code, though, but I think
> > GFP_KERNEL should be used throughout unless we have a backup path or
> > don't care about failures.
> > 
> 
> +1. I talked this over with Thomas a agree spliting alloc() and init()
> is the best solution + likely can use this going forward or in some
> existing cases.
> 

Thomas - since this is a Fixes patch should be start with this patch as
is (maybe s/ATOMIC/NOWAIT) for easy backporting then following patch in
the series does alloc() / init() split? I have feeling the split will a
fairly big diff given it will likely touch 4 layers.

Matt

> > > 
> > > > I'm trying to wrap my head around the sa manager shadow approach
> > > > and it
> > > > seems to me like external code putting the sa manager in a
> > > > particular
> > > > state and the internal lock is accessed from outside the sa code
> > > > with
> > > > no clearly defined locking rules / asserts? IMO it's a very odd and
> > > > fragile construct, in particular when used with guard() where it's
> > > > unclear exactly what scope is needing locking.
> > > 
> > > The lock protects:
> > > 
> > >  - xe_sa_bo_swap_shadow through xe_sa_bo_sync_shadow, so this
> > > includes
> > >    xe_bb_ccs_new as it picks the correct SA based on shadow state.
> > 
> > So then basically all (or most) calls that touch a shadow-enabled sa
> > manager need to be called under the lock?
> > 
> 
> Correct. So I think the guards in the correct places.
> 
> Matt
> 
> > > 
> > > > 
> > > > I'm trying to find some documentation to explain why this is used
> > > > and
> > > > the only thing I can find is 
> > > > 
> > > > "Directly clearing the BB lacks atomicity and can lead to undefined
> > > > behavior if the vCPU is halted mid-operation...."
> > > 
> > > This could be improved.
> > > 
> > > > 
> > > > But what if the vCPU is halted during xe_sa_bo_sync_shadow()? What
> > > > is
> > > > exactly is the atomicity in this case? 
> > > > 
> > > 
> > > The vCPU is updating the shadow buffer which isn't programmed on the
> > > GPU
> > > so if it interrupted mid-instruction writing, the GPU doesn't hang on
> > > a
> > > partially written instruction.
> > 
> > Oh, so we're updating a buffer simultaneously executing on the GPU?
> > 
> > > 
> > > Some back ground, I had suggested a AVX based solution to write out /
> > > clear instructions solution [1] but it was rejected in favor of a
> > > shadow
> > > buffer solution which appears to have lockdep issues.
> > > 
> > > Any ideas here would be helpful.
> > 
> > I still don't fully get the flow, I must admit, and the interaction
> > with the CPU-buffer we already have there on DGFX...
> > 
> > Thanks,
> > Thomas
> > 
> > 
> > > 
> > > Matt
> > > 
> > > [1] https://patchwork.freedesktop.org/series/156482/
> > > 
> > > > Thanks,
> > > > Thomas
> > > > 
> > > > 
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_bb.c | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_bb.c
> > > > > b/drivers/gpu/drm/xe/xe_bb.c
> > > > > index 8b678297aaa2..355365625df9 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bb.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_bb.c
> > > > > @@ -62,7 +62,7 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32
> > > > > dwords, bool usm)
> > > > >  struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> > > > >  			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> > > > >  {
> > > > > -	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> > > > > +	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_ATOMIC);
> > > > >  	struct xe_device *xe = gt_to_xe(gt);
> > > > >  	struct xe_sa_manager *bb_pool;
> > > > >  	int err;
> > > > > @@ -78,7 +78,7 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt,
> > > > > u32
> > > > > dwords,
> > > > >  	 */
> > > > >  
> > > > >  	bb_pool = xe-
> > > > > >sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
> > > > > -	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
> > > > > +	bb->bo = __xe_sa_bo_new(bb_pool, 4 * (dwords + 1),
> > > > > GFP_ATOMIC);
> > > > >  
> > > > >  	if (IS_ERR(bb->bo)) {
> > > > >  		err = PTR_ERR(bb->bo);
