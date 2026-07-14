Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC45C44507
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 23:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC4610E086;
	Tue, 14 Jul 2026 23:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6MLkPco";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF86F10E086
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 23:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784072126; x=1815608126;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q9Xf4CbWgUfkgPRekfF2+tq1NY3WKLCWiXnu5X80LH0=;
 b=e6MLkPcoyGCmPFTP7oQoTweAmNCT0Sc7BNQlDAsVANQzFEgQ9jrdERpd
 KUZhqFs5gKiSnLzYVdqha+suIj3HUjZ57WtpIz8tR1NaSMqWDiZwuS5cE
 BDUCsSmo+kP8mLiMNzivwNaq5YwIb+/fYXgXy7osTnOgYlnU7zNynDbI1
 7d16f7GzczHBMuxIeo18kFn1V89DFwqWoR6BKCV/IM7enaZ1gxhcY8E3B
 dpOZk0wrxoUJ6UT3kncFaVidvBPkumJDdu5oJ2/+ZQVHdBP0RB/skR0Bl
 LjEvQFtVoP5gHoUXgVZGY6pzQpkCo8XeMDDHBgENokkb3Vh7Y8QUesTad g==;
X-CSE-ConnectionGUID: /iWecxuHSxGD/L5okLu+oQ==
X-CSE-MsgGUID: CUBI8VuGS4meSZehu9/idQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83826924"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="83826924"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 16:35:25 -0700
X-CSE-ConnectionGUID: Ch9B0/UbTcOUuj3f0zvkzA==
X-CSE-MsgGUID: TQgiScHERzKoiYNJHw/5RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="259576396"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 16:35:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 16:35:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 16:35:25 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 16:35:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4kWdBM/Wwc/PLxZ/RNuHF4grqQ5XnBwbQ0I9zPjB0V0ryWywbn8ho4FHlyfT0/W5upl12tCEGblgmrv0Bal4dYAwfqMaw7R4jNG67AP5/lZVylHmQsVdDjWwGYHU9mQ9jvzZuF/bcqZ7Q4GHOMHV6BODlgqfolH4aGdGG1d/bxYZXURV289KTqFbN2YfNY52uHUdG2ztpyqYfEurxkNYRqDFXjiBVifimoAGwWy/eMVL5pRolF1q4xuUYnBkHZhjaTLHq7SB0Zo5Z3/HxRnuvlxttndT2O7R9vt9iqkTvaQItfvYfFGX3H/DKXBDxe47odeiAHVdcuF+AyfYZAysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOgH+fiG7L0+8+a953hzawfPu836PN0eGgQRnV0CrwE=;
 b=ixCWyDXeK//PUu+/FK3ENMVSbF0VOJ19Ds3nDE0ap/woeOWALEsP83ZyZPdkhjLMF4iCmeIzEYMQMmTN/uCSXLb+ORd6D6k2LIPpmP++z8hTf9XdADxQfftk3tINRt7dE1DUQB0M+1ylJIt9QTk8eQa4sYFDifVMn5KZXkWoK4iHAzk02p+GS6nrSasNklxISRfTSojgrFU8xhKdJFSBZv+Rh3urpvqTJ9gHt22PBAtF/mGAcmVn3Dhb1PWYNqqvHq3EXTA6zZl4kFf6bjWUKy1NCIi3hHToqNDm/HBq0EYkuPdHh6ktYUvMf3dIdzjYic22eLdrxCwgBoBZuxEppQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by DSWPR11MB9931.namprd11.prod.outlook.com (2603:10b6:8:3a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 23:35:23 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 23:35:23 +0000
Message-ID: <4a889ab6-ddb9-4143-afba-2016590f121c@intel.com>
Date: Tue, 14 Jul 2026 16:35:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/xe/xe_late_bind_fw: Enable late binding
 support for CRI
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <michael.j.ruhl@intel.com>
References: <20260709143926.3980581-5-badal.nilawar@intel.com>
 <20260709143926.3980581-7-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260709143926.3980581-7-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0154.namprd05.prod.outlook.com
 (2603:10b6:a03:339::9) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|DSWPR11MB9931:EE_
