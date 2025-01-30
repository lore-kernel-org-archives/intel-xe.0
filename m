Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713D3C0218D
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 00:28:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B8810E8CC;
	Thu, 30 Jan 2025 00:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EyMj9pLF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304AB10E229
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 00:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738196924; x=1769732924;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=91b5dibCDS/90OAo/rSErfzpGROVT2Uu+6FFtXaEjLY=;
 b=EyMj9pLF3Zcvo6JW+4kzeV/W13SB0jh8LSO8+o4/f2My2oJu9eN97cTS
 QrPDnUlwN0NO77SMw8oglpaGxuwvVISmZU29OHNR10LYfspe0BmXqEAZz
 cIUqBG8r4P920hB7YDaabw1XW2OpjBJJUWmMlMkwmmapHGLC2Mxk7aNXG
 yNY//CXGvaWJ1U5lC0mgXswg4dXmdqtQw3rdVvfN07+098VWp6jzRbRAI
 tZcUaugJ8jtXoEohTiXnxVmMiL7lV/OOJdON8udJ6cmTOB0ZoFZbE0yrl
 DOHv08FPUX8LBhhmOyRlK8J+Cs4+n1lWswwkCe+Q9efoyCWV95w25ktw9 g==;
X-CSE-ConnectionGUID: rlRhs4VyRI2mbvoIxE9mZA==
X-CSE-MsgGUID: ctbk9B+uRZiqqhgmVcK08g==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="49718752"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="49718752"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 16:28:44 -0800
X-CSE-ConnectionGUID: OPp5XhquSq+bkHUhkg9bSA==
X-CSE-MsgGUID: rxiQh125QoS0MO44Qx11NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146378378"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 16:28:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 16:28:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 16:28:41 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 16:28:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFQCa4gtX5iYe2M93syjrCV+WWqKgRA1GGGm9CxTWWhA10XHUOwg8WsDx+oLd3JL7qb1MuLwgXhFw9Ptqeoi2m1ehQWzj0Wjg4VXrVMg9t/og1E7JRKE64KPL1YW5Raw85ZHvPmV7QrNTQX/a36SEMUukmDOLxxwMKvAIQTDaQ7KMpEPTarmeU6sqbx161+TrZ9EZKkScAxMcV9w8pzGgaybmFhFKvF56HJ17T4IeFnBY7NNdwjkWShuF+80AbI38yrGVm99Hq2Ikac34768WiqGCqmmuO1uh2MEGhX0SnkSgDuO6YItY0hvzJ6B3KQ4rj6EQNggFLXSxH49aV8rSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUZwzYx9r2Xbb21/nlL40scg1/lCNf5zMjSsScIaXiI=;
 b=G8j/TP244o+AgqXHQ5vHBCiwSzrKjZ+NVTqr9ahKmNz7XQK6LaUViy9d9oQLJ0Io7hQHUeJcMVJ2wz7wEPv+8iUzf4XlLIy41e9dzWp+wApCZ7nBL4HUjCpqxphozfN8UezulXbLDiRoaH7kK8LuWYubE9nQEACWc+QJJ4XfRHrH9d6xSatDSun/zyJLbGvoStJ8Q73ie/ip2srCgZO7B3ZHp34dLnCwp/jnbTY+xSZ608Cwo5J9TrWNiR2sKilYvTSfqt99GML0HirbC/Ezm36u6/bkQARrkU6Ct99InBjfQmAatbMhj8bbhp0iUzD5Hj9g5ScfUN3Khuno3+aNfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY8PR11MB7798.namprd11.prod.outlook.com (2603:10b6:930:77::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 00:28:38 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 00:28:38 +0000
Date: Wed, 29 Jan 2025 16:28:36 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 1/8] drm/xe: Add per-engine-class activity support
Message-ID: <Z5rHtFUIbLNRfBfk@orsosgc001>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129101653.1976699-2-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0309.namprd03.prod.outlook.com
 (2603:10b6:303:dd::14) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY8PR11MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 38313131-77fa-4094-18b4-08dd40c50a13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDVUT0d5bFZ2WUl3ck83TEJpVU1oeENkdWxpbVBseWdWaWRQTFJhNVNpd1Jn?=
 =?utf-8?B?SDVEaUxrY1NlbTZXaFNZUktsbDcrUXRwS0d0QTNvSk5iWGtDVjh4MEVKT1pw?=
 =?utf-8?B?WkoreGJSNzlHWkNpVS9kYU9MeW9FWTExUkw0a3Zka3A4QXRGT2NYR2pwM0Y2?=
 =?utf-8?B?YjgySmpvWDNUajk5NE8yMFVRVHNRNEpkZzc4UDcxS1oxNmlBS3ZmcXBhYVZC?=
 =?utf-8?B?Vk1oR2xmeHI5K2wxYzlwblRROGpsV2tZaHdyOWNsdzdxT0U1RzR6WXNUcUpG?=
 =?utf-8?B?eG5DYTdnTmV3RDJ6SzIxK0hGSjYyYXR1MVNteTVTanBKS3d1MDVmVTlicXhW?=
 =?utf-8?B?MjNOYXpXSGw5VjQxODZMakJIMVdjYWJDU1NDNGpacm9KYWJVWHNVWVBzRFFw?=
 =?utf-8?B?WnpJaSs3QlBOQlh0cFc2Zm10ZWczbTJtOUxoMmJFQXljRkFMMGJINC9sUGxj?=
 =?utf-8?B?N1F0WVoyT1pxdFZza3RBQlB6d2Q0RkxnZlZMN1Vmb1o1VHZUWngxS1FOWktK?=
 =?utf-8?B?TUxLZWxCYVhFS21JdWJpblZlWXBvbm1TZFZOSU9vZk4wS09vUnN0TVNIaG9a?=
 =?utf-8?B?MUljdmd5WlZIbWNnT0laTEx0c0YvSDNVWnhJWThtNEJFaFFDaG5hTW5vMy90?=
 =?utf-8?B?QU5sOWpBQU5OOGh4b0NMdlJGMzQ1d1BIak9yb2dpR3FBSzVNd0F3d1phdURh?=
 =?utf-8?B?VENpQzFjNUQ0UW5TOCtORUhLcFNJRlZiU3FmaGdiRUVUVWhPTkJBU1RhdGFm?=
 =?utf-8?B?dzFqOGNNNElxeWdhR2dCVmo1Vzg4UmgzRUxHdzNWaTM1Y1dwZzJicGZpZjdw?=
 =?utf-8?B?a29Dd0Vab1VTVDNjTy9FcE5JN3ZadzNTZ3ZyNmVEMnlmUTVrL2Y0QzN2YmNI?=
 =?utf-8?B?VE1McWxZSjQ1bUx1T2hSOFgxRXREWDl5cHBZSXVPbUh4eHRGSkg0djZVQy9n?=
 =?utf-8?B?cGVEZ1NYaFRHQWc3VGdqbUh5T2tmNENXY0hCSUJJanpnRVR0UU1rNlhBcWlR?=
 =?utf-8?B?YnNWOG1kQUZyVHZPTVVjS29ubW1sdm9wUlpQVUdaYTd4VVZ5ZWF3WC9hOXVs?=
 =?utf-8?B?aWUvbVBrcjJFbXFYSlBLN3V5KzR5d3MzZEVMNGxMZElCVHdjemtuQnpmWDJ4?=
 =?utf-8?B?YlJNRWJwQ0JqSWlYQjN4WHl0Rk0vaHpwSjJXK08rZnBCNmIzZUVNc2l6Zm84?=
 =?utf-8?B?cHNGZmplcThzbXQ3MjdzcDE2V2R2NXlvUWpuZnZkdzhKclNsazV5Z0FwckxL?=
 =?utf-8?B?OHg2L3ltK2dram1SVUVOWFZPSndLeG1rd1BKNmttRnBHcGoxR0hkRk0ycW1D?=
 =?utf-8?B?OHpKQjIybkkrTkJHSnJyRUhQR1h4N2w3c0hjNU9JeDY5SmRWYysva1k3bHVV?=
 =?utf-8?B?MkM4SFBIenlDTnhnOHI5eGV4WEp2RDNqaisyL0xWeWdSS01kVlJ1bTlIV2RY?=
 =?utf-8?B?eGREUmw2RHBJb0pBdTRQMS9Ebi8xNGFNcW9zenhualc0NXVRNkFTNUtKbnh6?=
 =?utf-8?B?aVFxQVE4amtMQ3dONFNic3VUeEhsQVRmWTNqYjEvRFhPc0lQclVpeG9iU3JI?=
 =?utf-8?B?WDdQd0d5d3hEK3hFY25GUUJIdDVTMEtyV3dINVpUbDdzY3E5anVPRURqVnRr?=
 =?utf-8?B?b2lrK0VVTVRjRXZON21lR3JYd3F1ZllZTzVrTUo1Rm1vNXRwT00vWmVnd2RV?=
 =?utf-8?B?R3lEbzZjbXd2QmxzYmJFcWU4Q25kZDBtcVdOeHEwNDZxY0xlNjJHUG9TL0JP?=
 =?utf-8?B?RkNUTjdka1UxK09ONkFzS3pPWXVRR1RSQmZEVjBpbytXVXZZMmdiNmdCWFJK?=
 =?utf-8?B?VWwxSVZ6VU0rQUVjUzVWVjR2UkpVWnUvNURPTVVCSGdHZUk2cmZYeS9KaGE1?=
 =?utf-8?Q?/KlL0p7YKMQzu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUJDRGxkbnQ1aFQ1c2xIMkYyejlTVE5xeCtPUkMzUnZ4S2UrUkZHS0NkWEFR?=
 =?utf-8?B?NUNaTWR2VVZIV2hIOFEzM1pmT2FpWmRzcWdTeWFwZktLTnh1YUNsTi9wV2ps?=
 =?utf-8?B?RDlsMm1MYk1rMENiRnpYM0I1dUU1L0dUSnNJWTZDeDc4bkhjblRWUUkwdDZT?=
 =?utf-8?B?ZGkvakY2RUVaYW1LMmdnVVAzK1piYXp5Mko2VVRVemFRRkN1OVpTZDF1aEIr?=
 =?utf-8?B?a0xGY1BHdEQ0WmtqRFV6dG44U0lnenAzRHNtS3NPTThLRFdzTXoyaGJ3YnhQ?=
 =?utf-8?B?SW0yblZEcmR6S2dMek9SWGlhSTdXL0hCN1d0MmtTQlVPamlTTDF2MEFQTjJx?=
 =?utf-8?B?UzM1K0NqWS9KejRjTWo2WlVvUi9QVGpXalcrb0UyYkhoRElBWGltZzJmR1Nm?=
 =?utf-8?B?bERiTnZKL0NWWmlDYkxxNTRsQkptK0VaNHJOdi94SjM1bHN5MGhZTXRhc2RY?=
 =?utf-8?B?bCtxdWY3S1lucEVScVFyV0M0eWNsbnQwMndoSnlmTkVTWDgrQ2tXUWtDZGM4?=
 =?utf-8?B?UEdBM1NKUXJhaGhBc0VISU1SZ1N0NHhSYUQvK3BmQlVGVEYyR2lOb0NseUp2?=
 =?utf-8?B?UFEzVktBWnVqK29BSFFnd0V2VHFaVFJvWHVsZ1BZTmdyMXRHeFBIREkrcm5W?=
 =?utf-8?B?WlNmOXo4NU1MZDdrbTU0azduT2E1Z1Bva2FQb0toYVgya1VXRmxFbkxVMmQz?=
 =?utf-8?B?YnJWTWlQMWNSdUdpZ2hZVXZDQ2MySUFacDhwYVlhWnlsTXBQUjNxbDQzVVQr?=
 =?utf-8?B?M2QxMkh4bHI0UTA2MVUyZUhNUUswV0E2QXJNZW42MjBIK2lhNUVBRUpqZjFy?=
 =?utf-8?B?NU01dUlHVzRGT2JGcWFNZTVtL3kwNUxnMEZsN2FhYW5PUXVKNlkwM05pWXd1?=
 =?utf-8?B?R2tPRW9VRjlkWFZMektjYXhLOThlYkg0TFBMR3NXR2xvV1h6V1BIRGZ2VGgx?=
 =?utf-8?B?c0t5RnN4MzFMVHNCNm9yOGVoRW4ydExlbzgwcWVPVnhmakJFajdCSHlpMG1N?=
 =?utf-8?B?bGVPdXh0RStsSmFCbjBXWXErb3MwWEZVUkZmRk14c29nVlIyUnkvakFQT09u?=
 =?utf-8?B?ZnM5MEdJMHY3Qm50QUpXanlTYk1WdlJFSnV5Uk41ZlVNZEZlQ2trZngxUWkw?=
 =?utf-8?B?a25iN0g5bmRJRVArTTFubTVibGxyd2ZMcStFOTJqcms0YmlzWGdHTjVqeDVu?=
 =?utf-8?B?YWNyTXpIYlc1MEZzSDZXT1pBVFhCL3ZiVzQ3d3BYTnlGYkxzdUVVa1MvTFdS?=
 =?utf-8?B?Zms1VUFvZ0xsOFQyelBnbFRHVVhlSy92ckkxQkg2RWZWc3JoY0s2ZU9GR3BW?=
 =?utf-8?B?VnJNNDBtQlVSWG5pK2Y0UVB5aERuaGFza0RuS0ptSzlRalJyRmQxMWJUZVpq?=
 =?utf-8?B?RnFpSkM0ellMQU1jVnJsdHN0L3h3RldhcFBKMFE2R3RFVzdrZ2xqRGVucTd4?=
 =?utf-8?B?Tkw2ckZuWXFldjYybitJVVlMYTZZbEhUeDJSNmg4d0hQZVFDRFZMcTZVNG9p?=
 =?utf-8?B?dXNSTng1cVlKT0VydC9FWDhNQTkvdnNlQWRoN2N1YktnQzBNeW00bnEwSm5a?=
 =?utf-8?B?Sk96LzRtaGEvODRmZUxwa2lTdmxWciswRDVKcHQ0OVJrYUgyNXE4ekU4T0ls?=
 =?utf-8?B?VmYxSFpCOEU3djRSS0lkc29UY0NrOFJ3ZWNKSHVTR3VWRUpBTmd0YWlyd2dh?=
 =?utf-8?B?TXk2WU1PeE0wcDhpbFVYdE5pMmFFKzdBaEZnaC9GT0t0L0NJeFRzSlZ1aU1R?=
 =?utf-8?B?UTZ3NmtnWGdzaXBtWWtCNzQ1M2N1c25GK1oyRE1oNnA3OWROVkt6QnR2Zk4y?=
 =?utf-8?B?bXBOcEFjeTN4cFpWM1NyMitKbFRZRDh3MktWMDdFbHNQNTFKd0h3aTVtK2JE?=
 =?utf-8?B?bTg2RGRVb3ZkUkxCWHVLR29sQ1Y5dkljdTZPeFFmMWVIdHB4Rmh5SmcvTE85?=
 =?utf-8?B?VUxPWGNRRzMzVWc4a0ltNjlWb01kMjdNazZ5TENvZGxwaGkvdUVCdFBwSi8y?=
 =?utf-8?B?ajhZUXpjblVLS1E0MElsOGZueFN2Ym5VVGNpTllubzlQdDJWS3ROOHVqNWw2?=
 =?utf-8?B?WkxPWkdxSExFRERQN3dJYUZqV1ZMcXhoNnoreFZXQ1BOWGlLbGNWTGJGM3Rl?=
 =?utf-8?B?MUphK0duRDUyallHWW5WNUJIczE5MStXODFiWUdUSkhBaVdCK0VGNVNRYkJn?=
 =?utf-8?Q?XXRXtuenffuIKaQNP7s6dfg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38313131-77fa-4094-18b4-08dd40c50a13
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 00:28:37.9927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utcH84D0OKGauyu33ZuX0M7X6Oft5O/lTw5Y+N1js1nk0Q3SiBsnOrYOWY9fs5Mm1Z3SjwKzKEHYCqAC1MLdxndOy2uvN3xOTqSCECYiFIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7798
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

