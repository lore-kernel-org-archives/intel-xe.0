Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC553C44501
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 12:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8882510E332;
	Thu, 16 Jul 2026 12:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9UN9+yj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3B210E332
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 12:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784204924; x=1815740924;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vbsEJsPaDIfW/EYFW4xQ2dyAEu09z/Z6a26NJEWPFR4=;
 b=l9UN9+yjK8wfvzGl7D7I0WSHzFIloPn7uL5sXcIB1X2gqQFEHA4MIihJ
 WERajU7yZyb/WmokO6V2SQ58AqK+Dz1r6z9Ex/QGX2gHs3NrnGvjjEZ/B
 zO5Z6ds02LrDSPIRRA2r/TCZyVH3l2tN+1d3LU4w9GphDpxAaaId6BB41
 q//hoghrPASNQ0aOu9EcD96OfvLLqkLDZv3+0ZfuIPR5e0HXVHuzuzoy9
 RLwhUzSnUKsCQ5E6C5BOF7w55vub54Iynzi22tH3ZulZXG6L24JPZq6oC
 77DhMZsgNvwwC0GUawbE6rHPPl3mMZ745yalik9YoGd1J64/8C1LvYZ1O A==;
X-CSE-ConnectionGUID: 9W48mARyR/aTfbeDEG0YvQ==
X-CSE-MsgGUID: zJlQBCDrQf6OMpp63wlutw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84715729"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84715729"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 05:28:43 -0700
X-CSE-ConnectionGUID: 4akN2Wb8Q0K5nykL8goLNQ==
X-CSE-MsgGUID: dcJoJao4QeK1q/JaZ58XJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="261408457"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 05:28:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 05:28:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 05:28:42 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 05:28:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmklFl1yIU0o0yrMHhYo/FkX3eUmrSUWyhcIXSg1hxruWvPG6vpcpIh8JR4AB7FFIhfEhCpBdR6h5VVdfd84BeWcbmPLhT4mR1tQnACSm2Xx3HxMTVv3Ons5sY4hhjtOJ4pYO6wOobjcsJO8+3LBTEICT64VKfrNZIPxmPjSHSbCuAORhWNf0XHd9uz2QikOXgpVZems16v8EKa7YD07kaygm6zb5bX2OwjQW4oxs8JnYqLc+l+tvxok35iireGp0T9xJPx1v0C1oqguq5Obpkov/rG5h5fKwqaYdo6MyQo7G3ETugVm9uSEgOYu/6YUHK9Erut1A3xJ3Noie0qMnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAkhNdh/rOJVDfXrJh4DKxwCOr1A5RbWYxwKGQB8eMI=;
 b=s+OdQGCYXTeJYXyY7koUS/lk+jIsyef1j0X425NIaFJhCwvGak6C/7i9w7X+vgP1Ucn7k6C7Ybu4kfMaeGem+3dT9UfcTINd/SXzg2eLyKloFwI67k3JNLKRiiYOJLQJUaE+ldGUTtqfVF6vhR0VMVRY9RzI9euWdxdUQVhCEfFw7gscfdripYJSZFXPbaMPnakjh2+8CEnYs/i9B319AuuQ/XglgypIpcQGuhgXXxj/TykthWrVSDnO6CLjsx4pQUC3BXBTs8ACeKjTL3rBor7CXZzen9bXStiV0074MnzrEPuB1qlokZamHzFri8g7WmS235wE+PzO1uZKCVafew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH7PR11MB6699.namprd11.prod.outlook.com
 (2603:10b6:510:1ad::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 12:28:37 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983%8]) with mapi id 15.21.0181.017; Thu, 16 Jul 2026
 12:28:36 +0000
Message-ID: <0019218d-361c-4475-9381-d0ef4f62f5ef@intel.com>
Date: Thu, 16 Jul 2026 17:58:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] drm/xe/vm: propagate BO page-size requirements to
 VMA map flags
