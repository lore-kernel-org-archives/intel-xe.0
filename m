Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E450CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 05:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87BD10E703;
	Wed, 10 Jun 2026 05:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVzoLtYB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C552210E703
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 05:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781071010; x=1812607010;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=26HrqUEdb+NjX2ikx9uJYLanWGwoH1YrLejeTkpdoTE=;
 b=dVzoLtYBYfbRsb0EbByQmVy2BEp7xdlkztMh39AclrgEuf3UXmirabZR
 2kdqN11/w5WVYMznNHxokVSNuinu66wCO0w8A+A1GHSnfLRRDrX5SgU+1
 BJfZ88Q41OGHHRKVFqVQqk716nZzqXtwFHwy9Jh3z31vhFGDbBcDQc0AO
 iCW9i0FTYst/nUm3pgIx0Q91SNfo1lDxVhi1clipk6y0HAr6SnR4YgO4d
 We8kKxWXt1qathIASaDHEf4BAmqkxYz0drBPdKKDEdSvOY0XrNLb2AIhj
 TCbnOz1gX4NxkjYK10BHKI/A9LBa+cCCBRTrqq+WsFwi8jXlfr1Mthn+T A==;
X-CSE-ConnectionGUID: Wd4h9k1lTrikqdn4AF/trw==
X-CSE-MsgGUID: 1dgg2SbJToS+jhnHCT6BDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81966952"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81966952"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 22:56:49 -0700
X-CSE-ConnectionGUID: Rx9HIBm/SKq6z6B23WjUag==
X-CSE-MsgGUID: fGVHxbaaQrqzrU2RCVTS5w==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 22:56:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 22:56:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 22:56:49 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 22:56:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6kwJjjgg0kbx4Pkl5g+FJ+TYANMiQZI9wcwE2ijItaSrDz8CKYWCW9y7ka/WFADJjDOKfeGY9MmckmdcnXmaodgckIT7dCs0Pp96PKHjjtjwOSWJ65SH57pDPRwscx0hGtH5dmKiPbBmCFs0zDqCBGUf5tcnsiP5ncEy5OyeXAhNFmmUF484swMrC2FYjB7qUL2vpQd8DzaCh76s0oAAugTCrj+yR/kJsUY0/zkto7smSpjE8l0jRzsAx5w1tJjMDAmcRo9pcdJauDThDVCZAapudSeL3haHIT5tdsrkhrU62KLeIo2POjhzV9S+osgJAxXb/LnwtBBzsfi5YG93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unsJHye8DPFTlPx6cXncG28jb4qmpbejsU9zBrZxN4U=;
 b=UQbDhgzw+hVFaQ5AEINmxTsvAYLzWqbnjiJW20D7rcWrk2vESkOTMqYvi/60+AXa978Xx5np8/0jKuvu5RSisTHqrUB05rltFsZQOSz1Nw7Tt2WhHNmINoej04doFnbzpDOSq3xnD0lW8asfTv0eOHy5ekX19Kdl7Z2WAtGmgR4SI27S360a6be/f6tEDlfUpj2ShG/9WzJicUYXb9oIBVyYG+HT9BeN0+HiUWk97Mx4b9DphwgrIbA/5MJOHNMuw3uZgQlRMahBvv34kniglK6YTV//wsxkI7fg8E2yFIcrdPgkmgSLXoDF8Ov089NfFgxgMKeEVOBBF2BfuyY47A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by LV2PR11MB6045.namprd11.prod.outlook.com (2603:10b6:408:17b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 05:56:46 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 05:56:45 +0000
Message-ID: <2c0969a6-21ca-4d6c-92ce-52709d6eed99@intel.com>
Date: Wed, 10 Jun 2026 11:26:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/xe/xe_ras: Add types and commands for RAS GPU
 health indicator
To: "Tauro, Riana" <riana.tauro@intel.com>
CC: <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <andi.shyti@intel.com>, <rodrigo.vivi@intel.com>,
 <mallesh.koujalagi@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <badal.nilawar@intel.com>