X-MS-Office365-Filtering-Correlation-Id: a0ab1666-ec05-4875-c13e-08dee2009328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: bbsra3mHpdVirM9Ky74NtQHs3hdK9mneH8rQvg8bLE/Pw88ku+ztCbFOzVgkSpXz4PFoyCbqTIO4VW6m02E+E8DQOYUs9AxWb7PMErbf9CvR1bkrd3FJEVpgKr8PxJfE6vBQbZberfd4YxkAF2TP8BfB6mqSL3yFuH756Mz8gxAfEafPU8EzZ7ncK8zMd7FECoO58/nGuR9gxOW3vmNNKj/bMxJgEg3dsirjWpXMwyh8CJSA24iyEczIbwg7C9H4M+U8R4g3pPYdErQ4YgH9iVUii7aeSMBGO2HatKXWvaEqwyS9UzTdIPaJwMR6qVDB9LHoi6Psq903Cqb1aWGt71ShkcGHyVBxc8ODVAcJYWb0ZnVtWmaIraaPcasQhJC62mcTLuMLyc/Thy+wd+/rTcO+Bvv2vNBdsVQ6MzW/5EBGKDUyjwPXETKW/EHBYGfr9EKCuh5bQL/8dpQxRygeS+G6jqTt29sX4gqZwkm/sAjhLfFK5dO4MZ6pkGtPnNeCkKpeLJnlMTpKjxa1FDWbui9K+ZUaKu8ydhSWJjpM26CA6B7lKBCgll298H4DVZSrWCmH2IFmlURjIjSo69F3fn9hM3lc1d+s1oZowNVKQL6PGnq8FtOzIx1LFJXoDTxWcHLNuNx+PLar3VRrTb4JBsaBDZ8lXsz+3yLTMjrDYfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3lFNjFrUXRhRFVFKy9USVQvTU1IVTFlditwQkxlaDE3WXdaUXR0bk9kSmhN?=
 =?utf-8?B?am5idmpRQm85T1h1d3pVYnZRdHFzZ1VPcG1CQ05JNUg4ODRjYXdWVFBla3Ni?=
 =?utf-8?B?ZkVCdUJyZTZ4SVZBYWhraC9EOFNaSXJvek1vNitheFgwd3hDZTkwQ0dWV2Vl?=
 =?utf-8?B?YVd5aW5mOTZkRHRLcTkwRENJUy9ETEZ0TlNZbEN3QStSdUg4bUFjUTVwQjdm?=
 =?utf-8?B?cVZ1ZHluRDZ2MU45THA5K2lxcGFuR21scDA5Vm5QRFJZSEhobHNGM0dIZlNM?=
 =?utf-8?B?Mk4rU3hDekFaL0tJWG5NWUZ3ejBWMEI5UDhJdEpUL2lnZk5QRDJoUEpWTkNh?=
 =?utf-8?B?Z3RXL1RCSzgvSE96ZGlnUTZFVGcwY2hNblFPNzNGVitRVTBiRlJ1eENmN3FP?=
 =?utf-8?B?UUdMcjBzVzNjMUZEcS9FQXZkd2QyYU9XWk9nS21sSjdxQi9VMTlETXB4NmJl?=
 =?utf-8?B?ZlY0QllJMlFvNU52ZmJsTUxaZStZVWNyMTBiT1RhS2VRZnE0cU9OTGZpVjNK?=
 =?utf-8?B?eXRGQUVObG9UQnI2N0N0RHFpbUF1YU1NOHlhRUFXa05yL2hFeUZ5WVpHWHlv?=
 =?utf-8?B?eE9kL2tueHplTWhoZEVQK0pHanF6eEpDa0h2NGhBeWpYNkl1YTZGQVVTd0RV?=
 =?utf-8?B?TzNFa0hqTTdBR0RNSnIyVjluOFJuNUxMS3NrYzlOQUJkWVA2bElXVHNOeTNQ?=
 =?utf-8?B?Z2tqR1RnUnRncUU1ZnJPV2VpTUQ2eTdFT09hUGF3US9ma1p4ZklLbGhwT2Rm?=
 =?utf-8?B?OFlJMHl6cjlScWNmK3JBaWlWU2FDSFdUVlNEY05YdG9QZW1qYmw0Umk2emcy?=
 =?utf-8?B?M3pURFJmclEyV3RPUUxZaFVmYWNxWmliYVpoVDgvajdKS2pFZmw2RFFiYVht?=
 =?utf-8?B?d3ZWdXJxVDNuTWtwNXFOT1B0ZGxHN1NtdHU5b3R0OUJGcDZFMXhZTUwySDJL?=
 =?utf-8?B?WGNrVExzVE50cENIb1crUmVuZEowcUNPdnh3Q0Q0alBZdmVRand0NmZMNmRo?=
 =?utf-8?B?MmQ0UFpKblBPRG8xQkRsSmRUdmo0azJFbmhnaldYVnkrb09ibGZ2dE91M29U?=
 =?utf-8?B?UXdUMWxRMzZQd0YxTTZsZ1poU1hBMGduclcyVFp4YWNaSnRvOWVBOXhpSWRt?=
 =?utf-8?B?Qm1RckdxOWhoRVo5anhjNmZKdUlPMURuSEliUXQrWlBSbk5ubjk2TUNkUW1R?=
 =?utf-8?B?UTRrdTFIYzBXR3dodWN4V3hJRy9RT2pYT2VoR21teGh3RXB2eTRka0RaL1Js?=
 =?utf-8?B?RnBoUDlZNnBFejNkcGJJYkNSb1Z2RFRUNFBqN1BkUkdlZU5UNktDek5OaFdD?=
 =?utf-8?B?RFk3T3ZtUnNPc2tEckpCY2dnSXFITkxQL1MxbytjMXRMYjVFQUxDWVRJZStx?=
 =?utf-8?B?cTd0ZzU4STFmRXN2ZmhpYzhsQU0zcURscURGY0FQZExzMzVRc0YybTZTQXRH?=
 =?utf-8?B?eXl2NlFaczFVRDVObFdZb1gxaWdma0VaZWNvbUxwUUlRVURlbGpNUFNOc1Y5?=
 =?utf-8?B?M0RLYjVLbU1WK2gxcGE1bGRGZDFCNjdLT1A0bElDbHQ4UTgzZjNvY0h1SU52?=
 =?utf-8?B?WERwYWd2ZmtOUjFvOEErK05zN0ZjUUV5c0hXMEpoemEzalVSY2hHOUt4OWhz?=
 =?utf-8?B?ZXovS0FaNlY1Yk5KeDdVblYvMFArWW8rR1RMd01iTENGNFpPcStOZ3Q5RUZ4?=
 =?utf-8?B?VEc2VlNKNjJYd1lJWHFLdmlKQm5mMU5DaG5LekxIUklCYjRXYWxiRHoveStv?=
 =?utf-8?B?OUp3RklXaSszNjV1WithVGpGUW8zdDZKdWVDVThVb0xSQ2dnK3IrdEM0NENq?=
 =?utf-8?B?elVmeUlkSUhJYmdoRTdpaVdJODFsMWV3dDZuRkhnMThFK0JZK0F3QVdiOVg4?=
 =?utf-8?B?MTV5SEpaai84cEFJT0xTRUQ4dlZEdkxjRU9wdHc5dXVlR1Q2WnVKaTJsM3I5?=
 =?utf-8?B?Q3ZKb3BIUk1BYWcvRHVYZ0pwMGlZNjB4MEZDb1NldDBDVFZWK2svUXhsam55?=
 =?utf-8?B?UndqQ2VsREczek5uMzljSkhuaVRMVFM3cUJRTTN1dmc1TThEWXJrRVRNNm9p?=
 =?utf-8?B?SFFjVWV5Vjd0S3ZIeE56RWhlTE5KWG9TTkZMWjF1ZjU2STBkT3hCYXM2RytK?=
 =?utf-8?B?NzZvVXU0NUhtMVlOU0g2WkhRM1NUcEtBT2VmaXdrRDFvT0VXcHhmMHBLVUNR?=
 =?utf-8?B?NERaTnZZNUNDVElpSXk2UStseTFBL3Q5Uzd1RXVjMVdPejdKQnFGakhCbGpa?=
 =?utf-8?B?ZVpNb0VNajVvRmRuY1JqZzlqSWt1VUpMZFBRVUl4RmNJSlRiNENaYS9QdXBX?=
 =?utf-8?B?WEpNbEhHWFVBOEdzTTNkbGVPRSszd0JVbS85cnJ0d2M0UTJhdXNvbEZJbk9u?=
 =?utf-8?Q?GYRfzLF5ol5phlHE=3D?=