To: <intel-xe@lists.freedesktop.org>
References: <20260714105538.170849-9-himal.prasad.ghimiray@intel.com>
 <20260714105538.170849-14-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260714105538.170849-14-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0166.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH7PR11MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 98dc05a1-93b0-4914-5b53-08dee335c256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: pByw6SsyCcArTcWxuAmzhez7vyrUTYLuJgtY8+ihsYApVA3s15E+5+H/ifst5cqu98XHs6zoMO3Y+RXpyjiVmWmSlBL1lhQoYGItw7vjt2sR1Vqg6IVwfTPyOBp21zBrX/7Tun3tulfNiMyN3wyFq2KE9GUIhQjlb/FOZs2/tpP/fTPnxWi0ts0dr8wkGuwAOBoxFmYvwet4wMbE/lhYp2/7cot/bsi9vQGgAlxXbdutdIaIzCV7KLSgK+f9ypiStyhK2uSH2q17ytmrJ5280gf+H/zT2RsNNJhZ+0HaEqhbDcaC7+v2VoRtAPCjzgd4T59LnnWhiMy+mz09tNyOVmPddWTajfzqq0Ovi9gysHqz9hPr+92WwsiSHPnX4EN/0wi1zFAAunwfUAv7HQVNTZIpyecQb2bWBdtS1L8kZ8eA467TdVSwxpHf6t5ZcC0RAFdmyWC/qTPEKCmZbNcdmtajJIdq/4Uv1LjDLjSi3nJ+nIK534jzk06gxnvrqTx1jM6/ZVIGX1SmgyQZKZPVd8ZodWdV1JPZRDMTwR5zl8HLiUur4yMGemFLfTAKXDw4+GJyfPDS4E1Qoa5w8HOWm768i7kXV1MHWPCk4/lLg7BxVp45h7lyfZ+rCkC99UDxIOUmfJcm4NTBrwgeDk1OACXIL1xEQxwvsspFzNoOprw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnZvMkhTU0dqSlBVd2VobFYyK25qNmJTZGkxRHpZKzlHcFkzTnNTUGh6SEcr?=
 =?utf-8?B?R1JVVHlHLzFqNVlqYmJObjRldHZiaFFUNW9XMEpqYkFKSTdTb3AyZTR4dEZE?=
 =?utf-8?B?QXZUOGZGd0NzNDhDZThNUFUzQUVxa2ZVR3VHY1NueGxiemp4ek5kNjY1MDBG?=
 =?utf-8?B?WDVrYUZBK0VraGZQZGFvR09ETnJiUlB0UmZjWDhKTGFrUkJRS1F4czRhR2F5?=
 =?utf-8?B?czkzN1NBdk5WbStIYWpFcm5GWDhUdkoxSTJkRXV1dXBjbTd2Ymt5OWJQQlMr?=
 =?utf-8?B?enhEUFFEaGEwZ1NoVmZpYXUvVVRVNlBMc0p3ZXFJbGdydCtDZzBreFdUNEkz?=
 =?utf-8?B?MEl4a2Y3Ym1BTm9rN2UwMWFzdTB5TGhwRFE5TVZGYzM4b3Z6NFltb1ErODRQ?=
 =?utf-8?B?Und2VEdNN0pvSThsalN4aTdwanVuR2hiV0xMRExlNGlaelFaTWhWWWFkWjQz?=
 =?utf-8?B?TERWbmpMN3Z1bmxqY3kwTjlYNm1kQnJCYytERGhZM0xueVM1cTFnVkNLb1V3?=
 =?utf-8?B?NUlxbDJxQ2dZa3hZN1hCTzNGRHRyVmsxN0NISm92b3JuOXVBL3A4cmh5ZlBC?=
 =?utf-8?B?VWVIdExqSGtnRUM5eWFiL29jcXVPVm1tTkpiK0wxTk43cVpJM090NnN0UGpU?=
 =?utf-8?B?a2tFWFJVZTlFeXhYVllBMGJpYkQ5Z1U0ZzlPQjdjUkM5RmdFSUloT0U5OGpX?=
 =?utf-8?B?Y3hwOGE2NElIZTg3M2JlWWpRbUZTMFRQc3NGS0EreG51a1dBZ2VPb3c2ZE44?=
 =?utf-8?B?MW9pNHVVdXBQUmJvbTY5U1FUSjRkeGZNeUJybHhTOWVCWXA3N0pFZlVPbFRW?=
 =?utf-8?B?Q1I5elp4ZnpiZWpxaTV1QjU4ak5sVmhKLzVoUC9kM0lpelVMQ2FwNzBCOHpY?=
 =?utf-8?B?RHdWVFlBTW45aTQ0M0wzQzJ6anBQTDF0dm56NE5lZ0ZQTS9QWlRSOHIzYWE5?=
 =?utf-8?B?M055TVVBQ2ZwSGxMaGpnaDV6QS8zMkxjUzdjQVBYeE9ES1p5TitWZTlMNnhI?=
 =?utf-8?B?ODcxSExmK3p2OGZielF6MnhUWjhWRHdtbFRQRWk2Tm8yUDROdlFmRzdCcytX?=
 =?utf-8?B?Sml6eVRzWFlDT3hqbS9neHNKOVFFT3I5L2grbUlqV3dPVTMxZW5hZlBucURY?=
 =?utf-8?B?cFN4eEF3U1BFeXM2VTRXclQvRzhiN1lQZVorb2Zsb0ZDR3BZNlZsRWVET2Qx?=
 =?utf-8?B?M3Y2eVl1UnBZZDZUWWZVaTRTQ25ZWGlLUE85V0ZZMzd5VmQxZGJGRXF3Z09S?=
 =?utf-8?B?OXJwdVZ2c1ZvczkzMnZubStBSERaakNQYXk3b3l5dDVCSk9ZY01LRmNUMnRR?=
 =?utf-8?B?YUg3OEtGYUgzRmFxZ2JkUUNHNlMxQVlLSFNSK3I2S3ZNdGZFNndOQ2Q3eEdh?=
 =?utf-8?B?K1orb1NsdnVGS3JtVFRrT0VocFJHcEoyamhubDg0ZnArVjYvRnBQUzJQajRL?=
 =?utf-8?B?SitYZWZkNkFEMDVLN3hqZ3lWV2Jld1pSclB4UHVYMy95elI2M0FDdHRVVThF?=
 =?utf-8?B?Y3hYY2JpS3B2TmNneUNQZ1F6b3Z5RkhmUXBUa0tXbXpRZHJ4MERqc29UaDVZ?=
 =?utf-8?B?OFR6YmdKYjN1bmJNYkpVbGY1TkZrWVhkRCtNaTBkbURwV0NXUjgzWFNCaFpy?=
 =?utf-8?B?RnEwMnJ1WFlMcXFZK3ZEQmdXT2VBaTdJZHVHT3F5ZlFsUW4vSnM0dm1pc2ww?=
 =?utf-8?B?NnJrak1CN1dFZnlQbGw0eWFISDFRdmNUQkE2R2JNc1FTUGlDN1UzNFJmamgr?=
 =?utf-8?B?dlNraTBBTjJ4MFdHM0drbnp5QjF0MWZ0RTc2dTFqZFlreW5GcTRvTWZOem1S?=
 =?utf-8?B?dVBOK0xRSTlLZDlOWlZvZ3llSExDd1YyejBQRzZXcUNnUG8vTmgyeEtmbWlr?=
 =?utf-8?B?VWx2Qlg0QVd2UklTYTdILysyVHAyUHE5dXJDalNZb1Z4dGRBeklENGdReHRK?=
 =?utf-8?B?Qk1FRWpxQkN6MUFxVnhlYnlvMXpqNCt5eTRBVy8wK01nU0JNQWM3S0lsWFRr?=
 =?utf-8?B?TXVDRjdHK2p4ak5URVRYM1VyVFlsTk10ZDQ3c3VSQVZ3Ym93bE51THp5aWpE?=
 =?utf-8?B?NHdpbFc2YnNpOE1kWXd6aHl3MlVRSVdXQ1BPM29NVFRkdGZaOTNmZVJmOG52?=
 =?utf-8?B?YnlGWmVuSFBEaElVQi85WXVJeENFbG9iblg1d0o3SlNnMnc1Qi90N0ZhbUkv?=
 =?utf-8?B?UlNzOGlWN3VidldzZFExMzZ0RnRBQk5TbUNFODZwdGU2M3dvTS9wYi9UYll6?=
 =?utf-8?B?WFNCN1ZCTndpUjN3YzdQSkg0MEVod09LcjM4MEtyWEcySkFKNGFEbFJKaGd5?=
 =?utf-8?B?VDhyY3VkQlIzWEQyeDlWMGJjOGhkaSt3L3dBSXA5M0ZXUUR6Z2toZStCYWFU?=
 =?utf-8?Q?ojrhMmh1UkN0K79E=3D?=
