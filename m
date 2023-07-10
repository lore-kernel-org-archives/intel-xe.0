Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B07EB64DA
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 04:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E4F10E0CF;
	Mon, 10 Jul 2023 04:14:12 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B5110E0CF
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 04:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688962451; x=1720498451;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HJv63lAmDnnfdmbP3s5HJbQbFimg36A0FoSOg2VGFIk=;
 b=Ix8dQhQTueke+mu9eVtEiDDIXJMay0bLt5p+v4GdyfUwjoPt3GgD+cDc
 rh4PeA4CkSYB7VoCiGD7aWWw4ThJxTCll7gI1QWTcCOg3ETCU9EIPftfA
 H3FzzQYy285vtk6W68TgKbpTxGJmtoI3Euu65yRkKvyD/ek1aBAwhlf50
 0G7AX/9RdXyFM0p5/+9K86JktWkQXmtnDcedpWHUVCu/5rP2uQhSjOGAj
 f7omqjPjplCUbfLZjh7SsRiVydlYxPxxLGY9h+fgoF3IHSWNHpG35egZ0
 jdkjfYcGK5yOQq/JjR9P8PwbzfTZS4TbTyUPwA/JGO7DLroajNu63ApUN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="349054453"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="349054453"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2023 21:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="786004512"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="786004512"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 09 Jul 2023 21:14:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 9 Jul 2023 21:14:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 9 Jul 2023 21:14:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 9 Jul 2023 21:14:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FI1gs0GM4B3ht4NlNQ7MhW7wA6bqU4c1Xt6jkylh+OiNwPPMHgXLfaGD4XvZQHRsq4YaCiQKX7rrD3pH3XpOc4zSCMqGTpGajH1i33FRUw6WbnLPIaOGAiubKXirzTNseFsA2Ydk/Q1rnaj77qSHz185GQXTsxQ9luKV3fEN4kYu+clz1RMUrJkHE2cjNOm1UGSoQjiwk47GXZ/mFObmWTt4XtCVhv/z1b1Zoq/hW7DZsfMslAL4ERji4TESlxgnfYlGgOeMOl8CLR77mrMaLHeAFuJO69IWQVh+FMyJ340QrXK7Mw85O09bdedl9jI4F3wywfAELYBPyOcP7/G4vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urDHFadLjTyCuG/i73KKTzdQDMr9hdGVaQKkR5QwQfI=;
 b=G2jEB0IZZIlQiqOhf4Xs/EQH33+8dcB3pOZhpjIJXx9Y5MG7Kgt8PogD/nMJfzSGPSlltJy8rMBE8nxFv9dXZSjNQbEzURcF1MVBVO8zPpcQ3/ppcUUKENpRg+3vnPqovUygVy2UlUj52WlVDg3/hCXJMcwupMqRcLyhWd71ua5I5eQp2IX9Nm5LFiXmgXQcl7KYn31qt8I9GU0+4nQfTvJMaPiZI7m0VvlCTaHw3ifrmuqpXDKgww5doNqx0bETUoS9Yn/492wmzg84zAGA5zhOOu19ukKS3qThvADCG58i2FQRMinR2uKCiR/WWK3rKZo6xg0+0YXsLg/umxQC3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by DS0PR11MB8162.namprd11.prod.outlook.com (2603:10b6:8:166::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 04:14:07 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 04:14:07 +0000
Message-ID: <d35680a0-b829-3a4d-897e-b581e86976e1@intel.com>
Date: Mon, 10 Jul 2023 09:43:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
 <87mt09daqu.wl-ashutosh.dixit@intel.com>
 <a6fbb435-6383-772c-703d-183f26a8144e@intel.com>
 <87a5w8cvmr.wl-ashutosh.dixit@intel.com>
 <04ae6811-9bc1-c66d-6cb8-640bfd8a9c7b@intel.com>
 <87y1jphqlm.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <87y1jphqlm.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::21) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|DS0PR11MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: 26f06b2b-6a8b-4124-0a09-08db80fc1a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hZWaT0Ew3cyB791EJPyPP2QIjfrXq+2k68lVvjdEFpcZPVP/D+DjA5nIr/knfSwyd0Sg3iZ8A+ihEUGOTonaNqFYz3fpkqJ5NPsY3Vf31dSvxDrU2UkRZwbNBo4EC3jgaAzJIlOGcb/a/pncDMYBqQ5cihZHKw94gMp6G1O90mbX8umKP/7+2X542/bQQC6AQHyucnsi2Z7IddEwBu5jkj7IAbqAkCsD/uMUmeyiUmSNRxzuTKnWLIx1Qpx24sCIoqXItR9+mKdvQu3EYstZW959PXFSOQ3cLyaBTJ8yj8QYzGT/nGac1a+zxVOQp2Fzj0UNCSn/HxPQ4iiV1azezZc9LX//ZOQozgbCMC0vF4c8xKt1+ZUsw8uAqoaoicr98rLVSgfVTNRufjTdVz/Jo70+/48v452Zuxmv9d77WjjBD1MNhNJYie2Jyaz/QKK92t++td8/fZmXxjoNZt/uaNVXKBuQtSPkIyZ/LHhxQ5GLv02Xzc5VLPPYvNhnEfUzpkbCcQ7T4P4ZimRuPfLXMPin+PYfD8lwzQClz2YrEKiE7PNlLiX4igDormxJQx+BBs9lPUZ6/bO0mX9767nxlS5voBis1o+MWKrBmYg82og426xwFAuQKJilIxrz9w+pATF2NOiQRuqmFw0+AY2YQpY8DvvbIlW2UcU9seVoLX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199021)(37006003)(54906003)(41300700001)(6512007)(6506007)(107886003)(53546011)(478600001)(26005)(186003)(966005)(6666004)(6486002)(86362001)(66946007)(66556008)(66476007)(31696002)(36756003)(316002)(6636002)(4326008)(82960400001)(38100700002)(8676002)(8936002)(6862004)(5660300002)(31686004)(2616005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R214b21MSW1ZR0k2dzZNYXZFbVpBWVVjTUEwUjUrU0VZWU84cmZ5M2lza0Vv?=
 =?utf-8?B?cXZGdDJQYVE1dHpTSElCT0dxTTErOVhaT3NhQ1R2MFFWZUNwdlJkNnFaZTRG?=
 =?utf-8?B?RXdMd3h0ZElxMG51UmhqRUJxdVdkYm5PbUEyUGhvakp0RGxGN3h0Y1Ardjdk?=
 =?utf-8?B?dVgwQVBiQmVjUHVRWmlDdFlFT0ZXWGdpVTdKYjN5aDFJa3FSYUFJVzBUTlBG?=
 =?utf-8?B?LzlnZE9PSkxkMWdtc2ZKV1FwckFqVTFEelBmd0VtdnA5UU1INUJzeXpuays3?=
 =?utf-8?B?OUJXb3pVeHRtZ1M5U3MraFlOWTFmM3JoV2tUZlI4VFh1bzE3UWw4eEFjWm0z?=
 =?utf-8?B?Q2RjV3dwNzQ1dml1Wko4Wm83RWVaV2VuREg4V003SXU1SHAzVFg5aXNaZ3Zy?=
 =?utf-8?B?L0JwTVdWTlY3bDZnVWU3S1lnbytna01pNXpaVUt1ZWw4Tk1Ra0l5d1RTVlAx?=
 =?utf-8?B?eXFudWMrWHVQbjJLMys3eTR1MWVOdERCa0ZpRTBscC9hMWF4aHAxazcwTXdu?=
 =?utf-8?B?Z2ZkQ0EyYmFTSllhQ0RjaFl1QWJuWGNnK3hXM3pYeUE2QlFsVFBMeU1KYlZs?=
 =?utf-8?B?NHhMN25sYktlOFZveEJPOWtoZTV0UXh5WThTTXRjaTdpRmNKa05yY0JLZVo2?=
 =?utf-8?B?eW56ZmxrWDBENGNKcXVnS1B5RzI5YitxWlg1Vzlsb2E2cFVndlR1WjBBSzZX?=
 =?utf-8?B?Vk1id3dSNGk3MjlsWnUzN0w3Q3dGRXFXcjJhMURXajc1eEtKbEQ0S2ZPeUFH?=
 =?utf-8?B?eTBWWTg5ZmUxT3JHVVRvNDR0ZEpJYmVCaURtaWVlWXpUdWdqSnFabThCc3My?=
 =?utf-8?B?dVUxV20zeHIrL2pDRE1FbXZHemZSVDR4MWFFS2cwZG13cGJwUDhqT3pQajVO?=
 =?utf-8?B?aUtNZHRMNlZZdExmM09Nak4zbTNaOWdJQU9aVk9VTzRoOFV6eldKOExpRC9U?=
 =?utf-8?B?M2JueTVPdEtmL0FmWWZBZm1Sak9XMDRXbUVLRHNIcGF5VzdGZTlIYytaMERW?=
 =?utf-8?B?VTJZdG51cTc4V050eTk2VTV2WlRWWTlIdW1uZ3FLMWlsU3U2NWxHRG5TYnpk?=
 =?utf-8?B?dWtlbXZOb3BMRjN0WTJ3T1YvTlIvSHdSWHFwaWI3OWloQjZrWkJxYkgxM3FZ?=
 =?utf-8?B?S2NLVks2a25XZWF1VnZEYVJ3T3plZlRMV1dlQjJVQnhUNHZTMlUwZDZ4V0hs?=
 =?utf-8?B?dHUvU1ZkV2hWeHpBalhCOW5aKzFmcG12ZVg1b1ZSZkIxV2xGa2RYQ1ZGbWRm?=
 =?utf-8?B?eXgyN3dNUmdvbEltSGZiWGlhQ1VZMkFMQVhLQjhYZ2FpOWdYUjgvK1MybEFD?=
 =?utf-8?B?bkpJTmxDa24rR09TMVVSbGdNUmxJbjRtWTlRSCt1WHF0UDNSa1VHb3cxSytz?=
 =?utf-8?B?WGNuU0V3cmtxRnN4OUFsMnhsQUJIQjhoc24xUHg5Ni9xYUtVQTR2MkRCQmdq?=
 =?utf-8?B?RG9jTHowSkNvQll5bm1jam13elg0SGx3T25ZUzROeGVNU3FQRW1xZ3g3YjNr?=
 =?utf-8?B?RUMzZkFKd05xeW5QNkNkSmM0N2FpQU0yTHVwVXZWbVVoZVR3ZmpYQ1IxUkd0?=
 =?utf-8?B?cXFQSWUvWFUyN3FiMTYzdFZrUEt4WHZ1dFladlJjMUVBbzRXckdRcHBPcSt3?=
 =?utf-8?B?SFFVWWRGQXZsZGZDYjRhYkhxUzJyNlV5dHl5OURTalN3RWFtK1JrRGNOcUlz?=
 =?utf-8?B?TW9pV0Nvc092bDNZcXk5NXViK2xhRkYxeXJVQnlQOE5GQlprblpCRVpHSytL?=
 =?utf-8?B?N2wrM25rVWtlcGhRenVuRFRNU1dsZzdEOTY2a2NHaExTY3Zkc0RJOXRJVmdO?=
 =?utf-8?B?cDdGZ25rSHZWU0lURGpXaGx5b3FJTkc2VmtMVlIvMEU2SkVBU0hVanZuQndP?=
 =?utf-8?B?WUpYUjd3ZXVka0FNRmF3Q2F6aGZRR0U5L1h6VStVQ1FmRWlTV1k3eXZteUtE?=
 =?utf-8?B?RWg0MWlqWXZTRDBwWUQ1MkF0RDVPZnFTTERHSEQ0QisvZExabDZsRGNNYjNY?=
 =?utf-8?B?b29jeHFiMXJ0UTk2VUZpY280UWdzUFB0eThMMk5aZ1FmSnBSc2dhVm02LzdZ?=
 =?utf-8?B?MWUvU3gwYnA5YnZnYlVmQ2tnY3Z6YWhKTWJhY0EzQVI2R0MrN3dTODhrLzR6?=
 =?utf-8?B?ZWRpMURtYXFBRHZIOVNnMFhhYzBsUXNQb1BsRDVqR1dwVUtVMXlvZ1FuQW9O?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f06b2b-6a8b-4124-0a09-08db80fc1a6b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 04:14:07.0480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rk653EroGuAgswBc5vhkLtivfFXdZCX0mQ9E0ZU35VFS1MpJHBBD98wgF2sz+U07KxRCIlElQXxV+UZpFSJQlvftYh6gjwbdK1Wel1jvxzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8162
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 09-07-2023 06:02, Dixit, Ashutosh wrote:
> On Thu, 06 Jul 2023 20:53:47 -0700, Iddamsetty, Aravind wrote:
>> On 07-07-2023 07:48, Dixit, Ashutosh wrote:
>>> On Thu, 06 Jul 2023 06:42:29 -0700, Iddamsetty, Aravind wrote:
>>> Also, could you please explain where the requirement to expose these OAG
>>> group busy/free registers via the PMU is coming from? Since these are OA
>>> registers presumably they can be collected using the OA subsystem.
>>
>> L0 sysman needs this
>> https://spec.oneapi.io/level-zero/latest/sysman/api.html#zes-engine-properties-t
>> and xpumanager uses this
>> https://github.com/intel/xpumanager/blob/master/core/src/device/gpu/gpu_device.cpp
> 
> Also there is the above mentioned open regarding this: "Since these are OA
> registers presumably they can be collected using the OA subsystem". L0 now
> seems to be supporting OA and we are going to provide an OA subsystem for
> xe. This probably also needs arch input.

While I try to check on this, by any chance do you know why we have to
go with custom OA subsystem implementation and cannot use PMU for
reporting OA.

Thanks,
Aravind.
