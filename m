Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01798606A32D
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MtrsS9qo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF4910EDE5;
	Mon,  2 Nov 2026 12:58:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762A010EDDB
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 12:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793624319; x=1825160319;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=XDHCdUYGOAfFIJ0K2RkT6WgdZEv/DBoRqgSLSajpZcI=;
 b=MtrsS9qoYO8UCxicRX4qtUOpjw/GF/r0KjUIdaO8QpGOzPpsQnBnoxk4
 +epdzGArpFxg8jXYExDPL69r0KclUj/9hKdFiEoPyXp5qHgly2Ak92dPo
 XjmUICVdcBBgpjTP+/DTvr1eS/0Q8lyRcjp6vDFvlWo6FgOsUIG3p1eac
 PD+khPCLXEem4xwL5jAULouGGGDNrjqVgHlTa3Px+GyNTBn+AaYeJWJqP
 H0ouyugLQMR7f7OitYubgr+IYz1hx+4OjA+Lhz1u5tlynZhSe2ea9331f
 cH8kNs/zBk2p4ZquQ1TMjbcVYp3DIB2rgbqEs0HkBQdON4bD3tzYfSk6c g==;
X-CSE-ConnectionGUID: 9j485xS6QgmiFfGiiC645A==
X-CSE-MsgGUID: UVHGE+lsRCKUyOoE/aC57w==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2316579"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2316579"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 04:58:39 -0800
X-CSE-ConnectionGUID: NUE1TP9KRua8fwUJhOKUpg==
X-CSE-MsgGUID: iwRUfUSoSiS3z9AAgavTSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6148805"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 04:58:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 04:58:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 04:58:38 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 04:58:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAmK3lm0n6My5TitGkkVqLdnPh0uIDByUulAMnbnmxyKAThX/mprgCcis7HreYq08i1nVMbzLorrwYcHBklC3Bdctoi8ujp6h2KzU9O4cFYDVSAogFZCkyWMJKJ0vf6CCrTtBnRpaZWoXor5VNm9RmBI9KqlexxdyhGPGCVlxfWPw80/nbl8eKcoDelFR/l0CPdnfbjX5FZSbTYDJfpPThLNOyBVgJ2wWfpP2EF1muoaIGwQCL+NyY2nAYl1INDMl+5BcTqeekjWKzl/GXXa/D3IKxvbeeUEPwVePXf1lmgE8fmtFGntndzLhvjtu67JAYt6B8AILawHLhQ/V5f2mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZrO8vJLDJZ1y6NixfT8cpujg5qMPEreSmbnPDJq11Q=;
 b=FURKyucqQ0aNrwABMeII2kS6t+DvQyZdyzKJKcSU/pxrMC0I1S25ZPYUvSDc2st7cqEztnFatoMN7g7K8elOfKRvgqScVrB2hcmfimMOW29F5YAsynxLnIY0JC/57VXxQmO/a5WYDRs8h84nIbzClWZxzKIpvA8pCek4mI+Eakr4j41tIk/fKRST6FTK2N0XS1uCJvI/ARPGOZjr5As2wLyjD/8XzHXmdwJ/A7cC4vDeNpZVCeFv6/RvNUqp0evyqg+XZ3xKVTbezOsvY/iZ3Wht6yHAObzLgR3KtOheHYDwi3OyTF7pPoAMoYR2PdC+AywaSDHjMpDppT8tVTACIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by LV8PR11MB8606.namprd11.prod.outlook.com (2603:10b6:408:1f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:58:24 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 12:58:24 +0000
Date: Mon, 2 Nov 2026 18:28:16 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 06/10] drm/xe: Drop early and redundant workaround
 checks in adjust_idledly()
Message-ID: <auiI6Eh4cBK4wmH6@bvivekan-mobl1>
References: <20261030-wa_16031259911-v2-0-919fa1c27070@intel.com>
 <20261030-wa_16031259911-v2-6-919fa1c27070@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20261030-wa_16031259911-v2-6-919fa1c27070@intel.com>