X-Exchange-RoutingPolicyChecked: PhQNaBPIFbg2YLvMknvGFIZrqnhslz+WrCDKVaBdohaPh5K8dFHjjn1iUWH5TkgGxIs2RTPm5rDNlAYE1etIpwsaoetTm6dfLtKqgEnbCOWtgYdD7RN2W+U2qUCBHWK56keb4iQs59oLk1hxinlb+8dCgz4wigaINjTNeSRsvDfcIcP4l6IHr1JMp6mb0KhuUTXNKy1kVh7+Ixen9I/siGYG76KNxo21RLRk1AA9Ul5e4MJySP48QvLN5BpenktckCvickgf8FciNjVa1+nKK5r7H/I8b4j7Kqzxz0r8rcdKoya2W7pVPqHrZI7saMfyD1L11vQGT7Jzl4iisuizUA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ab1666-ec05-4875-c13e-08dee2009328
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 23:35:23.1253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BsGeldkU5zSh4uxy54clFmUYMFJnQxrjbLJus8/C7DsicavYLVO39pT22hk9EWUcXWhky6gFrH6Go3+wYAi5zNTc1q3XkHY4Q/vgpskV22c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9931
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



On 7/9/2026 7:39 AM, Badal Nilawar wrote:
> Enable late binding support for CRI