References: <20260608052556.1744123-5-soham.purkait@intel.com>
 <20260608052556.1744123-7-soham.purkait@intel.com>
 <4ec46336-2d4f-4249-a742-2667dd12279e@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <4ec46336-2d4f-4249-a742-2667dd12279e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0278.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::9) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|LV2PR11MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f84daaf-b9f3-4218-ccaf-08dec6b50d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|56012099006|3023799007|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JX4Bok2GJ2bLTO5HqipN8LAzwqTRz/CXcLCJwGdLZMm09ViK38P37k+cVoJTkdcgMApxpqrGILnmIz9Uaey5Dc/egKoe/5kcdisLgKCr9wJJJWk/cgSQElTcNRzNIitwZnJhH+ohCwHSQ33tAIzplcrOJNVVONA6e62826kQnXmkA/bveFPWKc+GXKtnB+Xflb4lPR1lr79JV1SlvZSDN3Wfq2UeDLLd0h/ZvQgqimpuOOQX66JHuWmENoKT8kQQHdTHIzxbxT2hDesksf+c24pGg6+mDFBn6mQxgwLQb8Dy5xYuD9fb7QNoJbMLGObBDSxCRtsCFBB5CziPK8j0/WVq+YYR2pp1vf0X6EAM7jBt/wHI4cDKDNg7paOF/lN1kEHICt+P/SDO1j//eWe1rsa7d/l7LhPPG5E51Sp1lFoJ/3DIdPoP8Ej5nIUrOcsIZ3oInixM95e6GZaNjrJVPu77BlmicQN2KwJuGMW8KT2Tby0p5uny87YsH2LffexaGY1YXYaYAdz471yIE1WLhHcgJuygSdplt0tYKYXVQ+NrNMKLzZYX2wuPnlqokuBUN+NfnbXEWYvyFhULtwTvtRqk+foZGi/XlIt7eSE6ZP3W/7MFfUBnBpmNV0K/tjnxfahOUhc3VMU+Ta6ew2C270zKHvSIoGJdVTi+R+v0HHjSbG7en9Ym87o+6uqIe5Kg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(3023799007)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1pjcWk4ZjQyR0VUMFlmQzRtUEw3VWlHN3dsWnk4R3VVNFRzWHBPZ0pWUWZz?=
 =?utf-8?B?ODVBQk5BcXpKVCtpRUlkdFZOZ2xWaDNNUWxHVXBSMThxekxzQ1JpSVhvZ3Jz?=
 =?utf-8?B?bDh1UGFha3BlUlFIRy9sMHl2bS9mVTdPeWsxOUZIOUpDRFZYTkJ3dzEranVZ?=
 =?utf-8?B?Q1o5Ykx0NkFrT1Jtb2RCL21uaFRsVWVrNFlMWXRyRFZWVW5qUDJPSzBtak9H?=
 =?utf-8?B?aTRXTHhtNW5KcjRsTDE5ZXMwbE1XV1psMjREQVRDbWFzWll6am1Ob1lPZGNo?=
 =?utf-8?B?MjA4clVqaFhYbGtPVW9UZlNreTFFODVHYW1sV1EweFg4NmEvWkZUV2hVS256?=
 =?utf-8?B?ZTRiZURlNWVhYUFBNGovdDcrMTNsVUxWRFBoWTlSdXJYR2x2MXM3RTB1cHAz?=
 =?utf-8?B?cjFUSHRaNW1uUVhUeTNidU1lb1JUSE9rMStTWHEyY1lYQTRwbCtSMzJFZlI4?=
 =?utf-8?B?akN1bTBXdkxkTWg1YWc4ak5sdGtrclVvbTl0NXBVc1JZdEtCd2NWUzQ2a3Rm?=
 =?utf-8?B?N1UzQkhVamw0RjZIdlQ1SThJL0VWSXFyUUtRWHYyWGpVeStRUC8zTjlPL3VP?=
 =?utf-8?B?N0VSZzc2VXVIbzhJbDNQV3VaUy9udGF3SGxaMDVncjhFcWpTSGk4enVmaVli?=
 =?utf-8?B?Y2VzelAyUHNueWRCK21aZFZzSndIRDFENkFQUEVNV1ZGdm1nM1F5VFFFTkM2?=
 =?utf-8?B?V0htSnQ4N2FjdnJ1TnRkbm90RWRLaTdPbVFCd3llRDlQTDNqU0pOQXNGSFZ3?=
 =?utf-8?B?R1M3SVI3ejcxQUpZMnZpKzh0bU1ZRXpUbHRKV1JrVXNUY243Q0FOY3BpL1JH?=
 =?utf-8?B?ZWRjZnBNdm8vK0xzSE1pWXhkYnZubHgvemF6bHBYWmFTSkRWWnJMU2RpWnM2?=
 =?utf-8?B?cW9JOXFmekdjNStmeW5ucHY2alJ0Zk5mbk0raDJqM1JHekVBR28weDBsQmgw?=
 =?utf-8?B?MlkzM1ErZHp3NXBLZVZ6bUJad1o4b0I3UkhlMlY5TjZOakRnVjNGWlJ2S3hJ?=
 =?utf-8?B?NXRyMGp0d3ByM1pCNnpmaGJxQlplWXhQbVB2Z0JJK2pXWit0Zmx3TS9XdG5p?=
 =?utf-8?B?RkZtS1IyNTlGVFNwM3REa3phTUxGZnROczlsKzlDcitsMEViSHZ3eks5cFBm?=
 =?utf-8?B?aE1RblFlakpzR3hydWtuUm43SmdNaFZnWC84NHBjbkloUTUxcFhlVlgzM2JX?=
 =?utf-8?B?cHgydlliakhHaGYrZU1KaENtd3RiTnZzNWpPdmpFZ3NqbXNFMVBEaFo5WnZ4?=
 =?utf-8?B?NVAzZWkvVDJBYVNOVzh4c08xeEJnTTZVNE1WaHhaZW5FQjBwZXI4Vkg0dCtE?=
 =?utf-8?B?a2M5VVA3eWg3U3Z0WnB2WU5IdTBJNGcxeHBXeDFiZGJaR08zellTZ0JuRU9E?=
 =?utf-8?B?RUtKS2w1NjdueDdDdkZnZmNvdTUrQmJkOG5SSnN0R1FnaXYzM2ZUZUxVbXdI?=
 =?utf-8?B?amU1Z2k5czhtalovWkxXeDN5ci8wU2hEMzNvQ250S0xISHcwV3VQaERmd3k3?=
 =?utf-8?B?U0R0R3pCQXRzZFBvOVRORm5HRUZUQ0p2WVc2b3hpUVFpcVlMQUlabitlN1RP?=
 =?utf-8?B?R0czcVVqRjR6d0pDenhsM1MyQUxlZ1JzeDc4RFFOeEtjQmtoUEE2Y3EvOGl0?=
 =?utf-8?B?aHBVNUpmSHRxVnBmU3NsNU9wZEZVdEdKUjRGUXM1WlNnaGlUZWxSaEx6Q2tq?=
 =?utf-8?B?NjU4VklDL0wzUVIvQzhlRlhxUzVzZU91MmhKZk5KVkxodTV4SnQ3YkZzSFBN?=
 =?utf-8?B?K0FuaEpLZklWOGMvR3l1WHUxU1dCaU1zTm9iZU9TcG1JMUNYQnQ4V29RUHp2?=
 =?utf-8?B?a0pWZXJPY1RIM2ZHUW9ITm9vOVRHeEJTRWVtWkVYc21ESThaTEw1dlNXS0lF?=
 =?utf-8?B?KzdoNjNXS2hOQTJvRGFnOE9IUlBnVkkzNEZiWnJoenVicGVwZ0tDcFVFYmY0?=
 =?utf-8?B?NytSWnNyRHJoc25LTXkvbTUrU2hOMGhaeDRQZzNiVGtER2t0Z2g2UlovVVJa?=
 =?utf-8?B?eGtDTkZIUEFIRkJGVmYwSVV5ZnZrcXBpN25rSG9lV0hvbnlUNnlqS0JXT0Iw?=
 =?utf-8?B?UlVyNHZrbmwxTTRrL0xIOHA1ZlRUL2JmZ0RETXdNWmFtUnd0NUpGZmYzODlG?=
 =?utf-8?B?WjhHeWEzeEE0Y3lkUXhFV3pFWHd5RTFTRkNrc0NRVDNpL2tpQVgrWFA5c2t2?=
 =?utf-8?B?YkgwMVIzMGhZYUc4cVBMQkxOMTE5ZlkzcFo3MmxQZ2N0VTRjY1FvbDdYOXpJ?=
 =?utf-8?B?dHZ6NndLMzBsb0Z0c1Y0ZnJTYVJZQWl2aUx4SHprc2tBTFgrM1k3cENVc1R1?=
 =?utf-8?B?TExZeEFHVmFjc2pBd2Ivcm5EZElHVFZVcEJxVk44cVUyM21EaVRsQT09?=
