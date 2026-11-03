Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC5B606A328
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 17:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nCSjVZ8a
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C085A10E111;
	Tue,  3 Nov 2026 17:58:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9A110E301
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 17:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793728703; x=1825264703;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Pqg0PWsG+zgDo0Ix4lTkN/MtCSNkkhW0y6ihjkVhO9o=;
 b=nCSjVZ8aGI+nj9LTwpcRxQaAiCH/N1dSrRAfzCIgZd1ANWj5gPuw4o7c
 x1TvGNBfVHGFcjyClHXGbUfVqcHTCwyz+toWUE5uervo1RFRHbTjJGO2+
 jAA47gZbAaZ75vkiQt7zYr9Axc2sVEDY3inUyputuLUe+cR1vPL8y6V5n
 CkGksEEWrQMe880O1MBSdO1VxNmSlprBR0GXjZMAXnha1/mlxznqR15Oz
 WCLxxdSW8isbfTc/SkyfK/8P2ZW/F4CHSvjBlEMWxbIJYJTWjVu3Zgt6C
 aWnW1wDhWlee05iYpm0vYmI6+40bcwml6uGQfUNxv1ydQHcdgl44mdmeX A==;
X-CSE-ConnectionGUID: XncJPggoT5iEAjjOqDiZ5g==
X-CSE-MsgGUID: ewjyyJFjSfOzFh2haIGJ/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2462684"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2462684"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 09:58:22 -0800
X-CSE-ConnectionGUID: ZsgT+i98R4+QHYDlxTH1MQ==
X-CSE-MsgGUID: 2zpUq9VoR/6V3ZcfkSpBPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="8348991"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 09:58:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 09:58:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 09:58:20 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.20)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 09:58:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdGrztkZtQ72jCTKJIfoxICfh8TXiUKnz1lXdtoPEv6dY2rVrGDlBoohOCfGH86zY9PBm0EP413o6YJmfcEZY2tAA3RJPv8Pq6BmO3qVSBGLV80S8dAOlTKYUFxzhzjG34t7Yny1iNIUKtmrzMmQb3bj5y9/cQ+4kAE4wLrvo02Mn4RwcUvGIdEhSsBwOVzr91QpoQ//zryZLMZ5phQ+F6O6MMmPoNnODEjRuN5PSVEbdhojRAC3M+0BJkqGu7rlM2Syhb/SO50BT9SbGi2XBlVq9Lea6GNkqWwfmdxacpJrr4CWfkDI2ySLL6DjyDANUetLgeALkmHEqSygkLJipA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gm0yMKRm8wSysq00sg7RA2mbdta/46G4LMn3Clyiizc=;
 b=YEZyWBpoN/0AEax6f3b9sULaQSdacyIC/eITWPxQhHe4TTFOwhTSBzOkpjaKgyuA+6H2SalqtjJmRSFsRV2UaI/a+aDOM1wJssPgmToUBDG1dKAT+EeXR81t15533sh3eq+ckUWd18Oy70uw3eCxlAimTlJuUoxozfTNgI89G8D2ZhwmW46t6hRVIsGoJe2aKhkTzNfuILCiDhb69Gro45DwI8A7IMayxlFA8UODGMwlfptlufDwkYL5vl481s/GrNhuRl2AgFwQrk6ZQEKCZmZPp//TIbKLVOThmGeFe7wLgoW1gHHJROxitoCZyN1jmEeLSDwZFszdWpAL7brLsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by MW6PR11MB8340.namprd11.prod.outlook.com (2603:10b6:303:23e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:58:14 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%4]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 17:58:13 +0000
Date: Tue, 3 Nov 2026 09:58:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/pf: Program LMTT directory pointer from each
 GT's init path