Patch 1 turns ocode fetching on for BMG, while this patch turns it back 
off. Not a blocker since the binary doesn't exist, but it might be 
cleaner to do the following:

Patch 1 - turn flag into a mask in preparation (only fan control is set)
Patch 2 - add ocode support
Patch 3 - set the mask for CRI

Also, I don't think we can merge this patch to enable the feature while 
we don't have the compatibility fetching in place, because the feature 
doesn't work as-is (this is independent from the potential rework 
mentioned above)

> Assisted-by: GitHub-Copilot:GPT-5.3
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       | 2 +-
>   drivers/gpu/drm/xe/xe_device_types.h | 4 ++--
>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 5 ++++-
>   drivers/gpu/drm/xe/xe_pci.c          | 9 +++++++--
>   drivers/gpu/drm/xe/xe_pci_types.h    | 3 ++-
>   5 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index ad7f3e61d457..d819315dff43 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -740,7 +740,7 @@ static void vf_update_device_info(struct xe_device *xe)
>   	xe->info.has_heci_cscfi = 0;
>   	xe->info.has_heci_gscfi = 0;
>   	xe->info.has_i2c = 0;
> -	xe->info.has_late_bind = 0;
> +	xe->info.late_bind_mask = 0;
>   	xe->info.skip_guc_pc = 1;
>   	xe->info.skip_pcode = 1;
>   	xe->info.has_drm_ras = false;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 022e08205897..b05abcb0c9d4 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -139,6 +139,8 @@ struct xe_device {
>   		u8 vm_max_level;
>   		/** @info.va_bits: Maximum bits of a virtual address */
>   		u8 va_bits;
> +		/** @info.late_bind_mask: Device has firmware late binding support */

The description now doesn't really match what the mask does. Maybe 
switch to something like "indicates which late binding firmwares are 
supported" ?

> +		u8 late_bind_mask;
>   
>   		/*
>   		 * Keep all flags below alphabetically sorted
> @@ -168,8 +170,6 @@ struct xe_device {
>   		u8 has_heci_gscfi:1;
>   		/** @info.has_i2c: Device has I2C controller */
>   		u8 has_i2c:1;
> -		/** @info.has_late_bind: Device has firmware late binding support */
> -		u8 has_late_bind:1;
>   		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
>   		u8 has_llc:1;
>   		/** @info.has_mbx_power_limits: Device has support to manage power limits using
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 1f627cdea24e..a7166f48bdb7 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -400,6 +400,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   
>   static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
>   {
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
>   	int ret;
>   	int fw_id;
>   
> @@ -408,6 +409,8 @@ static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
>   		return -ENOMEM;
>   
>   	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
> +		if (!(xe->info.late_bind_mask & BIT(fw_id)))
> +			continue;
>   		ret = __xe_late_bind_fw_init(late_bind, fw_id);
>   		if (ret)
>   			return ret;
> @@ -471,7 +474,7 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>   	struct xe_device *xe = late_bind_to_xe(late_bind);
>   	int err;
>   
> -	if (!xe->info.has_late_bind)
> +	if (!xe->info.late_bind_mask)
>   		return 0;
>   
>   	if (!IS_ENABLED(CONFIG_INTEL_MEI_LB) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 08c14a0202d9..78e1a0c4b15e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -395,6 +395,8 @@ static const struct xe_device_desc lnl_desc = {
>   	.vm_max_level = 4,
>   };
>   
> +#define LATE_BIND_MASK \
> +

This define is broken, but also unused. Leftover from an older rev?

>   static const u16 bmg_g21_ids[] = { INTEL_BMG_G21_IDS(NOP), 0 };
>   
>   static const struct xe_device_desc bmg_desc = {
> @@ -409,10 +411,10 @@ static const struct xe_device_desc bmg_desc = {
>   	.has_gsc_nvm = 1,
>   	.has_heci_cscfi = 1,
>   	.has_i2c = true,
> -	.has_late_bind = true,
>   	.has_pre_prod_wa = 1,
>   	.has_soc_remapper_telem = true,
>   	.has_sriov = true,
> +	.late_bind_mask = BIT(XE_LB_FW_FAN_CONTROL),
>   	.max_gt_per_tile = 2,
>   	MULTI_LRC_MASK,
>   	.needs_scratch = true,
> @@ -471,6 +473,8 @@ static const struct xe_device_desc cri_desc = {
>   	.has_soc_remapper_telem = true,
>   	.has_sriov = true,
>   	.has_sysctrl = true,
> +	.late_bind_mask = BIT(XE_LB_FW_FAN_CONTROL) |
> +			  BIT(XE_LB_FW_OCODE),
>   	.max_gt_per_tile = 2,
>   	MULTI_LRC_MASK,
>   	.require_force_probe = true,
> @@ -791,7 +795,6 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>   	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>   	xe->info.has_i2c = desc->has_i2c;
> -	xe->info.has_late_bind = desc->has_late_bind;
>   	xe->info.has_llc = desc->has_llc;
>   	xe->info.has_mert = desc->has_mert;
>   	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
> @@ -808,6 +811,8 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
>   	xe->info.multi_lrc_mask = desc->multi_lrc_mask;
>   
> +	xe->info.late_bind_mask = desc->late_bind_mask;

nit: I'd avoid leaving a blank line between multi_lrc_mask and 
late_bind_mask, since all the other 1-line assignments don't have spaces 
between them.

> +
>   	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>   				 xe_modparam.probe_display &&
>   				 desc->has_display;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 24d4a3d00517..a368e0dfb486 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -34,6 +34,8 @@ struct xe_device_desc {
>   	u8 va_bits;
>   	u8 vm_max_level;
>   	u8 vram_flags;
> +	u8 late_bind_mask;

This should be ordered alphabetically

> +

unneeded newline.

Daniele

>   
>   	u8 require_force_probe:1;
>   	u8 is_dgfx:1;
> @@ -47,7 +49,6 @@ struct xe_device_desc {
>   	u8 has_heci_gscfi:1;
>   	u8 has_heci_cscfi:1;
>   	u8 has_i2c:1;
> -	u8 has_late_bind:1;
>   	u8 has_llc:1;
>   	u8 has_mbx_power_limits:1;
>   	u8 has_mbx_thermal_info:1;