X-Exchange-RoutingPolicyChecked: D6M3iNWIPO43ir9DYmyDktLvz4FpfGwgoDUpo/rER9si0LAQ0gyOlWSYerj+YaP1a0HnkKfjRonwwEVRc7JOf5pKOkGd4naE3F/hFCIEQQyB+MfL9e3VeQ5UMAwp1GEVklmTrOgBHANs/65pXVwnur9qu65xWtVX1O8RpbvXcgchlQiLuaNVIw373sQt5kSKQKdw3Z/RlupDVOq/hqvTcLQIQK6cTvZ6NZ/sv/YqRLqqVC9Y1msNsTNncXV9nZ0S6RQ2Z9w+iarPzuPEfsn7WPnnl9gLVilNXTioq7HrldVzHAlYp/TuBoLhHkosI4KGRfEQ0bboHCH7t8UwHM+Q5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f84daaf-b9f3-4218-ccaf-08dec6b50d86
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 05:56:45.6339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzJbi7eBRKJYzeWkgjy9fFvOCi44cJQsLnJzMv503VALmDuI9dluaIAIhX6Eu1WvmYDDwpLmdvx/S4T8MSXY9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6045
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


On 09-06-2026 19:40, Tauro, Riana wrote:
>
> On 6/8/2026 10:55 AM, Soham Purkait wrote:
>> Add RAS GPU health status values and mailbox payload types for
>> querying and updating GPU health. GPU health states are encoded as
>> numeric values defined by enum xe_ras_health_status, and the GET_HEALTH
>> and SET_HEALTH commands fetch and update the current state through the
>> System Controller mailbox. struct xe_ras_get_health_request/response and
>> struct xe_ras_set_health_request/response describe the corresponding
>> request and response payloads, with the SET response also carrying the
>> operation status and resulting health state.
>
> As suggested in previous revisions, please keep commit message brief 
> without structure names .
> Instead explain functionality, when user can use this and values.
>
> please keep the structures in the same patch as implementation. Either 
> split get health/set health
> or combine.
>
> Also do we have a consumer for this? and igt?