X-ClientProxiedBy: MA5PR01CA0138.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::10) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|LV8PR11MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 4339c660-71e3-4979-4786-08df38e0fa95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|261021123027099003|261021121427099003|260925021911599003|260925021311599003|260925022911599003|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261026121527099003|261022105027099003|261026140227099003|261022075727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XwKEPCTJtYpNLa5jTh0hHYRMWGalmYDqw7P25/ti1ruk5RAFbgv8anJXje54phYmwkkOwxuC5h3zC/hERv/Sy51xwGv0RVKaBiImMGJVp622Cl0lwGoVgd1PA9UCI6sdNs1EZqEHeD18Ul27uOYasrr5LDNezN+t1K8CgF0lPGT1ZHbaTQodM1xdbhWeMkvD/Evtvve10nWUV0nfmM99nDNwazdKwRwbuYOAuAlShj7kKITWccZuNhBOrawaqjM3UknDJS8CHPznEe+t2eReBMLfCzHy71ZTBVbxr0DlzNVE6U+3lf8tZkSUwPFeKxFi2pvSbaijyDhxgPuMW2G3uZdMdNtbUAbBhLetc473HVSJEQ1X2MG+nkZ8OJNvudGB8ZzETj9QyeQfbpAtkwHzHMTxqOl3lNHIz4la7trzTF3TEYjEsVKKZDupsiPj1RwnXCG8sQuFvSsCLKPfZIaqUITwsWHj2oZNe7tG5oVcXBe+kQOZGUHCJ5NFYdDLCU+dXQvg7uuIUHstocZt+v7fZyJ1CkQc/9AN7VXPag2tg/tzI78c0kC5RXTEBaKCBTDy+sDk7KT8De/FtaUSoWktaU53/DQ1pLL5BpBLUlG5dd5doHw+yTl0PJt8sgyNJ5mxuXGbh2brlRb6zf3K93Bm1Yh0TDzHl6rPK6UrAaG34q0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(261021123027099003)(261021121427099003)(260925021911599003)(260925021311599003)(260925022911599003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261026121527099003)(261022105027099003)(261026140227099003)(261022075727099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHV6UWo3eXpWVmZaVFFyYUhSM2EvekU5UGsxNEFFd2VPeUtxYzlzNGQ4NU1o?=
 =?utf-8?B?UjJSK2JXUElNbXBMZU9VbWlpbW5hMndUeVBrV3M2QlhLaHpJQTVFNzd3YnhB?=
 =?utf-8?B?OVhqNFdMcHNxaTZNSGVuL2c3YktOMGhJUVkzT2xrZEs3ZUlta2xuR3ZHTFJD?=
 =?utf-8?B?U3oxbEZ2aE9zdGkvSmVUNkIwVjF3ZWZDdDIwYys3TFBJNWNxcmo1YWVhU3l0?=
 =?utf-8?B?QmlYYnNQRGZBYk02cmRRQitPbEFzOXpzT1Z6YjlBZXpUVTVmdTZtRk1BbExj?=
 =?utf-8?B?c2ppc2lYVlo4YnNGUSt3cXpkb01JSkM1Q3I4bkxNYlNNVjhQMm1xY00yc2NS?=
 =?utf-8?B?WVJCTUwxMFZncGhTSFlhb3dSejUySkR5bkFidk92Rm1zclpURnJtdGdpaHk4?=
 =?utf-8?B?VlI1a2c3UGprZ0dKc1VDVjZzeE8zQmx4cUtIdGl4REtnc1hDQUdGQy9HTHVp?=
 =?utf-8?B?dVZYbzB0SklvT3RKU3pqUnJVRFpBUzlQZUpnc0IwMjY1Sm56WDFEQ1ZyTi9j?=
 =?utf-8?B?U2ZUZk9Ud2xXdjVlb2RKVU5aWTlhQlhqY3NudC9rclh4R1VnaVp2eVpwRHg4?=
 =?utf-8?B?eXZCV05FRWZucVRHVjhmTTZWZ0NJdFIzTEd6c2UvYTAwb28xV21oS2I1dHY2?=
 =?utf-8?B?QTkvZzdBcW5DeVRwOUZrdGVYamcvOVZXL0RSWlRjYVpQbnZoSmJIb2Ztb3hn?=
 =?utf-8?B?MHBRWDFlaUhGSjZXUWhPbWpNWVpxdkxNanEvNUZaemxyd1NRZHlaOXlYcjZo?=
 =?utf-8?B?aTBQWEQvMzJEQ2ZMRm9EWGtLODlTazVGY0gzWitJTnZZdVlXM3prR1Z0OFo0?=
 =?utf-8?B?Q3FNVVdtRGExQnpTZ0NsaWtoNTkwL2x2dEdKNWxuY0wvNzJsTWhxMnpvbC9w?=
 =?utf-8?B?cUd4V254Q0VjYmNYcXM2Z2NhRlJ3dHNVWnZiOG5YcW1ldkdHK0RobDZoTnN1?=
 =?utf-8?B?U2o0eGx4RXE3TU1jMHkzR1hSMExPOENzaUZyRTg0bnJ2YUZJWHNHdE1MbGRM?=
 =?utf-8?B?LzU5Zm5WZlZNUmpOZlZtWFJma2t5TDdZd0xxcXpCdDVDWGlnUWJPUlV3cVBv?=
 =?utf-8?B?T0orTjVRTmdlMmNiN3VtL0pkeDlLN1l2bmg1UHZKay9VTnVoKzVrS0puamp2?=
 =?utf-8?B?U3VMY1loWDFMeUpWVmkzSXJpZGVrZlpybTh0TGwyYVp1OFFnMFcveW1MVHh6?=
 =?utf-8?B?NEVEYWVnRG8xMk53MnhpcE1IRzRLcVBxQWJMbm9JVDYvY0JDTFlxdEp1R0w5?=
 =?utf-8?B?RW9tMGNxMTRCRUxWMnZvemFsdExZeUdWSjNXTnd6VWxGL1ArMndvNDIvTGhP?=
 =?utf-8?B?d2NRNUpRTGt2ZnFvUE1EY3JGcVZTMFJoZmVENnRSVWVIZlZHbzkrdThDYkhy?=
 =?utf-8?B?T3VFNlEyT2ZuY0d3NUhJTTZhM1JxRmozZDFMRi9lTUtqdnZYNkZDWkk3d2ZD?=
 =?utf-8?B?cEZINzFWSmQ0SXdNS2NBU2k0Y1ZDMjcvSXZMUVliaEl2T2RaT0IxRnZwcFFz?=
 =?utf-8?B?aVRid2kvM3o4MEkyZ00wd21TM3Q3WkQxTmlsS0xLNlcrREVvYk9aZmNzK09q?=
 =?utf-8?B?bkNxVHd4cDJ3Q1lWTEdMT1VkUURJbGZsOE9pTy92eTV6OUNsZmJFa24xTXY4?=
 =?utf-8?B?ZzVUM3ByeTdFbEZqZmZ5a1N1WnhNaTRGZ0hPaEFpM0xVaHBBSzY1d05LSVVP?=
 =?utf-8?B?VnBQeFluSGhWM3hseHJ1VU1LRU40MUZhVlZGWTcwRUt3MG5YMWhYNW0vREVX?=
 =?utf-8?B?S3pxZFk1cThkU2dEVys0QlduQmZreU1TNGpOUmlLVDA3TFBKbTB6cTJydk01?=
 =?utf-8?B?Rk5BNlBRc1NpQXA1MGdpTUJMV3hQYyswMUNHUjJtbFdXYUJwTlJIeWFGSFNi?=
 =?utf-8?B?eDFBQ3RxOEJ6QlBqbkRGcWVnQ3BKRTllNEtlWnZ5MUc2M0syQVBBeENlZGZn?=
 =?utf-8?B?czV5SGM3MHdpcEQyL2NjNGRwd3Zqb3ZNZE93UzdMemM1YXpGYXFwUFlNSmUz?=
 =?utf-8?B?MXVmemRzeUFYcGt0QmN4SEsxVXhhZzh2VEVHWmRycmV2cXdZYm5pRHlaL2JZ?=
 =?utf-8?B?RTVtUUtlcHlZa2hIWWhTd0JZY1FVSUhTSXVpRHJkbFlucnFtSU9RRWlmb1FB?=
 =?utf-8?B?ME5HS3lhTU0rc2VsUkNqMHpkYTZQVGpIdnVZaExMZnY4MEUvS3BDc0NLQ3JQ?=
 =?utf-8?B?YlhicFNXUVNSVTVwMERYaEVnWGZUaGtDMnhSbHZWM2RPVTRJdmNsRVFJT3VR?=
 =?utf-8?B?anJ4TXh0azNXTUlHWGwxdmJ5SDZmdmdUSXpGNDI3aW9OR0ZzR3lEM0tyTHhY?=
 =?utf-8?B?cGJWZGVWSHpjQk5RRk9nMHNnRXdRWktWWkxBNnpIN1NreHQxeHhzSWpCNHBn?=
 =?utf-8?Q?O4QGa9+fuVRP8kWLNEHXi2XLIvGw5S6SZWQ5k?=
X-Exchange-RoutingPolicyChecked: qP7jcSKpu1x0wFwWj3UAHwfja8aQ4kV8J0Wb95OmGEMjOkr6xKElDPZuNyFNUYRNVxgzmw4bB1o6FlsuRHmS/EOZk6hDCbuMTS9oFiCtRDQMm2aKlgTF2WVaDbStb/OZrwIsXTpK3bJqaH01YPhG0aTtLPdkyo6ARliNXNwC5i9vyWY+OHZhe6Sx4ecDJ4Ay9yW7AKa9096LfPVA57tZb4OeCPflycD0c5vKVPpJyuZmz0L3IHNM3+vW84Go2Cy2xOhuC7UO6dS0aeN6nCX/hITNdGUTO4ExDLDn93cvSW5ob37mmReT7mAlWM/3fpbq3MInciAVkyF/UrscWvQzCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4339c660-71e3-4979-4786-08df38e0fa95
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:58:24.0455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRb86UoPuIWaZTE5WVVgsvl74mP0f7X/GzIl56XDXSPcS1YRxylhaEpWrzF+l7no0p14NOpQ4oN1o8pb0K+qd/gHG4SxtFqXpP+MeS4wpv+KeEzJmlxEHE4N8dqDWD/8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8606
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30.10.2026 19:57, Gustavo Sousa wrote:
> With the latest change, adjust_idledly() now only touches hardware
> when necessary and has workaround-specific logic well scoped into
> individual "if" statements.  The early workaround checks are now
> redundant and can be dropped.  Do that.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 108 +++++++++++++++++++-------------------
>  1 file changed, 53 insertions(+), 55 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 32d33c70e7f4..08bd8754ad09 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -611,77 +611,75 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
>  		return;
>  
> -	if (XE_GT_WA(gt, 16023105232) || XE_GT_WA(gt, 14025941587)) {
> -		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
> -		if (!idledly_units_ps)
> -			return;
> +	/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
> +	if (!idledly_units_ps)
> +		return;
>  
> -		if (XE_GT_WA(gt, 14025941587))
> -			min_idledly_ps = max(min_idledly_ps, 5000000);
> +	if (XE_GT_WA(gt, 14025941587))
> +		min_idledly_ps = max(min_idledly_ps, 5000000);
>  
> -		if (XE_GT_WA(gt, 16023105232)) {
> -			u64 maxcnt_units_ps = 640000;
> -			u32 maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> +	if (XE_GT_WA(gt, 16023105232)) {
> +		u64 maxcnt_units_ps = 640000;
> +		u32 maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
>  
> -			max_idledly_ps = min_t(u64,
> -					       max_idledly_ps,
> -					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
> +		max_idledly_ps = min_t(u64,
> +				       max_idledly_ps,
> +				       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
>  
> -			clear_inhibit_switch = true;
> -		}
> +		clear_inhibit_switch = true;
> +	}
>  
> -		/* No applicable workaround found. */
> -		if (min_idledly_ps == 0 && max_idledly_ps == -1 && !clear_inhibit_switch)
> -			return;
> +	/* No applicable workaround found. */
> +	if (min_idledly_ps == 0 && max_idledly_ps == -1 && !clear_inhibit_switch)
> +		return;
>  
> -		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> +	idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>  
> -		if (clear_inhibit_switch && idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED) {
> -			idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> -			wa_applied = true;
> -		}
> +	if (clear_inhibit_switch && idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED) {
> +		idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +		wa_applied = true;
> +	}
> +
> +	idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> +	idledly_ps = idledly * idledly_units_ps;
> +	idledly_hw_ps = idledly_ps;
>  
> -		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> +	/*
> +	 * min_idledly_ps is applied before max_idledly_ps, which takes
> +	 * priority if the two ever conflict (not expected in practice).
> +	 */
> +	if (idledly_ps < min_idledly_ps) {
> +		idledly = DIV_ROUND_UP_ULL(min_idledly_ps, idledly_units_ps);
>  		idledly_ps = idledly * idledly_units_ps;
> -		idledly_hw_ps = idledly_ps;
> +		wa_applied = true;
> +	}
>  
> -		/*
> -		 * min_idledly_ps is applied before max_idledly_ps, which takes
> -		 * priority if the two ever conflict (not expected in practice).
> -		 */
> -		if (idledly_ps < min_idledly_ps) {
> -			idledly = DIV_ROUND_UP_ULL(min_idledly_ps, idledly_units_ps);
> +	if (idledly_ps >= max_idledly_ps) {
> +		if (max_idledly_ps) {
> +			idledly = DIV_ROUND_DOWN_ULL(max_idledly_ps - 1, idledly_units_ps);
>  			idledly_ps = idledly * idledly_units_ps;
> -			wa_applied = true;
> +		} else {
> +			idledly = 0;
> +			idledly_ps = 0;
>  		}
>  
> -		if (idledly_ps >= max_idledly_ps) {
> -			if (max_idledly_ps) {
> -				idledly = DIV_ROUND_DOWN_ULL(max_idledly_ps - 1, idledly_units_ps);
> -				idledly_ps = idledly * idledly_units_ps;
> -			} else {
> -				idledly = 0;
> -				idledly_ps = 0;
> -			}
> -
> -			wa_applied = true;
> -		}
> +		wa_applied = true;
> +	}
>  
> -		/* Warn only if the value read from *hardware* exceeds the maximum. */
> -		xe_gt_WARN_ON(gt, idledly_hw_ps >= max_idledly_ps);
> +	/* Warn only if the value read from *hardware* exceeds the maximum. */
> +	xe_gt_WARN_ON(gt, idledly_hw_ps >= max_idledly_ps);
>  
> -		if (wa_applied) {
> -			idledly_reg_val &= ~IDLE_DELAY;
> -			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly);
> +	if (wa_applied) {
> +		idledly_reg_val &= ~IDLE_DELAY;
> +		idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly);
>  
> -			xe_gt_dbg(gt, "idledly %s: set %llups min=%llups max=%llups inh=%u ts=%ups\n",
> -				  hwe->name, idledly_ps, min_idledly_ps, max_idledly_ps,
> -				  !!(idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED),
> -				  gt->info.timestamp_base);
> -			xe_mmio_write32(&gt->mmio,
> -					RING_IDLEDLY(hwe->mmio_base),
> -					idledly_reg_val);
> -		}
> +		xe_gt_dbg(gt, "idledly %s: set %llups min=%llups max=%llups inh=%u ts=%ups\n",
> +			  hwe->name, idledly_ps, min_idledly_ps, max_idledly_ps,
> +			  !!(idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED),
> +			  gt->info.timestamp_base);
> +		xe_mmio_write32(&gt->mmio,
> +				RING_IDLEDLY(hwe->mmio_base),
> +				idledly_reg_val);
>  	}
>  }
>  
> 
> -- 
> 2.56.0
> 