X-Exchange-RoutingPolicyChecked: s8Ikt6aE2mcN5SR2RzpbfBNqj6it/vzvGlkiW2wX3bokRMACIYcrCyOcJI8Z/2hs5BM93hrXcr/55Etnc9FEFJvKuaghRNzh1HTQpBCS5Ai0IBBcr9BEjN6GT3AnvzbwxhSQT5x8wMUhgdFA1q8Tf11S/JjEl4oRAaCxZpY7BTmbUZvd79iJjyCK+3qnSUwMZtbOBPiqhFUsVahyjriAZJsdv5JOSf7q934Cjdp8CkQOZ87cELO+74PmzKWSRyPuxWHLJ1gpIPExbyNO1AUHo1HOEgYpQKXyAUTZbnlJe+zBV0cn4X6l91fEh2cMLOX93Wa/bfpTvTPJ0qaC1k1BOQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 98dc05a1-93b0-4914-5b53-08dee335c256
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 12:28:36.8139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I13Iodu36ss3keJT0wF0PN1m6acR5B/XgNfMWh948Q8HPxl3DW2DppzjumHmssDUGhNE6AP8raluuuO6oLK8NVn4vVO6MMmnwUBJlmevNXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
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



On 14-07-2026 16:25, Himal Prasad Ghimiray wrote:
> From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> 
> Propagate user BO page-size requirement flags into VM bind map
> operations.
> 
> When a user BO carries a page-size requirement flag, set the
> corresponding VMA PTE flag during bind-op construction. This covers
> 64K, 2M, and 1G page sizes and allows the debug page-size allocation
> policy selected at BO creation time to be reflected in page-table
> mapping behavior.
> 
> v3
> - BO page-size requirement overrides prior map-state flags
> - reword commit message
> v4
> - address review feedback on XE_VMA_CREATE_MASK dependency
> - carry 2M/1G request state in target_leaf_level instead of vma_flags
> - propagate target_leaf_level from bind op to VMA state
> - avoid using accumulated gpuva.flags as future bind policy input
> v5
> - v5:
> - Reword the commit message to match the target_leaf_level-based
>    implementation
> - Clarify that BO page-size requirements are propagated through
>    bind-op and VMA state
> v6
> - target_leaf_level is propagated to MAP of
>    vm_bind_ioctl_ops_parse