Message-ID: <20261103175811.GG6078@mdroper-desk1>
References: <20261103114540.240284-3-satyanarayana.k.v.p@intel.com>
 <20261103114540.240284-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261103114540.240284-4-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:a03:331::8) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|MW6PR11MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: f7db25be-2fd7-4925-375f-08df39d40794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|4143699003|56012099006|11063799006|261026121527099003|261009223027099003|261028144727099003|261026140227099003|261102123227099003|261021135927099003|261021123027099003|261022105027099003|261021121427099003|261022113327099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: A3CYrIQ5yFEOAj2RqBFnzW8ybPCA2jkpV8cxyQHWqVBSkNI8b2pa+VD9t/Yq47B2NYEKOReoQEVBaI/FAI3tQM0XL6eEx1nCxnujdcKQ6BXU8qibsb6zhMhW4ma+rzudX+rzy/f2/KwRfRvrnRGNtNOfZ49hloqiZ4Wwuc+tNYxUmLdsRi526Ac5ct5gahjAswa+MxNhvxAHrsfxNiayC4sAqq4Td8jG2quLJoOsdvOXGEGU/Kvcs4J12yyu1Fl694QKTxx4b91VFd+4gQqQglO1pOfnNc+I34hzxC4MxA5NFneGjus7gHTDvQSdobkVlOZBdYyYxEuxd/t9YRtKJXxr5W8YoaN4xFHBTbVF0bBjfTDhfIfPKvNUUlT80QXSxilxpkvx535+23YR3PHAjOvfNCYmetYnI0g6HcsY+eXW1cuHRjHdp7Z7kXLaqZz8t2iFKY4uSudusNdHAdjI1KCvLKZWNLCeOYuRvuV1beR+O6HfqysnNQHubKYxOvQ9gohqUrRigfHHY8niNHqC+R39ii96VS5RFZRfFAepNTMMxuoeOVzdp2BjGgMmzJ8fouXHCbMBzA7zMKqg7Pm9X+p89jIvqXZZ9jhyCzF0vPRKodQ67fN2Ta6yFePAl30a90I4oNbGn2PGP1H+J+1fHFb6Bg302L1+iuWdL/LQ1Ds=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(261026121527099003)(261009223027099003)(261028144727099003)(261026140227099003)(261102123227099003)(261021135927099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022113327099003)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXRjWjdkUVM5b2grRjROWDkzYXVHSkJ2cm5SR1JBNVZ4cW1vWEZadFJFeXlT?=
 =?utf-8?B?eUtjR0JMUXFsK2dRSG5IREdVNnRhUEcrbThxZE4vRnpMcGJ3NnVTOU1GQUZr?=
 =?utf-8?B?RkZDM3lVcTh6SWdldEtCS2ZvWlBpdnk4bnIzSVJJRGxsU0FjTktDSDdzUG9a?=
 =?utf-8?B?R1lMVTdqMmUyTjhXckM5UU9lc2JENm1xTGt4WG1mMytIMTNjN0N4a2ZKd0dN?=
 =?utf-8?B?cFFVcURTbDdHN2pERVcyOTM3b1g0MzJHVzQvMWUyb0h2YXdwNXlzVEJlS0RR?=
 =?utf-8?B?bWV3aVQrbEdGVFhvZjY3V0N5dDdsZ0xUN3cwWFBIU0lwOHpKVVlsc28vcjZm?=
 =?utf-8?B?SDZ6K1NSUDFnMTROaU1BaEdFWUxBZjByYi9QNyt5ZVZCdDJwbkswYzcyNk13?=
 =?utf-8?B?Snl0aytNUHdJcmM0aEZja2M1OVdEc2lqNUxHRnh3SkJzdXlRL0MveFN0YjFB?=
 =?utf-8?B?ZWxEeERNRnBpVlNFeHlmT2pWSDArVzFDdWpyZkhCZEY0VmpBSTl3NXlmU1lL?=
 =?utf-8?B?ZTQyUnBGbjc2SjMxT1RCVGNkbTEwb2ZYc2JKWGlvS1BCVWIwQzM1VUlDZExM?=
 =?utf-8?B?K0l1WEQ3UHVUSWlPK3JOZVB6cS9qYkRlQnI4MXBvZVU1U0JBaWNpVCs1Sk9u?=
 =?utf-8?B?c1RnQTQ1SXVLOGpEN2s5QXNSV0JTVjdMblpOT2lRNHRQZnZCZW1RNk1HdGEy?=
 =?utf-8?B?b1p4Qmk2OUZRL2pRa0phR3cwelYwbmx1K0lkcjZVSTdReWdxdWJ2UWwvMXVG?=
 =?utf-8?B?eFRDWHhNTXpLRjNUTTVRN1pIKzk4UVBaaGtUY1FwMzdNcW5GaVc3WUtiaFNF?=
 =?utf-8?B?R2wwUFhrcnpmTm5FVjdNZ0ZwR05iQWRleUc3Nk84VDd4MmJRR2o1UTV2S1Vy?=
 =?utf-8?B?cWVEZFlJYmxaTlc5SjdqSDg1ZDRpbHpjTlgwMTBDWFdxejE1TkRTbGQzNzNQ?=
 =?utf-8?B?WEQxWE5tZHFMU3N3bUJ6YzFQTGgybkpXK1ZWdDdaanRBVVpBNlZXa0ZncmFM?=
 =?utf-8?B?ZzEwdE40MUNjRGpLdkNRWm9Ed3pPbzNBRjRMdGVWMng5RTBScHVmMENCVC9i?=
 =?utf-8?B?WmdtSXcvTERUdW1KVkF2aG1yVE9RL21tTGI5L1ZpSjZ6UU9KU0FxLzJZVXNw?=
 =?utf-8?B?Wkp4SDdOUEx2VkpReTl0dkRkMVJ3ZXJXUTV5T3BQZU81T2pjRVhTc2Z3ano3?=
 =?utf-8?B?ZjdWUVV4UERFYjZOZGZrbXMxd2RoNzhaQkRNZ1Vha21qd0xwSXhOd2JObEZq?=
 =?utf-8?B?VnJCUkNWM0lFa1dDTktvNkVVZEx2WHBmNjNNRjhsL3Qza0Z1dG1qcmhjbW5E?=
 =?utf-8?B?ZHFvUTJqR0E1OGtLeWpoc0N5KytyZFhUL3NMVm1EYUtVMy9lWDBSZGd3ZDBK?=
 =?utf-8?B?T25haDlhV1FPeExmQmo1SmxYOVVlbUJnTHdvQ0czeUwwaVM3UkoxZmxzeUtI?=
 =?utf-8?B?OTRIdjdCd245cVFrM00yMG9MN1l3TGJOczBZZjdXOTVKNXBXSk1wR293dk96?=
 =?utf-8?B?ajYxWlR1d1QrbGpjUkJhYlNibFJ1NzN3TGl4TDVXTWR6eER4aDMyc2tjMnJm?=
 =?utf-8?B?YmtIZlNwdlJwOHNNbWxtVEljUDlIZjVSSktxczdWOS9Kc0NMU3NCRUhDbVZu?=
 =?utf-8?B?Z2lnMUoyWm40UHExOHF2dG5JLy9oZVppNVY0Z1VvVUpsLzNTanBhQXBMYklE?=
 =?utf-8?B?ZmhKaDlobFBXQU1QN3djbGdqTFlFTlRFL25jWGNDdzRualJRZGh5cTNCRk5O?=
 =?utf-8?B?MXVSVUtSd1B6MzJRZG4vdHhEeVdXc3FUS2ZmZW83dnFOaU1sWTh6R3IxRGpZ?=
 =?utf-8?B?czU5UjRFZXpkUHRpSGJoK1lpbkkwb3FRN2xDNUNVbkdCaEVsTW5aMmJ4Y2pQ?=
 =?utf-8?B?RHMyRVQraUFoMXFoeTNDekFjQmpZNHVXMk1oZSt2eTlnQXJGQW5hdkN4U080?=
 =?utf-8?B?dUU3dVREV0ZxU2Nza2lQbmhIQTFBdXJYQy9QRGhVUlM1Y0FDd2hRWXNNdmVr?=
 =?utf-8?B?NTcydnpaK1E1ZXkzT0c1dDE0Ykp5U2tNbVJQaHR0d3ZkQVpiOE9TK21IY0tr?=
 =?utf-8?B?QjFSWGtEcjB6WWJVUk5zUzBoUzZsUlVpL0JCeHhzWjB4OEJKOWFNWWF2MmNR?=
 =?utf-8?B?QlkzYjJubjZtZjV5c25hbENsYmpocHRXMzlSaEUxUnh4UEJULzFQZFh0emRi?=
 =?utf-8?B?Q2NFM0lUOTZnb0dSc25nSXBVUC93UG1FWkdaankrOWJmR2RNNWRiNldrRzZY?=
 =?utf-8?B?Y0IzcGZuRTRWY3ZYS1NhZnQvKzd6dWoxVmRQYzBwK1lVMjBENkxWeGpQMTVh?=
 =?utf-8?B?aEpNdUR5M0gvYnkvM2xjK0dhN2RCL0VVd2pjS25UWXhBQkVHSWhra1NXeWhU?=
 =?utf-8?Q?zuYql5b3rbF3uLIc=3D?=
