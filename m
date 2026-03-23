Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD13EC01CD
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 12:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4643810E021;
	Mon, 23 Mar 2026 12:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nG+YJ4Ut";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F16410E021
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 12:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774268883; x=1805804883;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lkyeHmMgKnywmgFzjwCETBBZ00rkhibGbVkN94dh9S8=;
 b=nG+YJ4UtCQuC+z+k+QpooHFc6YdD/RhxkMS9u48yVMnmf6eBSYjGPRXK
 N1Kc7SDONDCToJxEAyGO0CVkDZjW7VLxTciWAQ6zM11ZxhdreX/aCdwaE
 skQpVJ+EWPbx6abCEalpV45Zl1OPE6c2KPNkxSZ5NFWdhc6WyKmtbsBJG
 MYEOB7AwRiKNysFOwCpmQ8eQsg70YT1zbp8DVhZXWdtRcbchC2+GZFleb
 2/if6vfDEmR9blcSx1AXfonPwnF7Te1So4J5DzEqTK5zVSsCwXCmz7eQ9
 QUvtVaFMdkSMYZTLzgDaMUTxMPbF+dInVRNnNe1O8lGVdlLiTtUevhcsz Q==;
X-CSE-ConnectionGUID: S+Hn3M89SvesVnadEc+Czw==
X-CSE-MsgGUID: BDnSmwR6SAOe6WBYF12T6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="100717010"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="100717010"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 05:28:03 -0700
X-CSE-ConnectionGUID: yU2EuEvPQ4avp2HXoMvmEQ==
X-CSE-MsgGUID: SQmq4BZCROKzqOPtaXqoOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="220747488"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 05:28:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 05:28:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 05:28:02 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 05:28:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELTGQkw+FCRZj42Folvhk01oPTRCncNI9Wre+lx1alJGO9RvFoEOrx1caUYsxcUpfyDZo3JtwE8h9zfrmi7iBLt6b5kHtjJMwwODnl6t3ft/zBIlGS9cpHhToc8RUq1ItqRI7MEqjcwMDdQLogfGzlNE2eie4u66AXGYl6QnzaDw138cZeqoUfidDqrERK7vn2Zg4fkLbzYH2U0XM8l7hoq/yXHJv5tJG7YvhLKmDi05gsEee+JJPQMnAHEuW/HsE7i+eDG6FD6KW7pzUljKQcjGhGYFWOxdOTL2DqrBXzjwz5FxpIx1sdzbAWFnZ67sUJwhdPb/OnJfy4ZvQpYDDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bi8qMYJwymnPqJsCpI/0x2xAHyF2UGVCWz6eIJtjoZ4=;
 b=Grm09sUz0MBIBf+ctAcYnaSvltj6sQx4qqGlnoJPiK18F/45WGgg+QZCa7AdDPgMr3wvmpfwMsF/bNd3OsHrc4z6K9BxT2yAOV1zgE/FFOk/N4LVh181On8rhL+fToO1NWAP8YJuJIX21f0m/KpTGwoBPW/IOPXjRdktnzcWg/qeEsb55i45nq9/1gQbGlI3DyvTamPgq5oD6jUo/Rf7QJKhK/C5HgYQlDJbPDv7DP6DJfwGZRg5oSiNEtqi5oq3lw7FZBTukVmEw6YMOMDhlwP2niwNxnjhhYSlQe0F/NLeSHwBubme131VRDpUkIjY9W0zn3bcq/QOeCksKTJJKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH7PR11MB6605.namprd11.prod.outlook.com (2603:10b6:510:1b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 12:27:59 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 12:27:58 +0000
Message-ID: <5c7b5cac-fcde-4127-9c85-d6c9b25ccc30@intel.com>
Date: Mon, 23 Mar 2026 17:57:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/xe/sysctrl: Add system controller event support
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, Riana Tauro <riana.tauro@intel.com>
References: <20260312090657.4026013-1-raag.jadav@intel.com>
 <20260312090657.4026013-4-raag.jadav@intel.com>
 <c05cf845-311a-440e-973b-7bc17359fecb@intel.com>
 <acEmmG9VgdidyP4z@black.igk.intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <acEmmG9VgdidyP4z@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0209.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::6) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH7PR11MB6605:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea46fcf-eb5e-4f5e-21f6-08de88d79dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: t4qrCNdAq7D4NJQbxFKquLObAcCc3KxlAIf/TxVEXKV9/DEr3mnHqg+MUaSC3sx2qKn0UeV9aPg174MHYVbbzsqgwF3ON0JjKzzIteVWgrvtx12LRigNO04qlBXahA2+tqUYQb8+zMtuis3R20b0PAjLkP7TQBSgTDOJ9/PooeX82tZEbh4lVA1Rnei1wk326HTlh4p0HvlwMTGF90mA//3rs87J72mh5MdXRqkplA3TWtJ02oogy3AFI9fTux5/ypBeRhRxC1Kf9mjAi0UQBJ3t96fLeiWt7dvtX/3+f7/JiFm93fs5nEFcBG7t6qDhCs3vbzxLdG/UChzBfR2x60aak0Az9IoTJB90r9t0e3r66DDHLYTbAMsf7u8fb2fmtZhF4f9URUaW/PD2RfTM30pUDF76efYzrcf1rKshJRm8IgiCPI/iR/dY+DbBKoMHzK9JkDB34dHJeSzJsJawi2gfEnsrjzSbq1vPwMt+7BXR3ytrm5nqwLR1X8wAsZWv4FAx5O+JgxKfo2bdvxLbFwVG9uMqlrJ2PraqU6c3UPC+AE2qNytEZlJGZxx4jQiMGHKBzwmvS4f5uTfR4mAlgZzMB9q8MsY7K1gZwhmQKcoXE9RIxUuXV2onjH82mrYLuXEVn/zVH4voFYm6QztpaYjQy1n80dCWT6KakJx9dbhLPWadQ7QDCHQNK4+uYuTGXVfoW7VYez1i4FIZmSaMiLs9D62mSU0PIgE7WNxy3ic=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0Q3SUJMR04wNTAzaU5PVnlPY2M2ejc4VDV1MCtON2xSUXVLczg5cCsycW1h?=
 =?utf-8?B?Q21xOWtZdnNXSkc3QnJZbXN6UmJPdjBVb0EzcUt1U0VLM2RBV1ZnNm5YRW9B?=
 =?utf-8?B?U0l6LzFjVmxQWWM1c0lyOHgreWV0Yy9kUVh4QWg3SnFuTGJCaDRCbFQ4RFBM?=
 =?utf-8?B?RStOdWs1WmVIZmlFR2VZbGs5aW1MZGpqNDErMFBwd1lkTHNlN0ppUnUxbGsz?=
 =?utf-8?B?YkRrNkIrL3NMVnhDbmFOTU1LUUtqd0JVMU5oNWZ0RjBxbWpUeVFuWnlJTmJQ?=
 =?utf-8?B?Mm1nZFJtbFk5b1BKOURxL3J1QVBud1J2anBzaTh0QTE3aHZPbTVkS2VLNEpr?=
 =?utf-8?B?dkxablI2UlV6OU5GUkVEM0NIWUowa3VLUEtrWnQvTkoxYmVIcUZZMDZNYk4y?=
 =?utf-8?B?dnV5OXdpalFmYUN1Q2pzZWNyQ0xuMlNmaEtFV2JieUdtOXJURlZEVElFN3Nj?=
 =?utf-8?B?QWx1ZWZKakJ0NnJpWTd5YkFrRm9OMGtGSzVGRCtzQXVseUJXZkJDb1pUZjJh?=
 =?utf-8?B?VDBHV0cvSGFqQVhyK0l4R21NRG1XY2RwWC9VSnFJL1lDUmhvQU9EbngxTnJN?=
 =?utf-8?B?bklTS1Nxdnd6Z0dsL1JxYm5BalhQa3N0YW1KV2JXbVVWTndyLzlLa0tnQ3NJ?=
 =?utf-8?B?R3I1OHYvUG5XcUcvRFFaVGkzb0ZrZUovcFFBeEtHOVNPV0tXZ0NCUVFQem0x?=
 =?utf-8?B?Tm0yamttekJNeWo0cmROUnlHNHVEZGdncWtSU3JWcTFtWE1IVC8veHRmbFZx?=
 =?utf-8?B?UVNkWFRSR2JCakVtTmtnWkQzb1BqNjArWHlNTWZ4VkFYRzJsTllQbHlZeTdp?=
 =?utf-8?B?ZmNWUGFjQmxqa3BJazM1amduRzNpbEFiQlJtbmNJck1SbmhOQWErSUhSMVFK?=
 =?utf-8?B?MWRYMVh0WktkMkJMTkRpTnhnbHp2dUVqellza1FJcmk5UWpNSFBGY1VaM2ZV?=
 =?utf-8?B?RUZUeTRrb21sRHlQUmR4a1p0QmtoVGpKNEFvMjlteHRHMlM2KzNDbHlKL0tG?=
 =?utf-8?B?R3dRMkxaVTFCT25ITy9EcVpndFBjRjAwMjduNVRwTmRVT3NxbUJjZ0VIdW5F?=
 =?utf-8?B?UU95OWFoa2g2UmlTbEZ2NXJ3N2lLb0RVdWVTclBEdFF5QktiREQxR1RYSCs4?=
 =?utf-8?B?dnV5TkNCUnF3ZXk4dGdpMmxpV0ZjMzloeGt3cDY1S3E1TXdqMzFpVWtlb2wx?=
 =?utf-8?B?bzhzSkQ0aUsxRUtCS0dWMGVUUEg1NzFzeE43VWwyR2xGN3krQmxhUStpU2h3?=
 =?utf-8?B?WGVHMWNBanFNWUd1MHczbzdoY0J2WUZFK3RURHljRDM1VWtOTys3U2pZa0tZ?=
 =?utf-8?B?cGxiSEw4NkJlUUpSQmFYbVJWWjE2ZHRHVkxLeW1NaDUxcEdkQnU5cjRzdTli?=
 =?utf-8?B?dXhldmRZUTFrUDVVRkRmQjdPWjJKcWJqZzJIL2U5ZkkzUU5QeUNDTC9kMWRi?=
 =?utf-8?B?cHB0YkV5em9TQXZDVHZpMkF0c1lYZktGZG8rbUN6SFM3cWw2ZTZXRDJBWnVl?=
 =?utf-8?B?cUJMS1R2Sm1vTndDbFQ1aHJqdmFWWmoxUDRnZzd6YTFlVEQxS29ZT2pVd1Aw?=
 =?utf-8?B?bzVtZHo3L01UZ2h2R0Nxc0Rmc3FCWGRYUGdndlVrNlRJcUlPSllZMzBUN2RQ?=
 =?utf-8?B?bmpGZG40Z0JsQnRFV29vS3VST3JUTFMrTUdFVGtFN1dHNFNsSHFObzJ0elBp?=
 =?utf-8?B?RFhZZjY1aFBNdDA4RU1CUGNhcmQ1cU5hQlBScWtXbDcwaVV5Z0psUmN5UGE3?=
 =?utf-8?B?UW1kbS9ncmdNang5TGw0MWE0NmQvcEZJdjFrRTRKM05XcXd3eXA1ck82SjRm?=
 =?utf-8?B?VXJlNkY4SHB4cGpIeURFckt4cW5SclgwWWNGUXZhM3QySVRoQm1mYTlxbysy?=
 =?utf-8?B?NHYzQWxEU1pFUWZhNzk3SnNFeG0wRkZRMEZwZUsrcGQ2N2g3RExqVDJJSDgy?=
 =?utf-8?B?WFlzOEdtc1RMeHBFWFRNNUJZMGxGR05yemFsT1BYeHdRUkhVWkszamZJV204?=
 =?utf-8?B?TnBMWXhlK3VrUDdUVC9jWEd5Z2JNR1liYkp1ZVppemg5d1dYV0l6d1huenhD?=
 =?utf-8?B?M0NpeGEyeTdBNGFyUjhXNDFldnNNb2JHSHBsU1VBakpld2xqV2xObHF1aCsr?=
 =?utf-8?B?Mi9SMjQxVGtmWTZDWk5Ca0hlb2JtbndTYzZqUUR6ZkR0RExjNWZwbDhZbnNp?=
 =?utf-8?B?ZUNER2thQXFaZ0JJVTZGU2NVaktWSWtOU0poTVViY0l2Q3krZGE3TmI3NGxS?=
 =?utf-8?B?bjF0dENKSkJyUGJHQ0kwSFZNM1oraTNQUzYvU2ptVWJGa0RSTUZCdERPd0Ru?=
 =?utf-8?B?QlR3MVhMUll0VXlFVG5OMU1McjRpNVJ2WHE1Rzl1dHB2UUl3YTQrSjV1U1dZ?=
 =?utf-8?Q?vBKNNDH1A0yv1DjQ=3D?=