On Wed, Jan 29, 2025 at 03:46:44PM +0530, Riana Tauro wrote:
>GuC provides support to read engine counters to calculate the
>engine activity. KMD exposes two counters via the PMU interface to
>calculate engine activity
>
>Engine Active Ticks(engine-active-ticks) - number of active ticks for engine
>Engine Total Ticks (engine-total-ticks) - total ticks of engine
>
>Engine activity percentage can be calculated as below
>Engine activity % = (engine active ticks/engine total ticks) * 100.
>
>v2: fix cosmetic review comments
>    add forcewake for gpm_ts (Umesh)
>
>v3: fix CI hooks error
>    change function parameters and unpin bo on error
>    of allocate_activity_buffers
>    fix kernel-doc (Umesh)
>    use engine activity (Umesh, Lucas)
>    rename xe_engine_activity to xe_guc_engine_*
>    fix commit message to use per-engine class(Lucas)
>
>v4: remove forcewake as engine is already running
>    when reading gpm timestamp

+ Rodrigo

Sorry, I think I mentioned offline that the runtime pm get is sufficient 
for reading this register, but it's not. It does need a forcewake of the 
GT domain.  At the same time, we cannot use the xe_force_wake_get 
because of the lockdep issue you mentioned and also I assume that 
xe_force_wake_get may sleep and the event may be read from irq context.  