IMO, the patch is not needed, we should be able to use bo->flags 
directly in pte layer.

> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c       | 30 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm_types.h |  9 +++++++++
>   2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 23f4a9fb9a49..729f68a20cf7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2406,6 +2406,23 @@ static void xe_svm_prefetch_gpuva_ops_fini(struct drm_gpuva_ops *ops)
>   	}
>   }
>   
> +static void xe_vma_apply_debug_page_size_flag(struct xe_vma_op *op,
> +					      struct xe_bo *bo)
> +{
> +	if (!bo)
> +		return;
> +
> +	if (!(bo->flags & XE_BO_FLAG_USER))
> +		return;
> +
> +	op->map.target_leaf_level = 0;
> +
> +	if (bo->flags & XE_BO_FLAG_NEEDS_1G)
> +		op->map.target_leaf_level = 2;
> +	else if (bo->flags & XE_BO_FLAG_NEEDS_2M)
> +		op->map.target_leaf_level = 1;
> +}
> +
>   /*
>    * Create operations list from IOCTL arguments, setup operations fields so parse
>    * and commit steps are decoupled from IOCTL arguments. This step can fail.
> @@ -2501,6 +2518,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>   			op->map.pat_index = pat_index;
>   			op->map.invalidate_on_bind =
>   				__xe_vm_needs_clear_scratch_pages(vm, flags);
> +			/*
> +			 * Propagate debug BO page-size requirement into the VMA bind operation
> +			 * for user BO binds.
> +			 */
> +			if (xe_debug_page_size_supported(vm->xe))
> +				xe_vma_apply_debug_page_size_flag(op, bo);
>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>   			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>   			struct xe_tile *tile;
> @@ -2823,6 +2846,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>   				return PTR_ERR(vma);
>   
>   			op->map.vma = vma;
> +			vma->target_leaf_level = op->map.target_leaf_level;
>   			if (((op->map.immediate || !xe_vm_in_fault_mode(vm)) &&
>   			     !(op->map.vma_flags & XE_VMA_SYSTEM_ALLOCATOR)) ||
>   			    op->map.invalidate_on_bind)
> @@ -2864,6 +2888,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>   				if (IS_ERR(vma))
>   					return PTR_ERR(vma);
>   
> +				vma->target_leaf_level = old->target_leaf_level;
> +
>   				op->remap.prev = vma;
>   
>   				/*
> @@ -2894,6 +2920,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>   				if (IS_ERR(vma))
>   					return PTR_ERR(vma);
>   
> +				vma->target_leaf_level = old->target_leaf_level;
> +
>   				op->remap.next = vma;
>   
>   				/*
> @@ -4778,6 +4806,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>   				 * unmapping.
>   				 */
>   				op->map.vma_flags |= vma_flags & XE_VMA_CREATE_MASK;
> +				op->map.target_leaf_level = vma->target_leaf_level;
>   			}
>   		}
>   		print_op(vm->xe, __op);
> @@ -4824,6 +4853,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>   			 */
>   			if (is_madvise)
>   				xe_vma_mem_attr_copy(&vma->attr, &tmp_attr);
> +			vma->target_leaf_level = op->map.target_leaf_level;
>   		}
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 635ed29b9a69..c94328662dfc 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -174,6 +174,13 @@ struct xe_vma {
>   	 * and encoding of the PTEs for this vma.
>   	 */
>   	struct xe_vma_mem_attr attr;
> +	/**
> +	 * @target_leaf_level: requested PT leaf level for this VMA
> +	 *
> +	 * 0 for normal 4K/64K mappings, 1 for 2M huge-page mappings,
> +	 * and 2 for 1G huge-page mappings.
> +	 */
> +	u8 target_leaf_level;
>   };
>   
>   /**
> @@ -422,6 +429,8 @@ struct xe_vma_op_map {
>   	bool request_decompress;
>   	/** @pat_index: The pat index to use for this operation. */
>   	u16 pat_index;
> +	/** @target_leaf_level: requested PT leaf level for this operation */
> +	u8 target_leaf_level;
>   };
>   
>   /** struct xe_vma_op_remap - VMA remap operation */

