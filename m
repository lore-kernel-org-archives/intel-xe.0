Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD645FEEF55
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 21:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C4110E4D7;
	Tue,  7 Apr 2026 21:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSmPAUXZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C3D10E4D7
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 21:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775598560; x=1807134560;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=45F12AmafdRmccyND0QXSMlvDZXcO0Bi6nC/uprn9jk=;
 b=GSmPAUXZARqqZpQwWvtnCZo/zWIAp6ikYxNisZ84kmamJ7+6Vyg2napu
 +AZ1GGif1Pg/f/GLpMMWF+dW/oMuSaQVeoTdEeJWGFYvEcb+ht5aOYO0S
 /JHc+rA53+2i+axv+eG+kzfwsgSVd/D66kF+iPem5qS8RABWmmvPwAZik
 WtNoO58ornnKhoV6WXmJx/PTo3NrlCIOcKnyLIQaqmTRIt4OTHegLXkqa
 ZF7po6DjiD82b5EqHwLegW7B9/F0KXr/m10Xxw381ACt3XgKx5BbDEYBD
 R78u9IRJhWizFPFoWlw/jAq3fMflPGI2LrHAW2MGWJLyn8DZeoMpYwm2r w==;
X-CSE-ConnectionGUID: uLNPT5YDT+S01hxpxwTsRg==
X-CSE-MsgGUID: ZXigi5C2QkGojxpZT58GZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="79163397"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="79163397"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 14:49:20 -0700
X-CSE-ConnectionGUID: /YRtrObeRU6PYIihagUK1w==
X-CSE-MsgGUID: VyJ19q4uRl27H590ANcPgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="228221285"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 14:49:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 14:49:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 14:49:19 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 14:48:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4IJfQFrV5KB2U7NIQ7j2mMv+C1u529RjaRc63RcUFAM2dA7K0mVqhYYZY8nC/sohaobWo0rXo10ca9vvNmAaEyR5JQLYYOdI7THfqO8eAx24Navdqn4R8IfIUtfX/UKNtzK+qnhwHNDjDjV3Y+OhnWI4WabwYPiv0V8yNbwZ6m1Hn7M+kMWPDzIwZgrtgrpPcHwtYbXohivucbNVVb1CeZsQyuI6FVmTn1CGl7hhtLLPuGqU6avAZMb7uiU+0sHkC1zH6wMAnrFkYfnda5axfOt7prEvB4smzltAM/p0gUPVDY/hhHJ3d3RuTEnxwPHfOKyQgG12aqWdEVjko3tSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTOpJWicRrziKu7h8AXro9RcA36sPDGeYHQLRVS++Zw=;
 b=U5uuYmKk1kHuHzjpf5NeV7t6HcqU45lR/SOMxPpTicfWu41unpgKDL9TQCzuuwqNBfaaZiuR2x0c+w/6S1DXvOJfyAfvr4DwFDs2GJ464lSUN5lIN2TvzJ4NhrtXmrNTnJp90/+Dt9hK5D+TDcHWrNtPDW8L9KIzySkeboS3BdYQ6h6fKFDyUlyggSZrcMOP0lwa3hYZ2/BUuiizIU971iPmmpY7xr469O+XWBMJQghEpOqq1fVP1aoha2jWjLnPJflD8kA6iv+/B9vbk9yKcdx4SPLjsUDLqJ8qecPFIM3UXCRDzihSGqk/3LnExJOJulTjPnlRrNeFTwLwC1txVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by CY8PR11MB7194.namprd11.prod.outlook.com (2603:10b6:930:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 7 Apr
 2026 21:48:40 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 21:48:40 +0000
Message-ID: <3600d72a-160f-400c-a747-788f072b8d00@intel.com>
Date: Tue, 7 Apr 2026 14:48:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/xe/uapi: Fix doc formatting and completeness
 in xe_drm.h
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260407030046.3394004-1-shuicheng.lin@intel.com>
 <20260407030046.3394004-7-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260407030046.3394004-7-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|CY8PR11MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: ab74f842-88d7-47e9-5279-08de94ef6e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|42112799006|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XISXE8dmIIi9205YgHjgsHfs4Ap7CRb7RzTYwvlAXrXEun6Cx3/akMDtcDdBXrPqHs1mrC5kq6qPewf8Qlo7GLMRb8Q43qPx45zC3BbF1rroUkdyo4hJUh+ptb93Iwt+65w9NEGqDG5lt7y+HsYm70EYsRIKZN+mv/uZuD8PTpPqDsNk4e9cNRNqMwKw3h//MYRYSFb+kg5BdgUcptdNv3KiWHmroJC6abJcEhjz2RORHO3vg3DmtbghmipWWpEVsPzSFa+q1D/1waq38BIhmoeJ+Ar1iA8vVXK943e/2csYocLU2DFwPjefGcDJXaeBlTbcmbhfYC7eiEmBPvW4d6W1PGLiJ5jR2jvrCHZF9wrV3Bf0DI756p2w5AozR/mRLoVl5OK3NNFvsISeGGO1ED1EKti5D7CmAmkiWq0F+XrqRCKtVBMFidIOBtYVT70tsf39RVkVbiM19mcJIrl9K9jlAtTGDL9qNr7gt54HyyZqdSKfgf+RAMZNZW2uTIagtMZMjobR7ozZhjn5qCcBSE3kZx+LONnPK96XE5CRxkXelk7H6X4M5Ju+FU3rQa4gssvERzD2cNk79RSjUmoIIuiu+d9IJm5XAdcAOeQortfhFWgyvCskEM6d9DcUVBBi0TollrYCbuAzJ9MBIoOpElJQtej//BQILjfno0AUGmEOG7cjzfOarWvE58tZKpYjoimSa1pu7hV1N7VFiJbUQ6MhNrbXF1R22Nq3dsPeaVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjBiazl0WHNpb1puVW9rRE0yY3ZWaXhrdTd2Z0J4YldRbXlnaXVKbmlUcEFo?=
 =?utf-8?B?NXlIelhFcFA0bi94ZTJKQkkxbnJESHBKcmhLN21KNk05a2J4YXJmRVFPaHFm?=
 =?utf-8?B?U0lDZzM1Qm1meHNxNzVvM0h5cjZ3UWFVbHk1dlpVaHhBVXF3UU9icjcyanNE?=
 =?utf-8?B?eW5hUkR1akY0ZXUxc1NSQUtyOG4vallwbGU1N0NEUzZpSFNobWZvaHI2cW9N?=
 =?utf-8?B?YjBEVmtOaE5QTUxmSzduSmFiYkR6MnhuRDQ1M2N4N25hMjZNSm52ck9pSGgr?=
 =?utf-8?B?c3BFeVlhdStGN1U2bEJ3MWRPSFJQV2s3LzI0SklOcm85T1VDUitqN0lEOUtE?=
 =?utf-8?B?NVNFY3UyaDZWalpOU0l3Z21hcmNSNG1KYWg5NzVRL2kvckpkOVJQc2xIY092?=
 =?utf-8?B?ci9Lbm96VW5PdXl5by85cnFxVmpPNWU0bEVuTDdVS0V2SVpWZnN6aUh6Ujg1?=
 =?utf-8?B?ME1uZVBQdzFhaFFaSEZxQlgzUEc2cUpKa01LOXo5aEd2TFdUREsxTnNSeEhN?=
 =?utf-8?B?RlNtS1RKQkxNNDBBOGkzcGZMRXdqL0hXRlVvbmZxbjQyVmVndUhkZk9nbUZV?=
 =?utf-8?B?T21yMVFiclhXMWp4dGtxUU5WSk1CWjRIaTQ3NmhBTnluTHMvdUplNzArdm4r?=
 =?utf-8?B?WFVCWlRNTlhFMHdMcmhxSXJWN1FJZytYbGx4Znh2YVIvVUh6NytzQWZyNldo?=
 =?utf-8?B?eFBsVlZuKzNxbmo5ODhxb3VSSzVNcEJjTW5yQ24yN0JhVERnWGFZekd4UUVH?=
 =?utf-8?B?Vkh4WVpCcWUwYjl4Vm5KdWtPc2oweXlKanVHV0FrUHgyTkIrUW1IeTl4b3N6?=
 =?utf-8?B?aHRmWGxXZW5oZHFhZFF1WmtvczRiZCt6S01nMStDcHFBaE1VYlhxUXdkcmp1?=
 =?utf-8?B?NXJaNnpKK2hiOGRWYXAyL1lOMmI5aHBoM3BLdEYvRVdmNHMycStSSVRRMDBI?=
 =?utf-8?B?R1RXM2RBcEpYUFlPZVp5dHJTYi9nUktuYzdEMlp5TXIwenVGV1FvRFpxWWZM?=
 =?utf-8?B?ZXV1cllNc2IrdGh4Y045NHJCaUNDM2dnZUZ2RUc0TS9Ka1o2UVU3eHczb2pR?=
 =?utf-8?B?VEFEeTZSY3JRK3MxTjFBNmVpUHkvMis0Q0F0dEVlY3ljbkRyV0YrTmNmaXRL?=
 =?utf-8?B?RTNKRUxCd1M4TEtIRy8wZ2ZWNU53UGhpVkJlVktON2oxajFTTFdTcThpeWFy?=
 =?utf-8?B?R1U0VzRpWHVSWERmRTdxTHdzVC9RSWxuWjRUR2s2K1FNWS9kWU1SVEhDMDJN?=
 =?utf-8?B?V1U4Uk4zakI3cU9Qa3g0czMrTm5GYTBHOHlndk5yeG5zQ0ROVjI0NFh5ODVP?=
 =?utf-8?B?TWlNNlBsQ2FINVBmc1lBWk5DM3Btbyt6ZzdIeFcxNmJ4dnRxVXIxT3N0Ujlv?=
 =?utf-8?B?N1FvVkZoSVdBN2hGMW42cDdoMEJrOFkwaytoejdWRFcrdzZVVHZYcWZnbm9H?=
 =?utf-8?B?K0Q3UmIvRlN5RVZ1b3hwcUlCK0pEMVlnUWxQNDZWYkorQVJ4K3lnNFVtbndM?=
 =?utf-8?B?OGZweGZNOGtlUTdlOU10TCtXSW1YNUF4eXF1R1BRQWFUaHJNZUJqMHZLODZX?=
 =?utf-8?B?MGtUeUM5M3FsOVRnS1M2RU9Xa0V6OVVwS1ExQmp5UFAwYXJtMFRpQmRuUktt?=
 =?utf-8?B?R0xKUC9BeFh2WnZjaG5zaGJWZWVHODNTWUE4dVRwbGFKM1lmNnc0SkFBTDkx?=
 =?utf-8?B?WEtGMFM1ZEZpbFhYYS9Hdk9JbmRETVZBbUZUdTBCM2ZCTHZRKzhQakc3a3hJ?=
 =?utf-8?B?dEwwY3pySExubzNsbkNSZ1lMdUI2NCs5RWlncGxlNlZBUDZGckY0THJkWW5S?=
 =?utf-8?B?WjhiUEpVdW5rZTRneWN6Rk16R3pjbTRuQ05WL29aRmZSbDFVZDFiWitlbDk5?=
 =?utf-8?B?d0sxNlJRUnM4cnZGVC9TQVlOQWpRYXBCd1VacmhFdWNzaGw5T28yQUg2S1Jt?=
 =?utf-8?B?OFRVQk9PVUkwekNMRFo3NEp6S3pCR0xmMnNaL2xSR20xcDR0d0pxODI1d1gx?=
 =?utf-8?B?QzFtbU1mYzBEU0xQajdOZzlFZ0tSYVFsVDhHUXhnd3lvaFBZWWdwamgzWW05?=
 =?utf-8?B?ZW9iRWUrbHArOXJhS0srSGtWL3NCL3lFd01oRmk5Z3VCaFRackhycjQ0N3Nt?=
 =?utf-8?B?cXdCYWNJZWlRYytsQXFwYjVMT3Aya01BMkxJa3hVYlU0elhWZU4zdjZoUSsz?=
 =?utf-8?B?dmJaUk1DWXhsRXc4OUd6M3pwNGNyY3YxMEtsaW4zUUhIZ1ZDTUkxbER2TXdx?=
 =?utf-8?B?VmR1T2UyRU40dTBneGtJUVBqRVB2YkxrZksvSjB5VDVFTDhUNkQyTXh3OHpw?=
 =?utf-8?B?UGxpNWN0OEtBMWozMTNnT1VWOHZmLzdOWkdhbUo4azBuWE1BbHlVdz09?=
X-Exchange-RoutingPolicyChecked: T2b/IdbbYZ/XpiDOOgv4SvGVqMV5daO0H2Pc9jJBM9gm3/s4ER7HivUnouK3MhZpNDkUDcPHbptTXOooO+D19aNWhdacWRZSPWfo3DMAjJ2CNefzzoff9fm7MoNHbwLkWJmWKDiyipr9g1zypDQeDzmnxAPQOtL5X6M/Kkt0aAaP9bT0sjd6eBWfR4CF5mrLJcUCO1IDH/Pp4ZtA5x/kXHONLAjX1o94+qQQeR4mqLjdu8PANqIAlx0bkvbsQMJR0gzvTanzpEa1T8KrPGwlf0LJdo4oQuKhWcv163ZI23+Ffh7957HrzRbWcVdZZKxBK+YPg6k2J9yaLSkEAmpC0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: ab74f842-88d7-47e9-5279-08de94ef6e7b
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 21:48:40.6574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHyO2AMZrkQMjxEkeZDy7uVJ6O8io21ahesiDZhiAzftM4bMuoD47VBMqnV3wPWOO8LQxhg5t+zYyCu1vTdP1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7194
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


On 4/6/2026 20:00, Shuicheng Lin wrote:
> - Fix missing leading space before closing */ in
>    comment block
> - Add DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY to the
>    IOCTL overview list
> - Add missing query types to the device query doc list:
>    DRM_XE_DEVICE_QUERY_UC_FW_VERSION,
>    DRM_XE_DEVICE_QUERY_OA_UNITS,
>    DRM_XE_DEVICE_QUERY_EU_STALL
> - Fix ioctl's -> ioctls (not possessive, 2 occurrences)
> - Remove duplicate parameter docs from
>    drm_xe_mem_range_attr overview (already documented
>    as inline member comments)
> - Fix extra whitespace before /** on 2 lines in
>    drm_xe_mem_range_attr
> - Add missing blank line before DRM_XE_VM_BIND_FLAG_DECOMPRESS
>    bullet to fix RST block quote warning
>
> v3: more fix (item 4 to 7).
>
> Assisted-by: GitHub Copilot:claude-opus-4.6
> Cc: Xin Wang <x.wang@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 58614f62d65b..48e9f1fdb78d 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -83,6 +83,7 @@ extern "C" {
>    *  - &DRM_IOCTL_XE_OBSERVATION
>    *  - &DRM_IOCTL_XE_MADVISE
>    *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
> + *  - &DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
>    *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
>    */
>   
> @@ -167,7 +168,7 @@ extern "C" {
>    * Typically the struct drm_xe_user_extension would be embedded in some uAPI
>    * struct, and in this case we would feed it the head of the chain(i.e ext1),
>    * which would then apply all of the above extensions.
> -*/
> + */
>   
>   /**
>    * struct drm_xe_user_extension - Base class for defining a chain of extensions
> @@ -705,7 +706,10 @@ struct drm_xe_query_pxp_status {
>    *    attributes.
>    *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
>    *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
> + *  - %DRM_XE_DEVICE_QUERY_UC_FW_VERSION
> + *  - %DRM_XE_DEVICE_QUERY_OA_UNITS
>    *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
> + *  - %DRM_XE_DEVICE_QUERY_EU_STALL
>    *
>    * If size is set to 0, the driver fills it with the required size for
>    * the requested type of data to query. If size is equal to the required
> @@ -1060,6 +1064,7 @@ struct drm_xe_vm_destroy {
>    *    not invoke autoreset. Neither will stack variables going out of scope.
>    *    Therefore it's recommended to always explicitly reset the madvises when
>    *    freeing the memory backing a region used in a &DRM_IOCTL_XE_MADVISE call.
> + *
>    *  - %DRM_XE_VM_BIND_FLAG_DECOMPRESS - Request on-device decompression for a MAP.
>    *    When set on a MAP bind operation, request the driver schedule an on-device
>    *    in-place decompression (via the migrate/resolve path) for the GPU mapping
> @@ -1760,10 +1765,10 @@ struct drm_xe_observation_param {
>   };
>   
>   /**
> - * enum drm_xe_observation_ioctls - Observation stream fd ioctl's
> + * enum drm_xe_observation_ioctls - Observation stream fd ioctls
>    *
>    * Information exchanged between userspace and kernel for observation fd
> - * ioctl's is stream type specific
> + * ioctls is stream type specific
>    */
>   enum drm_xe_observation_ioctls {
>   	/** @DRM_XE_OBSERVATION_IOCTL_ENABLE: Enable data capture for an observation stream */
> @@ -2379,14 +2384,9 @@ struct drm_xe_madvise {
>    * page attribute table (PAT) index, and preferred memory location.
>    * Userspace allocates an array of these structures and passes a pointer to the
>    * ioctl to retrieve attributes for each memory range.
> - *
> - * @extensions: Pointer to the first extension struct, if any
> - * @start: Start address of the memory range
> - * @end: End address of the virtual memory range
> - *
>    */
>   struct drm_xe_mem_range_attr {
> -	 /** @extensions: Pointer to the first extension struct, if any */
> +	/** @extensions: Pointer to the first extension struct, if any */
>   	__u64 extensions;
>   
>   	/** @start: start of the memory range */
> @@ -2413,7 +2413,7 @@ struct drm_xe_mem_range_attr {
>   		__u32 reserved;
>   	} atomic;
>   
> -	 /** @pat_index: Page attribute table index */
> +	/** @pat_index: Page attribute table index */

Reviewed-by: Xin Wang <x.wang@intel.com>

>   	struct {
>   		/** @pat_index.val: PAT index */
>   		__u32 val;