I would check if we can add a helper xe_force_wake_get_if_active() and 
just use that to bump up the wakeref.

@Rodrigo, @Vinay Any thoughts on this ^ ?

Thanks,
Umesh

>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/Makefile                   |   1 +
> drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
> drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
> drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 317 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  18 +
> .../gpu/drm/xe/xe_guc_engine_activity_types.h |  89 +++++
> drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
> drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
> 8 files changed, 451 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
> create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
> create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 328aff36831b..7e93461c60bd 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -33,6 +33,7 @@ xe-y += xe_bb.o \
> 	xe_device_sysfs.o \
> 	xe_dma_buf.o \
> 	xe_drm_client.o \
>+	xe_guc_engine_activity.o \
> 	xe_exec.o \
> 	xe_execlist.o \
> 	xe_exec_queue.o \
>diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>index fee385532fb0..ec516e838ee8 100644
>--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>@@ -140,6 +140,7 @@ enum xe_guc_action {
> 	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
> 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
> 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>+	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> 	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
> 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
> 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 096859072396..124cc398798e 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -358,6 +358,8 @@
> #define   RENDER_AWAKE_STATUS			REG_BIT(1)
> #define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
>
>+#define MISC_STATUS_0				XE_REG(0xa500)
>+
> #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
> #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
> #define FORCEWAKE_GSC				XE_REG(0xa618)
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>new file mode 100644
>index 000000000000..088209b9c228
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>@@ -0,0 +1,317 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+#include "xe_guc_engine_activity.h"
>+
>+#include "abi/guc_actions_abi.h"
>+#include "regs/xe_gt_regs.h"
>+
>+#include "xe_bo.h"
>+#include "xe_force_wake.h"
>+#include "xe_gt_printk.h"
>+#include "xe_guc.h"
>+#include "xe_guc_ct.h"
>+#include "xe_hw_engine.h"
>+#include "xe_map.h"
>+#include "xe_mmio.h"
>+
>+#define TOTAL_QUANTA 0x8000
>+
>+static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+{
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>+	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>+	size_t offset = 0;
>+
>+	offset = offsetof(struct guc_engine_activity_data,
>+			  engine_activity[guc_class][hwe->logical_instance]);
>+
>+	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
>+}
>+
>+static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>+{
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>+
>+	return buffer->metadata_bo->vmap;
>+}
>+
>+static int allocate_engine_activity_group(struct xe_guc *guc)
>+{
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+	u32 num_activity_group = 1;
>+
>+	engine_activity->eag = kmalloc_array(num_activity_group,
>+					     sizeof(struct engine_activity_group),
>+					     GFP_KERNEL);
>+
>+	if (!engine_activity->eag)
>+		return -ENOMEM;
>+
>+	memset(engine_activity->eag, 0, num_activity_group * sizeof(struct engine_activity_group));
>+	engine_activity->num_activity_group = num_activity_group;
>+
>+	return 0;
>+}
>+
>+static int allocate_engine_activity_buffers(struct xe_guc *guc,
>+					    struct engine_activity_buffer *buffer)
>+{
>+	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>+	u32 size = sizeof(struct guc_engine_activity_data);
>+	struct xe_gt *gt = guc_to_gt(guc);
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	struct xe_bo *bo, *metadata_bo;
>+
>+	metadata_bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(metadata_size),
>+						   XE_BO_FLAG_SYSTEM |
>+						   XE_BO_FLAG_GGTT |
>+						   XE_BO_FLAG_GGTT_INVALIDATE);
>+	if (IS_ERR(metadata_bo))
>+		return PTR_ERR(metadata_bo);
>+
>+	bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(size),
>+					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>+					  XE_BO_FLAG_GGTT |
>+					  XE_BO_FLAG_GGTT_INVALIDATE);
>+
>+	if (IS_ERR(bo)) {
>+		xe_bo_unpin_map_no_vm(metadata_bo);
>+		return PTR_ERR(bo);
>+	}
>+
>+	buffer->metadata_bo = metadata_bo;
>+	buffer->activity_bo = bo;
>+	return 0;
>+}
>+
>+static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>+{
>+	struct xe_guc *guc = &hwe->gt->uc.guc;
>+	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
>+	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>+
>+	return &eag->engine[guc_class][hwe->logical_instance];
>+}
>+
>+static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
>+{
>+	return mul_u64_u32_div(ns, freq, NSEC_PER_SEC);
>+}
>+
>+#define read_engine_activity_record(xe_, map_, field_) \
>+	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity, field_)
>+
>+#define read_metadata_record(xe_, map_, field_) \
>+	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, field_)
>+
>+static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+{
>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>+	struct guc_engine_activity *cached_activity = &ea->activity;
>+	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+	struct iosys_map activity_map, metadata_map;
>+	struct xe_device *xe =  guc_to_xe(guc);
>+	struct xe_gt *gt = guc_to_gt(guc);
>+	u32 last_update_tick, global_change_num;
>+	u64 active_ticks, gpm_ts;
>+	u16 change_num;
>+
>+	activity_map = engine_activity_map(guc, hwe);
>+	metadata_map = engine_metadata_map(guc);
>+	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
>+
>+	/* GuC has not initialized activity data yet, return 0 */
>+	if (!global_change_num)
>+		goto update;
>+
>+	if (global_change_num == cached_metadata->global_change_num)
>+		goto update;
>+	else
>+		cached_metadata->global_change_num = global_change_num;
>+
>+	change_num = read_engine_activity_record(xe, &activity_map, change_num);
>+
>+	if (!change_num || change_num == cached_activity->change_num)
>+		goto update;
>+
>+	/* read engine activity values */
>+	last_update_tick = read_engine_activity_record(xe, &activity_map, last_update_tick);
>+	active_ticks = read_engine_activity_record(xe, &activity_map, active_ticks);
>+
>+	/* activity calculations */
>+	ea->running = !!last_update_tick;
>+	ea->total += active_ticks - cached_activity->active_ticks;
>+	ea->active = 0;
>+
>+	/* cache the counter */
>+	cached_activity->change_num = change_num;
>+	cached_activity->last_update_tick = last_update_tick;
>+	cached_activity->active_ticks = active_ticks;
>+
>+update:
>+	if (ea->running) {
>+		gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
>+			 engine_activity->gpm_timestamp_shift;
>+		ea->active = lower_32_bits(gpm_ts) - cached_activity->last_update_tick;
>+	}
>+
>+	return ea->total + ea->active;
>+}
>+
>+static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+{
>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>+	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>+	struct guc_engine_activity *cached_activity = &ea->activity;
>+	struct iosys_map activity_map, metadata_map;
>+	struct xe_device *xe = guc_to_xe(guc);
>+	ktime_t now, cpu_delta;
>+	u64 numerator;
>+	u16 quanta_ratio;
>+
>+	activity_map = engine_activity_map(guc, hwe);
>+	metadata_map = engine_metadata_map(guc);
>+
>+	if (!cached_metadata->guc_tsc_frequency_hz)
>+		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
>+									     guc_tsc_frequency_hz);
>+
>+	quanta_ratio = read_engine_activity_record(xe, &activity_map, quanta_ratio);
>+	cached_activity->quanta_ratio = quanta_ratio;
>+
>+	/* Total ticks calculations */
>+	now = ktime_get();
>+	cpu_delta = now - ea->last_cpu_ts;
>+	ea->last_cpu_ts = now;
>+	numerator = (ea->quanta_remainder_ns + cpu_delta) * cached_activity->quanta_ratio;
>+	ea->quanta_ns += numerator / TOTAL_QUANTA;
>+	ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
>+	ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, cached_metadata->guc_tsc_frequency_hz);
>+
>+	return ea->quanta;
>+}
>+
>+static int enable_engine_activity_stats(struct xe_guc *guc)
>+{
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>+	u32 metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
>+	u32 ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>+	int len = 0;
>+	u32 action[5];
>+
>+	action[len++] = XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER;
>+	action[len++] = metadata_ggtt_addr;
>+	action[len++] = 0;
>+	action[len++] = ggtt_addr;
>+	action[len++] = 0;
>+
>+	/* Blocking here to ensure the buffers are ready before reading them */
>+	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>+}
>+
>+static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>+{
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+	struct engine_activity_group *eag = &engine_activity->eag[0];
>+	int i, j;
>+
>+	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>+		for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
>+			eag->engine[i][j].last_cpu_ts = ktime_get();
>+}
>+
>+static u32 gpm_timestamp_shift(struct xe_gt *gt)
>+{
>+	u32 reg;
>+
>+	reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>+
>+	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>+}
>+
>+/**
>+ * xe_guc_engine_activity_active_ticks - Get engine active ticks
>+ * @hwe: The hw_engine object
>+ *
>+ * Return: accumulated ticks @hwe was active since engine activity stats were enabled.
>+ */
>+u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
>+{
>+	struct xe_guc *guc =  &hwe->gt->uc.guc;
>+
>+	return get_engine_active_ticks(guc, hwe);
>+}
>+
>+/**
>+ * xe_guc_engine_activity_total_ticks - Get engine total ticks
>+ * @hwe: The hw_engine object
>+ *
>+ * Return: accumulated quanta of ticks allocated for the engine
>+ */
>+u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
>+{
>+	struct xe_guc *guc =  &hwe->gt->uc.guc;
>+
>+	return get_engine_total_ticks(guc, hwe);
>+}
>+
>+/**
>+ * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>+ * @guc: The GuC object
>+ *
>+ * Enable engine activity stats and set initial timestamps
>+ */
>+void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>+{
>+	int ret;
>+
>+	ret = enable_engine_activity_stats(guc);
>+	if (ret)
>+		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>+	else
>+		engine_activity_set_cpu_ts(guc);
>+}
>+
>+static void engine_activity_fini(void *arg)
>+{
>+	struct xe_guc_engine_activity *engine_activity = arg;
>+
>+	kfree(engine_activity->eag);
>+}
>+
>+/**
>+ * xe_guc_engine_activity_init - Initialize the engine activity data
>+ * @guc: The GuC object
>+ *
>+ * Return: 0 on success, negative error code otherwise.
>+ */
>+int xe_guc_engine_activity_init(struct xe_guc *guc)
>+{
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+	struct xe_gt *gt = guc_to_gt(guc);
>+	int ret;
>+
>+	ret = allocate_engine_activity_group(guc);
>+	if (ret) {
>+		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>+		return ret;
>+	}
>+
>+	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer);
>+	if (ret) {
>+		xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
>+		kfree(engine_activity->eag);
>+		return ret;
>+	}
>+
>+	engine_activity->gpm_timestamp_shift = gpm_timestamp_shift(gt);
>+
>+	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, engine_activity_fini,
>+					engine_activity);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>new file mode 100644
>index 000000000000..c00f3da5513d
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>@@ -0,0 +1,18 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef _XE_GUC_ENGINE_ACTIVITY_H_
>+#define _XE_GUC_ENGINE_ACTIVITY_H_
>+
>+#include <linux/types.h>
>+
>+struct xe_hw_engine;
>+struct xe_guc;
>+
>+int xe_guc_engine_activity_init(struct xe_guc *guc);
>+void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>+u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
>+u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>new file mode 100644
>index 000000000000..a2ab327d3eec
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>@@ -0,0 +1,89 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>+#define _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>+
>+#include <linux/types.h>
>+
>+#include "xe_guc_fwif.h"
>+/**
>+ * struct engine_activity - Engine specific activity data
>+ *
>+ * Contains engine specific activity data and snapshot of the
>+ * structures from GuC
>+ */
>+struct engine_activity {
>+	/** @active: current activity */
>+	u64 active;
>+
>+	/** @last_cpu_ts: cpu timestamp in nsec of previous sample */
>+	u64 last_cpu_ts;
>+
>+	/** @quanta: total quanta used on HW */
>+	u64 quanta;
>+
>+	/** @quanta_ns: total quanta_ns used on HW */
>+	u64 quanta_ns;
>+
>+	/**
>+	 * @quanta_remainder_ns: remainder when the CPU time is scaled as
>+	 * per the quanta_ratio. This remainder is used in subsequent
>+	 * quanta calculations.
>+	 */
>+	u64 quanta_remainder_ns;
>+
>+	/** @total: total engine activity */
>+	u64 total;
>+
>+	/** @running: true if engine is running some work */
>+	bool running;
>+
>+	/** @metadata: snapshot of engine activity metadata */
>+	struct guc_engine_activity_metadata metadata;
>+
>+	/** @activity: snapshot of engine activity counter */
>+	struct guc_engine_activity activity;
>+};
>+
>+/**
>+ * struct engine_activity_group - Activity data for all engines
>+ */
>+struct engine_activity_group {
>+	/** @engine: engine specific activity data */
>+	struct engine_activity engine[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>+};
>+
>+/**
>+ * struct engine_activity_buffer - engine activity buffers
>+ *
>+ * This contains the buffers allocated for metadata and activity data
>+ */
>+struct engine_activity_buffer {
>+	/** @activity_bo: object allocated to hold activity data */
>+	struct xe_bo *activity_bo;
>+
>+	/** @metadata_bo: object allocated to hold activity metadata */
>+	struct xe_bo *metadata_bo;
>+};
>+
>+/**
>+ * struct xe_guc_engine_activity - Data used by engine activity implementation
>+ */
>+struct xe_guc_engine_activity {
>+	/** @gpm_timestamp_shift: Right shift value for the gpm timestamp */
>+	u32 gpm_timestamp_shift;
>+
>+	/** @num_activity_group: number of activity groups */
>+	u32 num_activity_group;
>+
>+	/** @eag: holds the device level engine activity data */
>+	struct engine_activity_group *eag;
>+
>+	/** @device_buffer: buffer object for global engine activity */
>+	struct engine_activity_buffer device_buffer;
>+};
>+#endif
>+
>diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>index 057153f89b30..6f57578b07cb 100644
>--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>@@ -208,6 +208,25 @@ struct guc_engine_usage {
> 	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
> } __packed;
>
>+/* Engine Activity stats */
>+struct guc_engine_activity {
>+	u16 change_num;
>+	u16 quanta_ratio;
>+	u32 last_update_tick;
>+	u64 active_ticks;
>+} __packed;
>+
>+struct guc_engine_activity_data {
>+	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>+} __packed;
>+
>+struct guc_engine_activity_metadata {
>+	u32 guc_tsc_frequency_hz;
>+	u32 lag_latency_usec;
>+	u32 global_change_num;
>+	u32 reserved;
>+} __packed;
>+
> /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
> enum xe_guc_recv_message {
> 	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>index 573aa6308380..63bac64429a5 100644
>--- a/drivers/gpu/drm/xe/xe_guc_types.h
>+++ b/drivers/gpu/drm/xe/xe_guc_types.h
>@@ -13,6 +13,7 @@
> #include "xe_guc_ads_types.h"
> #include "xe_guc_buf_types.h"
> #include "xe_guc_ct_types.h"
>+#include "xe_guc_engine_activity_types.h"
> #include "xe_guc_fwif.h"
> #include "xe_guc_log_types.h"
> #include "xe_guc_pc_types.h"
>@@ -103,6 +104,9 @@ struct xe_guc {
> 	/** @relay: GuC Relay Communication used in SR-IOV */
> 	struct xe_guc_relay relay;
>
>+	/** @engine_activity: Device specific engine activity */
>+	struct xe_guc_engine_activity engine_activity;
>+
> 	/**
> 	 * @notify_reg: Register which is written to notify GuC of H2G messages
> 	 */
>-- 
>2.47.1
>
