Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CF7D6AAE9
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 16:20:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996D210F320;
	Thu,  2 Apr 2026 16:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KIfzBWNY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A95710F31E
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 16:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775146817; x=1806682817;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wXJ59zSeEYpxqAcljrpBlby4I87S+91AbD0HILigX10=;
 b=KIfzBWNYF+PFY/bVhXOoubD+XeM6ZgnNjA8/D260Edo44erNzd8vJi9v
 oQ+XncAZm4ZnN5lVIWsdO8zPZczqsssROFeegRDuJpDUJk2qR71fxpG/H
 13BVdZV6eROdMuyjSg2yRgT9b4OIS+Ir34XBtDh+Dksk6FYWBpGppeCIZ
 1nS+oFxk6m+pFcKDc1kUBZYyCZmZVChMkZfyZBKmNhYXJGsWYrk1C07wm
 pFPEMkkXBTiHV/xtqpS03wZK2CsO+RDhzVE729k9nIktFQzKtVFaIucJf
 WXIpEyT8Lfpg/kTehoAaf4gX8Z4jylaDm9xt9X8IdHYHzg+XZ5jPkUHD6 g==;
X-CSE-ConnectionGUID: 5Ol/Co/BSyejcnc7g2hLvA==
X-CSE-MsgGUID: uYYbpWe1Sfi9uEUZ90Y8bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75382122"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="75382122"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 09:20:17 -0700
X-CSE-ConnectionGUID: oZslCJtbSu6p/PkCSSbdzw==
X-CSE-MsgGUID: ULZ4IlfUTFekDUe6+DPRqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="228645174"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 09:20:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 09:20:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 09:20:16 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 09:20:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSU9i5Ink0blLcR3B0YmUi8FoAMu0tuf645wJ3WYmspscMiJ6EDJs9EKXLUBoaP5wwa4GMiAE7dN/H53tOMLfFnesZPhQO+UeovG0/+6mXT9F2jjyug7CutEb+MdwpGWEdkieJqZkNUEapvPHbktThyR7RTNT5Ti4JxFjf6SNTYmJ9TzarImr6NdHVUKweN8t4ffrQPZPJ8pT6++PbIpS1131BKgL/pBaSMjMjNYde85BGSrzP0YDPwua20IUTrAtiGu54TV6UoqtEKIgtxVWyD8eXmRnAN2ghBPAMMWWC+LfBgFDii4Axp+pfED6ftQ6MKU2dz7SOMdVt5dhtYRAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k84KLD1FFTqG/RWoIrl+Cy9NiIfZbfzB+Loo/uzUNj8=;
 b=G4IR1CK05SI3yDYKp6sTayonTRNFVyh4pzbeJZ4DZylCEbUUkwCpbcdTaUl/KnHnUYSdWA51m81XtucKSdBOhytd8Nv1Bvu+UVxb6JPFB+qh98jUwIwF0Lj/Ti0+/FP7+0J4YGpqDyr8Lvy0ptuGwFcyqaWdptRaAueosLS+wBzfE24Poo7JX382e4X8iXtvOZ8fgOpg2Deu+wuTV3781uszYrGm5KJ7XqK9RnYa4NEb5Viy8fPqe7vsFwyFNhq3CwR2/yLLUZhj+viZ8k1oWI1IjNJLQ/OT+HK5efVMEgZ3Nh3YO7F0vYmObqmDTCSDcDOXDNxZSfclaiC2FrKaRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB5155.namprd11.prod.outlook.com (2603:10b6:303:91::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 2 Apr
 2026 16:20:13 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 16:20:13 +0000
Message-ID: <1fea7a37-8b38-4f29-9fdf-7080e7e1d825@intel.com>
Date: Thu, 2 Apr 2026 18:20:07 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Improve_EQ/PT_provisioning?=
To: <intel-xe@lists.freedesktop.org>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
 <177491692413.414888.9181167182535267029@a3b018990fe9>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <177491692413.414888.9181167182535267029@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0067.eurprd03.prod.outlook.com
 (2603:10a6:803:50::38) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d3a80d-fb82-4cfe-25d6-08de90d3b7c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: dLV8m5b4GU1rzXDOQHF/JshIEbTit6o8RyBPQ785ORDZ5/fZz6hXwkJRtrPywxGUfwD9q8Hxqzb8c8vmqPdoTZLqJemakx+83CgMTzgd5VfXPajYlnlzPdGPOfpGHPpkc06AvSyzIO9J7EFjSNoNhg0QKK76CewqjNkx9C5ek3YH33+WmA+sXrzowjjpR3H7M8OzLvuknVnFpEM6W3VVS//6g/v3nYr60zCxKrJ5s2iS6AhNiKw33YcGokSqM4jKMiOWg2gjPgFXFGRF1aWvLfcppIffMyjcSGGrUN2Ytxx06r2tEHcQapbnuSg24MBZwy6x88zQ8B36ddmis+uB3IVNqFflBOhfMXU+hHHFxIEyxmY72Ywys8UvSAx+4yvVEc6Kddb+omb9rpXw0DzT+sCoe1dqWIiuaaswMXGBpJDnLYSIyInz+IXmNhtcNC+OTJDPdQ9Sxwvn1tiGGMdJhAbh6BZRwnLO93/CEJyYFZjYC4JQuMIOmq2CeE48nxU7D8yHQv6UG8yEtUVFnfmIpElJ3DitzFTYG589YkDyjBmWCiNIFYTbg0LIhdQz+n5troMjTNhwUU0HdZ93Nr30YmEq/bk7CKpNXZzQ4LrtW5rKBeVlvgBG8P5PUhMkR1E7bcWskNragQ7krD7Gn7sAbjOHrHDkECd4EbZk4hOZJzvsbbTDQDRSCWvGMRVVPSCt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akMyUjRCZDJybnQ5dXA5T2VEWlpBTUFvM2pKYndIZHJpSFUwVTNIemJZRWRt?=
 =?utf-8?B?UlQ5NWtKTjFBbXdWMFNjbE5IcWFCN3J4dmdQTEJGY1FMWG9HTHJmTDBRckNY?=
 =?utf-8?B?ejZOY0V3L1V1QUxESUw4bGEwUU1MNmFpdVpFU0JSUks3VWJJc0ZaZ20wMUJo?=
 =?utf-8?B?d1N2NU9na3I1YWd4ek05ZGFhejVXdGliTnlCOGtvN1BucndEL2FKRmF0Ym1U?=
 =?utf-8?B?RjFLVExUelp3UHo2NGZ3NG1JczN5MG9USXhITHpUMDZMRGt5S3BQMmhYNUgz?=
 =?utf-8?B?aUJkNVBNR2ZSemVtRW02MlRDdmtlWFlCZFNHRHN4eXlnRnpBOFJTelhLYzBx?=
 =?utf-8?B?NHlNdzFEM0VDVWFLNVJKRzFROGxhTFBZRzdaUkMwNEhPTkpRMFZySDZRblBt?=
 =?utf-8?B?ZlM1YmtaY2pLYTA5b3N1QkFVSXF2WW9PTGxJRmlyQ1FiUEJtMHB6QXZkVk9I?=
 =?utf-8?B?QW9zRWRONU5qT3IwMUpDeXJwNWFYcEpzMlUyNHJJNzBGTkN1dUZCZmpLSzFq?=
 =?utf-8?B?aWYxbXZKT1VNblhjUGpYZU5Sa2l4MW1aU0kwREQvaTdDcmhXSTIvSFl1NE5P?=
 =?utf-8?B?OUI4Q1pIYWpBTVhNYWdJWURobng3U0ozdjZOc2dhQnNMc1hZK3l6QVRycHRu?=
 =?utf-8?B?ZldLdUpvaENSWkVXNkU5RUFFUExBRU1Vd2dZV1R2cGZTWjVvMmdtNXhzVjRH?=
 =?utf-8?B?TnZDNDhGalVMY1VFSEhScmpvWFRUZWoxTFBBbmJhSUZLeWdpR3I4bktFcUFY?=
 =?utf-8?B?eHJTNytvb0V6cG0xSGxZanh0cjBhbVRkTS9lUHBRT2U3TlRzZkZmY0hyK2Rs?=
 =?utf-8?B?eDByTmJVMnlsZVVVNmp4aVFIZ2lCYm02bHRxbFk2L1dDMnFwMk9VRGE3NDVj?=
 =?utf-8?B?WmVPNU5SaE1tWWVBNUU5MC9rQmhSWXIwa0RXQ041SGNaZ3JkMGVsMFZqbGdY?=
 =?utf-8?B?VElRcFJmNS9yYTc0REQrQnNRb1hSVTdPb3ByLzY3M1RLV2NTS3IvY3BYQXoz?=
 =?utf-8?B?Z1dvRk5vRG93c3YxelJjcVlkcW9KUnlsdXFZcEVrWXhxT3VNMHk4T1FYMFJN?=
 =?utf-8?B?QzhHWENTNzRaNC9EbHM0MW5MOHViZ3MzM2x2ZGdZN0lBY2pOQTZxQ2oxSzBK?=
 =?utf-8?B?SlVRTnVVd053N2dLN3V0RFRIV1oxS1FVTDFRbVdpR3cwb2dBejNHTnhNcUZs?=
 =?utf-8?B?bURpTTYyTUZQM09DYlcvMUhYbTBDMHpqVjA2d0txdERESFlMYjBaVFBDYUww?=
 =?utf-8?B?MUZKQUFBTlV4eS81bXUwNWZoZFIvOVQ2cHNucks0dTBva1dLc2xTK09oOG9v?=
 =?utf-8?B?RFNBOGloOGxtWDJaVFpUTXNOM3ZKRW55SDVBVVk3ZDFDMUNsRzNaWFVHRlFT?=
 =?utf-8?B?ejlXeGFRdFRwQ0J4cnFUeVhlK1doNG5ZUis5bFdDcUpRNndsTGg3OXNUeStD?=
 =?utf-8?B?NElHeWtMeGNrRzJWa0wvNDl5bC9MZmp5TXVDekE4MjJ1ZzRSbHpVT0hHK2NF?=
 =?utf-8?B?ZWpuUEdHNnNtMy9sRHRMMlBCbkxTb2VValVSSVA0OGl3TUVCV0JHYTBnVkFl?=
 =?utf-8?B?UGxObkhVTUdaNUpOeFEvdG50b05DaUxidTY5WFd2Tk4wY3l1YU5GREZTdDJ1?=
 =?utf-8?B?OU5tMDJaMEJNNGxleHFNVFRKOXJBQlN2bzlDcjNBR2pEc1M3aVlaSHBlQTNN?=
 =?utf-8?B?RUJ1Z3FaeG9RM1dXUnpNN2EyV1J4cW1BWlQ0MVVXQVlyT1FOcGFXa3J0UUpq?=
 =?utf-8?B?V2N6bUFLeHQ2Z2NaWkZnb29ucnVSWDFYUmNLTnZXaUZxZVlDOGRld0RSeGpY?=
 =?utf-8?B?akVPOFp0bE5qUXRncjJuVEZMWEUybFAzUDlzbGtIZjgySVEvMWJGcDNvYlI1?=
 =?utf-8?B?dFJsMVFQby9ITFpRU2RTZjQ1V1Jxdi9pMFFTYlI5dWJ6T3ZFUkNLWHkxdm9s?=
 =?utf-8?B?RlBUZGFDZDFFbTBxRDhJRm9SWG9xa2FFQXBXNDRzYTlyZ2xQZ2ZPckxjNkl6?=
 =?utf-8?B?L1UxNlZBRkpNd0c4T2VHUlNHR1h2bDFoNkd3OC9mV1plNjhWTSs0TWJTeTZ5?=
 =?utf-8?B?UDdRaW5yVEQ4OTlkYjhJSzJ0cnMyLzE4UGN4cHFlZi84K0JpTTFZbEkrVzQ2?=
 =?utf-8?B?K05kcFNVVGdLQXp3bDZKSldrSDVkbGxKaFRHbzd0aWZNVkdVUGJvSjV4R21h?=
 =?utf-8?B?bU5zWDlaWFhuNlc0TTdRSU9TNElmS00zc3RPNFdKdnh3L3pvV29WY3NGbFRP?=
 =?utf-8?B?U0hDdGtqRzAvSWZGdHo2a3BxVDFaQjB5bVFQWXM1djhLd3RuMlJINEVLcmZZ?=
 =?utf-8?B?dXRLcThRa1cwSkNnMURZa0pTQ3docUZKLzRlSXRzcHB5SlVBNU1Ualp1TDRU?=
 =?utf-8?Q?/Vk8pFQbKg9zWjRs=3D?=
X-Exchange-RoutingPolicyChecked: UPaNw0xoeidmfYrJZLAt2VKsSS3dWoR1cLAJ8cEDbaNpv/16m2t0U2MGgIqKCpHGv7RiXvJMOAQ82Qpn7hXoXrsq/beF1pHuL0w791UM56oU4SAalP6fsQ9EVoTauOiDi+vaamL0VG8/T4m08UPhj3I+fqUBrYqDyA+2tRHBsbzZgYfOVyMK2F3Aphk58153QjMLNyMVWa+E1mOm53xDCBNRKb+unGpeNd2Bc0vShq3K+CLWgJHboq8kVPj+sqIdmAnHu+TKX4ysjzmUJ65iSM/X7Pd6y4WRfUuIFDNKE1JkdNNL/E3mIcJqdhus7y9Xo9T3YNs7wMpYy6SxBLDuTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d3a80d-fb82-4cfe-25d6-08de90d3b7c7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 16:20:13.0547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRz3wUkqppzJuZqMc62yeR9xmPkCzinaWBTruC1tJJYMye0qV0PN0BC9T+imDXm+jsF98AVsbgwS4fxAbed7EQwt/8pQ5kTmZmXCFRlE3vk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5155
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



On 3/31/2026 2:28 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/pf: Improve EQ/PT provisioning
> *URL:*	https://patchwork.freedesktop.org/series/164119/ <https://patchwork.freedesktop.org/series/164119/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164119v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164119v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-4822-169e5b6f809026c4a0cb3a736b48378ca8e8fecb_FULL -> xe-pw-164119v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-164119v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-164119v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-164119v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_module_load@reload-no-display:
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164119v1/shard-bmg-5/igt@xe_module_load@reload-no-display.html> +1 other test fail

looks like CI/IGT misconfiguration:

<7> [57.107439] xe 0000:00:02.0: [drm:xe_pci_probe [xe]] ALDERLAKE_S  4682:000c dgfx:0 gfx:Xe_LP (12.00) media:Xe_M (12.00) display:no dma_m_s:39 tc:1 gscfi:0 cscfi:0
<7> [57.107566] xe 0000:00:02.0: [drm:xe_pci_probe [xe]] Stepping = (G:D0, M:D0, B:**)

(xe_module_load:2169) drmtest-WARNING: No card matches the filter! [pci:vendor=intel,device=discrete,card=0]