X-Exchange-RoutingPolicyChecked: Mx1qGsMBXIyPl/9d25KgA4n3oZFBD9x7XeM1eESTosJC7HSb4345ASUWJSLUEq9qwSLwv1lefH4O7zhzFxqoRT32mp6otQH9Q/MjVPzLR1iPnoWH8Miz9sJS3EXl9y/UExLuziCEJruTSVrMUVfoed1y3l0exxEWssIna3CTF3FQNZ8eVzdauehEi/a3zG3hzyFU8lmWD+2WVMbN77EoBj3SViNrudnCgU9gAjlRXSwasXaFtOPAGFis04zMJheojrprXl7g9UGw0AAwTFfTEUdu1QJ25QhArM2iLqd9Gd/XhJEgOMG/zvTt+uZG0GRwgoCB/dN+LTdjcsoiAyvjCg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f7db25be-2fd7-4925-375f-08df39d40794
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 17:58:13.4597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79rnbx57BPe7vDTjOaBb+eZU6XFKKfZgAfzlug9MrjpdxXHrWxL8oGlsJwfnP4Ojb5NX5Bx1FBGGGzhhx6tLDssFA1lVnCjeXElJGXrUQyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8340
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

On Tue, Nov 03, 2026 at 11:45:42AM +0000, Satyanarayana K V P wrote:
> The LMTT directory pointer is configured on every GT of the tile only
> from the primary GT's init/reset flow. On new platforms, both primary and
> media GTs have their own forcewake. Primary GT's init holds only its own
> forcewake, so the media GT write can be lost.
> 
> Program the LMTT directory pointer from each GT's own init and restart
> path, while that GT's forcewake is held.
> 
> Fixes: ad69d62588cd ("drm/xe/pf: Program LMTT directory pointer on all GTs within a tile")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c   | 14 ++++++--------
>  drivers/gpu/drm/xe/xe_lmtt.c | 28 +++++++++++++++-------------
>  drivers/gpu/drm/xe/xe_lmtt.h |  5 +++--
>  3 files changed, 24 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index be79a0da2f2f..b751b5044f3c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -675,11 +675,10 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
>  		xe_gt_apply_ccs_mode(gt);
>  	}
>  
> -	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_is_main_type(gt))
> -		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
> -
> -	if (IS_SRIOV_PF(gt_to_xe(gt)))
> +	if (IS_SRIOV_PF(gt_to_xe(gt))) {
> +		xe_lmtt_init_hw(gt);
>  		xe_gt_sriov_pf_init_hw(gt);
> +	}
>  
>  	/* Last action registered here so devres drains resets before teardown */
>  	err = devm_add_action_or_reset(xe->drm.dev, gt_worker_disable, gt);
> @@ -879,11 +878,10 @@ static int do_gt_restart(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> -	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_is_main_type(gt))
> -		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
> -
> -	if (IS_SRIOV_PF(gt_to_xe(gt)))
> +	if (IS_SRIOV_PF(gt_to_xe(gt))) {
> +		xe_lmtt_init_hw(gt);
>  		xe_gt_sriov_pf_init_hw(gt);
> +	}
>  
>  	xe_mocs_init(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index b6b3d892a35e..2dec0628585d 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -12,7 +12,7 @@
>  
>  #include "xe_assert.h"
>  #include "xe_bo.h"
> -#include "xe_tlb_inval.h"
> +#include "xe_gt.h"
>  #include "xe_lmtt.h"
>  #include "xe_log.h"
>  #include "xe_map.h"
> @@ -22,6 +22,7 @@
>  #include "xe_sriov.h"
>  #include "xe_tile.h"
>  #include "xe_tile_sriov_printk.h"
> +#include "xe_tlb_inval.h"
>  
>  /**
>   * DOC: Local Memory Translation Table
> @@ -211,14 +212,13 @@ int xe_lmtt_init(struct xe_lmtt *lmtt)
>  	return err;
>  }
>  
> -static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt)
> +static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt, struct xe_gt *gt)
>  {
>  	struct xe_tile *tile = lmtt_to_tile(lmtt);
>  	struct xe_device *xe = tile_to_xe(tile);
>  	dma_addr_t offset = xe_bo_main_addr(lmtt->pd->bo, XE_PAGE_SIZE);
> -	struct xe_gt *gt;
> +	struct xe_reg reg = GRAPHICS_VER(xe) >= 20 ? XE2_LMEM_CFG : LMEM_CFG;
>  	u32 config;
> -	u8 id;
>  
>  	lmtt_debug(lmtt, "DIR offset %pad\n", &offset);
>  	lmtt_assert(lmtt, xe_bo_is_vram(lmtt->pd->bo));
> @@ -226,31 +226,33 @@ static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt)
>  
>  	config = LMEM_EN | REG_FIELD_PREP(LMTT_DIR_PTR, offset / SZ_64K);
>  
> -	for_each_gt_on_tile(gt, tile, id)
> -		xe_mmio_write32(&gt->mmio,
> -				GRAPHICS_VER(xe) >= 20 ? XE2_LMEM_CFG : LMEM_CFG,
> -				config);
> +	xe_mmio_write32(&gt->mmio, reg, config);
> +	lmtt_assert(lmtt, xe_mmio_read32(&gt->mmio, reg) == config);

I already mentioned this offline, but just so others see the feedback,
XE2_LMEM_CFG is an MCR register on the primary GT (0x48b0) but is a
unicast register on the media GT (0x3848b0).  We've been treating it as
unicast on both GTs so far and if we're only writing the register that
will usually work out okay since we leave writes in multicast mode by
default.  However since xe_mmio_write32() doesn't grab the MCR
semaphore, there's potential to race with something else in the driver
or firmware that's temporarily switched the hardware over to unicast
mode.

Now that we're also doing a read (in the assertion you added), the
chance for problems goes up since the xe_mmio_read32() doesn't try to
steer the read to any specific instance and can easily wind up targeting
a fused-off / terminated instance of the register which will always
return 0x0.

I know it's a hassle for registers like this where we'd like common
logic for both GTs, but in this case we need to create separate MCR and
non-MCR register definitions for XE2_LMEM_CFG and use the appropriate
definition for each GT type.  And then also use
xe_gt_mcr_multicast_write() for xe_gt_mcr_unicast_read_any() for the MCR
instance on the primary GT to make sure we're properly locking the
semaphore and reading from a non-terminated instance.


Matt

>  
> -	if (xe_device_has_mert(xe) && xe_tile_is_root(tile))
> +	if (xe_device_has_mert(xe) && xe_tile_is_root(tile) &&
> +	    xe_gt_is_main_type(gt))
>  		xe_mmio_write32(&tile->mmio, MERT_LMEM_CFG, config);
>  }
>  
>  /**
>   * xe_lmtt_init_hw - Perform LMTT hardware initialization.
> - * @lmtt: the &xe_lmtt to initialize
> + * @gt: the &xe_gt for which lmtt is initialized
>   *
>   * This function is a second step of the LMTT initialization.
> - * This function registers LMTT Root Directory prepared in xe_lmtt_init().
> + * This function registers LMTT Root Directory prepared in xe_lmtt_init()
> + * on the given GT.
>   *
>   * This function shall be called after every hardware reset.
>   * This function shall be called only when running as a PF driver.
>   */
> -void xe_lmtt_init_hw(struct xe_lmtt *lmtt)
> +void xe_lmtt_init_hw(struct xe_gt *gt)
>  {
> +	struct xe_lmtt *lmtt = &gt_to_tile(gt)->sriov.pf.lmtt;
> +
>  	if (!lmtt->pd)
>  		return;
>  
> -	lmtt_setup_dir_ptr(lmtt);
> +	lmtt_setup_dir_ptr(lmtt, gt);
>  }
>  
>  static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.h b/drivers/gpu/drm/xe/xe_lmtt.h
> index 8fa387b38c52..5ef065dd573c 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.h
> +++ b/drivers/gpu/drm/xe/xe_lmtt.h
> @@ -9,12 +9,13 @@
>  #include <linux/types.h>
>  
>  struct xe_bo;
> +struct xe_gt;
>  struct xe_lmtt;
>  struct xe_lmtt_ops;
>  
>  #ifdef CONFIG_PCI_IOV
>  int xe_lmtt_init(struct xe_lmtt *lmtt);
> -void xe_lmtt_init_hw(struct xe_lmtt *lmtt);
> +void xe_lmtt_init_hw(struct xe_gt *gt);
>  void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt);
>  int xe_lmtt_prepare_pages(struct xe_lmtt *lmtt, unsigned int vfid, u64 range);
>  int xe_lmtt_populate_pages(struct xe_lmtt *lmtt, unsigned int vfid, struct xe_bo *bo, u64 offset);
> @@ -23,7 +24,7 @@ u64 xe_lmtt_estimate_pt_size(struct xe_lmtt *lmtt, u64 size);
>  u64 xe_lmtt_page_size(struct xe_lmtt *lmtt);
>  #else
>  static inline int xe_lmtt_init(struct xe_lmtt *lmtt) { return 0; }
> -static inline void xe_lmtt_init_hw(struct xe_lmtt *lmtt) { }
> +static inline void xe_lmtt_init_hw(struct xe_gt *gt) { }
>  #endif
>  
>  #endif
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