Level Zero Sysman is the consumer for this.

Thanks,
Soham

>
>>
>> v1:
>>   - Add enum for health status instead of xe_ras_health_status_t.
>> (Andi), (Rodrigo)
>> v2:
>>   - Make logs and structures consistent with their counterparts.
>> (Riana)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras_types.h             | 57 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 ++
>>   2 files changed, 61 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 6688e11f57a8..438746b5ffd9 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -10,6 +10,21 @@
>>     #define XE_RAS_NUM_COUNTERS            16
>>   +/**
>> + * enum xe_ras_health_status - Device health status values
>> + *
>> + * @XE_RAS_HEALTH_STATUS_OK: Device is healthy and operating normally.
>> + * @XE_RAS_HEALTH_STATUS_WARNING: Device has minor issues but is 
>> still operational.
>> + * @XE_RAS_HEALTH_STATUS_CRITICAL: Device is in a critical state and 
>> may not be operational.
>> + * @XE_RAS_HEALTH_STATUS_MAX: Sentinel value for validation
>> + */
>> +enum xe_ras_health_status {
>> +    XE_RAS_HEALTH_STATUS_OK = 0,
>> +    XE_RAS_HEALTH_STATUS_WARNING,
>> +    XE_RAS_HEALTH_STATUS_CRITICAL,
>> +    XE_RAS_HEALTH_STATUS_MAX
>> +};
>> +
>>   /**
>>    * struct xe_ras_error_common - Error fields that are common across 
>> all products
>>    */
>> @@ -121,4 +136,46 @@ struct xe_ras_clear_counter_response {
>>       /** @reserved1: Reserved for future use */
>>       u32 reserved1[3];
>>   } __packed;
>> +
>> +/**
>> + * struct xe_ras_get_health_request - Request structure for get health
>> + */
>> +struct xe_ras_get_health_request {
>> +    /** @reserved: Reserved for future use */
>> +    u32 reserved[2];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_health_response - Response structure for get 
>> health
>> + */
>> +struct xe_ras_get_health_response {
>> +    /** @current_health: Current GPU health, see &enum 
>> xe_ras_health_status */
>> +    u8 current_health;
>
> Nit: It's already in get_health. So can just be health
>> +    /** @reserved: Reserved for future use */
>> +    u8 reserved[3];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_set_health_request - Request structure for set health
>> + */
>> +struct xe_ras_set_health_request {
>> +    /** @new_health: New GPU health to set, see &enum 
>> xe_ras_health_status */
>> +    u8 new_health;
>
> Ditto
>
>> +    /** @reserved: Reserved for future use */
>> +    u8 reserved[3];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_set_health_response - Response structure for set 
>> health
>> + */
>> +struct xe_ras_set_health_response {
>> +    /** @status: Status of set health operation, see &enum 
>> xe_ras_response_status */
>
> Nit: Can just be status. It's already part of set_health structure
>
>> +    u32 status;
>> +    /** @current_health: Resulting current GPU health, see &enum 
>> xe_ras_health_status */
>> +    u8 current_health;
>
> Ditto
>
> Thanks
> Riana
>
>
>> +    /** @reserved: Reserved for future use */
>> +    u8 reserved[3];
>> +    /** @reserved1: Reserved for future use */
>> +    u32 reserved1[2];
>> +} __packed;
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 6e3753554510..d4da6e9ef774 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -25,11 +25,15 @@ enum xe_sysctrl_group {
>>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status
>> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
>>    */
>>   enum xe_sysctrl_gfsp_cmd {
>>       XE_SYSCTRL_CMD_GET_COUNTER        = 0x03,
>>       XE_SYSCTRL_CMD_CLEAR_COUNTER        = 0x04,
>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>> +    XE_SYSCTRL_CMD_GET_HEALTH        = 0x0B,
>> +    XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>>   };
>>     /**