X-Exchange-RoutingPolicyChecked: CGfKKFuuukDsnrSqlDaAcqIHB16q/5azkv3NeRjKJ7uOKIX07Ue9cFKbyEcIrIytfnhi0RRSbRI+XDsn3HdsPe7zC2AqDX5iS/GXbp60L0n4ifkSSwk3hmUl7vrwp7AXA+LJC+pzvKNmnaYWttDGXfXiylRCLSwajiDd/1sc8LaXOvkaqqUqQrcfQ/2JF0Q+Nw0UKj4VsxR23W8jHRljcA8ECA9YF/Vskg7hZb0l/UNPGaal8A0qGrSfBGW3fToJOoFToCG1cII8UhWDUkHzlUa8QcbXNHIqDct8fT4a+p1mLp8qK2JRjyJcVmC+p1O5JvSoRiBdiJXyKo3P5KI+Kg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea46fcf-eb5e-4f5e-21f6-08de88d79dfa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 12:27:58.6565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faCA0AyGMymS/NptLqTWY/Vi5W/SsqvRxxzcHj6ctjFwbNbIdE6btszv6M9qst5glqtt2i1l8aT2IaPbyGuUheSv+ST8Hg+ce4gvJ+ipYPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6605
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

Hi Raag,

On 23-03-2026 05:10 pm, Raag Jadav wrote:
> On Thu, Mar 19, 2026 at 07:39:12PM +0530, Tauro, Riana wrote:
>> On 3/12/2026 2:36 PM, Raag Jadav wrote:
>>> System controller reports different types of events to GFX endpoint for
>>> different usecases, add initial support for them. This will be further
>>> extended to service those usecases.
>>>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>> v2: Handle unexpected response length (Mallesh)
>>> v3: Handle event flood (Mallesh)
>>> ---
>>>    drivers/gpu/drm/xe/Makefile                 |  1 +
>>>    drivers/gpu/drm/xe/xe_sysctrl.c             |  4 +
>>>    drivers/gpu/drm/xe/xe_sysctrl.h             |  1 +
>>>    drivers/gpu/drm/xe/xe_sysctrl_event.c       | 82 +++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_sysctrl_event_types.h | 52 +++++++++++++
>>>    drivers/gpu/drm/xe/xe_sysctrl_mailbox.h     | 10 +++
>>>    6 files changed, 150 insertions(+)
>>>    create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
>>>    create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index 543eb0b2430b..373adb20afb2 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -125,6 +125,7 @@ xe-y += xe_bb.o \
>>>    	xe_survivability_mode.o \
>>>    	xe_sync.o \
>>>    	xe_sysctrl.o \
>>> +	xe_sysctrl_event.o \
>>>    	xe_sysctrl_mailbox.o \
>>>    	xe_tile.o \
>>>    	xe_tile_sysfs.o \
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>>> index 30349df1c04b..63b9aaf98669 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>>> @@ -42,6 +42,10 @@ static void sysctrl_fini(void *arg)
>>>    static void xe_sysctrl_work(struct work_struct *work)
>>>    {
>>> +	struct xe_sysctrl *sc = container_of(work, struct xe_sysctrl, work);
>>> +
>>> +	guard(mutex)(&sc->work_lock);
>>> +	xe_sysctrl_event(sc);
>>>    }
>>>    /**
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>>> index ff60d42b52a7..0821ea44893d 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>>> @@ -18,5 +18,6 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>>>    int xe_sysctrl_init(struct xe_device *xe);
>>>    void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>>> +void xe_sysctrl_event(struct xe_sysctrl *sc);
>>>    #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
>>> new file mode 100644
>>> index 000000000000..47afca586bd1
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
>>> @@ -0,0 +1,82 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#include "xe_device.h"
>>> +#include "xe_irq.h"
>>> +#include "xe_printk.h"
>>> +#include "xe_sysctrl.h"
>>> +#include "xe_sysctrl_event_types.h"
>>> +#include "xe_sysctrl_mailbox.h"
>>> +#include "xe_sysctrl_mailbox_types.h"
>>> +
>>> +static void xe_sysctrl_get_pending_event(struct xe_sysctrl *sc,
>>> +					 struct xe_sysctrl_mailbox_command *command)
>>> +{
>>> +	struct xe_sysctrl_event_response response;
>>> +	struct xe_device *xe = sc_to_xe(sc);
>>> +	u32 count = 0;
>>> +	size_t len;
>>> +	int ret;
>>> +

Ensure that response structure fits in mailbox buffer by checking 
against XE_SYSCTRL_MB_MAX_MESSAGE_SIZE (1024).

Thanks,

-/Mallesh

>>> +	command->data_out = &response;
>>> +	command->data_out_len = sizeof(response);
>>> +
>>> +	do {
>>> +		memset(&response, 0, sizeof(response));
>>> +
>>> +		ret = xe_sysctrl_send_command(sc, command, &len);
>>> +		if (ret) {
>>> +			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
>>> +			return;
>>> +		}
>>> +
>>> +		if (len != sizeof(response)) {
>>> +			xe_err(xe, "sysctrl: unexpected pending event response length %ld\n", len);
>>> +			return;
>>> +		}
>>> +
>>> +		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
>>> +			xe_warn(xe, "[RAS]: error counter threshold crossed\n");
>>> +		} else {
>>> +			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
>>> +			return;
>>> +		}
>>> +
>>> +		if (++count > XE_SYSCTRL_EVENT_FLOOD) {
>>> +			xe_err(xe, "sysctrl: event flooding\n");
>>> +			return;
>>> +		}
>>> +
>>> +		xe_dbg(xe, "sysctrl: %u events pending\n", response.count);
>>> +	} while (response.count);
>>> +}
>>> +
>>> +static void xe_sysctrl_event_request_prep(struct xe_device *xe,
>>> +					  struct xe_sysctrl_app_msg_hdr *header,
>>> +					  struct xe_sysctrl_event_request *request)
>>> +{
>>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>> +
>>> +	header->data = REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
>>> +		       REG_FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_PENDING_EVENT);
>>> +
>>> +	request->vector = xe_device_has_msix(xe) ? XE_IRQ_DEFAULT_MSIX : 0;
>>> +	request->fn = PCI_FUNC(pdev->devfn);
>>> +}
>>> +
>>> +void xe_sysctrl_event(struct xe_sysctrl *sc)
>>> +{
>>> +	struct xe_sysctrl_mailbox_command command = {};
>>> +	struct xe_sysctrl_event_request request = {};
>>> +	struct xe_sysctrl_app_msg_hdr header = {};
>>> +
>>> +	xe_sysctrl_event_request_prep(sc_to_xe(sc), &header, &request);
>>> +
>>> +	command.header = header;
>>> +	command.data_in = &request;
>>> +	command.data_in_len = sizeof(request);
>>> +
>>> +	xe_sysctrl_get_pending_event(sc, &command);
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
>>> new file mode 100644
>>> index 000000000000..1430a7ee2b39
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
>>> @@ -0,0 +1,52 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_SYSCTRL_EVENT_TYPES_H_
>>> +#define _XE_SYSCTRL_EVENT_TYPES_H_
>>> +
>>> +#include <linux/types.h>
>>> +
>>> +#define XE_SYSCTRL_EVENT_DATA_LEN		59
>>> +
>>> +/* Modify as needed */
>>> +#define XE_SYSCTRL_EVENT_FLOOD			16
>>> +
>>> +enum xe_sysctrl_event {
>>> +	XE_SYSCTRL_EVENT_THRESHOLD_CROSSED = 1,
>>> +};
>>> +
>>> +/**
>>> + * struct xe_sysctrl_event_request - Request structure for pending event
>>> + */
>>> +struct xe_sysctrl_event_request {
>>> +	/** @vector: MSI-X vector that was triggered */
>>> +	u32 vector;
>>> +	/** @fn: Function index (0-7) of PCIe device */
>>> +	u8 fn;
>>> +	/** @reserved: Reserved for future use */
>>> +	u32 reserved:24;
>>> +	/** @reserved2: Reserved for future use */
>>> +	u32 reserved2[2];
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_sysctrl_event_response - Response structure for pending event
>>> + */
>>> +struct xe_sysctrl_event_response {
>>> +	/** @count: Number of pending events */
>>> +	u32 count;
>>> +	/** @event: Pending event */
>>> +	enum xe_sysctrl_event event;
>>> +	/** @timestamp: Timestamp of most recent event */
>>> +	u64 timestamp;
>>> +	/** @extended: Event has extended payload */
>>> +	u8 extended:1;
>>> +	/** @reserved: Reserved for future use */
>>> +	u32 reserved:31;
>>> +	/** @data: Generic event data */
>>> +	u32 data[XE_SYSCTRL_EVENT_DATA_LEN];
>>> +} __packed;
>> Let's add this in xe_ras_types.h to have a separate RAS layer that utilizes
>> system controller.
>>
>> Since multiple functions will be using system controller keeping their
>> headers and functions in a separate file
>>
>> will avoid cluttering everything in a single file. Let sysctrl.c only be an
>> interface to the firmware.
> I had an impression that a sysctrl event is meant for wider usecases than
> RAS. Did things change (again)?
>
> Raag
>
>>> +
>>> +#endif /* _XE_SYSCTRL_EVENT_TYPES_H_ */
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>>> index 91460be9e22c..d59a825597d3 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>>> @@ -23,6 +23,16 @@ struct xe_sysctrl_mailbox_command;
>>>    #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>>>    	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
>>> +/* Command groups */
>>> +enum xe_sysctrl_group {
>>> +	XE_SYSCTRL_GROUP_GFSP			= 0x01,
>>> +};
>>> +
>>> +/* Commands supported by GFSP group */
>>> +enum xe_sysctrl_gfsp_cmd {
>>> +	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>>> +};
>>> +
>>>    void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>>>    int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>>>    			    struct xe_sysctrl_mailbox_command *cmd,
