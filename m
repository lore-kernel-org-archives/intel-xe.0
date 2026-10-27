Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A225A606A31D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 23:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d3DVdSnW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672AE10F881;
	Tue, 27 Oct 2026 23:10:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3821110F87E
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 23:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793142626; x=1824678626;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VmpldOX4LxHUVbIZ6rejIWYkJ5BThaJM63ouWjtWkPE=;
 b=d3DVdSnWkVL3bmzFHB0Gwf9o31mwuVMcWV75pYs4TZqjZ0HiHNQS9jXA
 GrNdBI9t6vXMdU/uqskCHG4TgnKO6I3IkcPjWKVyOObC50wZpMbnWpcGE
 YtKesF7Nf1bFdekrjBwDAfQ9NDeW89W43JlSfdFIhcEaAfQ2k3/Qa03Sz
 lsW3Z0YUQcDTxfzwZ/vJysBfvGgB5SpYWAPzRyzmKc+UZHf0/pR9QlxEI
 Kqs29WSfSevgx9qsIkAek4OZTOaoIw5TT5Bkbh2tJJv/hRLhg0NBX6lFq
 vBqmNzWXEBAVuwfLQV9I9qQPKX+DDMsuonDwizNpHxIAn7eOWvH3vcUes Q==;
X-CSE-ConnectionGUID: mM1KVbmCTje/goXRhWaYZw==
X-CSE-MsgGUID: euVxMRqCT+WX5X8SlT86ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1879696"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1879696"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 16:10:26 -0700
X-CSE-ConnectionGUID: d/fLeXvdTJyT/Z45qq3ZGg==
X-CSE-MsgGUID: tgnWm32sT6qWofWYbhoEGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5068617"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 16:10:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 16:10:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 16:10:25 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 16:10:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdpPzP30OF0m0xSdzsmd75dKUaWH9tfvso8vn4QEFZrhCuZ56necPksDDR9UDo/gdxCjqBq1UEd3YuKSmTKQXxHi99ncpFHj5WyMyuYjWiCstGZI0ZAW5p4weHE9YUr/uCD8fvkWDMG1BnrFZ+gsSS7+D5tb4idNHov3R+Rpd8NgLmxUnsbsBCZ7FwYFlHdD6DYSbZi6/9J1OyXzJ4AQwrI+jnVHx16kqdAcG5a+1DeeO/X95KXcoBcMpnhF6U41JhtOc539R3vX1CZerOKMRhlc3AcMQvRzKBqiQZkQzZ2qORCNx8YrXaMEwVBxaNhGQT/RaYQSs8D6JvcAiDEbUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tr9V7ZmzHH7KW/QfY14JWS/HxDchg2m8FCO7facGhP8=;
 b=p6rFJSSfqcuyj47g+yVFRonBevt5/7M7EpYcHv5UP6pd+mgTOMJVs+CnWZP2NQ4y48cFmF82R/28HQ8fwqghc3xHpcTsHjXQOnui+bWz2pfM46LVnmWp3DOC5E2UOWU9/1iONcOY5Dft7pYm+MJ7iCxEDdQ487v19l90dY5ecd+4YSt5RKyQwWIrX8QMqVF9FjDPz6/UBgY+Pex8hkssl4EnRpb08ehd3aluS4OuNINM4kMsJVcFKyl6WALR39Dnul2k+mt0xLC+p2drZJPwoxVN6Otk2KzRLcgq37D+mUt2GF1PbGi2xCvFrfKi1DIgLoe207FvN+6PniU/suEPzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Tue, 27 Oct
 2026 23:10:23 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 23:10:23 +0000
Message-ID: <f3995846-ece9-4131-a3c9-fd80b810aac6@intel.com>
Date: Tue, 27 Oct 2026 16:10:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Handle GuC semaphore instruction field
 check error
To: Jesus Narvaez <jesus.narvaez@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20261026182513.1329781-2-jesus.narvaez@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20261026182513.1329781-2-jesus.narvaez@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::10) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: b688caf9-1e29-4881-d230-08df347f7a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|261022105027099003|261026121527099003|261009223027099003|261022075727099003|56012099006|11063799006|261009221227099003|261021121427099003|10067099003|6133799003|22082099003|18002099003|261026140227099003|3023799007|261022113327099003;
X-Microsoft-Antispam-Message-Info: RaPlcRiULujUc2toXlU6kHi958obbBci0o8BnKxjMbnaAvwsJlJZLfmRXRd7mo9NaVhvM77OSb2IoVu9FdWFp68ge0DvcPZcJdZhTxQOeuI4gDdlsQ8u1fXkF6c3F13FM4xxlBn9pSuc1IQEiWGFleRRgPy6FVPHqc3WB0vYfgfBKrVWVjkmFnvVgfrdJccLgJOIcZ06eCL3XACvt4Q0JK2J/SuKUe4D979em2LGFeCtWmHzupa4H1WQ17V+9ZsAGb8l7NSYXNHuHAL8FBDy+f/03igun1TQiBPuDsSOqris3o7y9/vt3B9+UTCyAiKdeIS0mMesfEoD3jId5zI2LYu+zI+v4zabdg2jNQ/tW2weaY7xJw7cpUZ6YjoknCQ8b0MERyy/wx0CK4dxSrLrU4kBSxJBbNqjduKAr/WyrywO1/4+9OhliR3iqQaHnzDBCfkIE41/0tC3LgH64xuOg59BcSEMCoBVgN1rbjL0dWB3ZBlYFyw0axwVHQpz/2eaprZBptEgG9uP/57LxQrZ9cYgyUueVnTHHbYPLlkZQ2RH9gFodtOqZNi+3ea2xI66NkDsxDdy6T8r35+mBZ8vEn3wlv4zivmNFnqMbSOqxY9fhptYiGFKr1h8SOynPHPPLdBWIB3Z+3VkLnMgoiJ97J9aPKINiUcbvDqK3sxWgmI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261022105027099003)(261026121527099003)(261009223027099003)(261022075727099003)(56012099006)(11063799006)(261009221227099003)(261021121427099003)(10067099003)(6133799003)(22082099003)(18002099003)(261026140227099003)(3023799007)(261022113327099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1E2T3h4Mkl3cG0rNDFZcXZJR1JxMy83Z1VFTXlFd2U4QkRLM1RuNGt5b0M2?=
 =?utf-8?B?L3V5eDM3alpHUEdXVWhBbExIaGFpL3NOa2tUQ3pjdjhCbzhhVVVuMkVCV3VZ?=
 =?utf-8?B?V0FaUHhwc1FGdUlBWXF1Q0F6c0tZb0NNZ0lvYXk1KzFaa0ZMK0NYMkJWeGpy?=
 =?utf-8?B?R0Z5cjQ4RHRlR3BwTFFKZS9PZE1oOFZyRyt0U0h5dEl4b1VTR0x0OE1GVndI?=
 =?utf-8?B?RXluaVpxeUk5MUdVMGhWaVBMVFlRcVFYZkMvK282aW1JOWk5bGw5WnlMOTkx?=
 =?utf-8?B?MWdqS3lzY25jVWM3c0hjdlltbVlxbnVEUFhGWlI1dDBiSUZiZTVOZGpQYklL?=
 =?utf-8?B?Zk5LZE9KVmNJZnRqNSt4L2p5NUNZWkwrY1V0Sm1PNGh1a3R0NnRydHlCNjZ0?=
 =?utf-8?B?aWp5UjF1UWUvSkxaMUh4WGE2ZFFkYnkzRTlIMWVaTXlpTklHNHV3eFdZcVd4?=
 =?utf-8?B?RWZ4VXZJWDRSRjcrR1NEMUJCMFNsOUczWmFLMHRiUWU1cFlXRktIMFFmNFl3?=
 =?utf-8?B?eUdVYTVoZlh6ckZRb3JZdmFqbzlDRmhrSFdUdWxiZU9SYlBsOVVsUkxsWm5I?=
 =?utf-8?B?SzFtZHlFRmRBZTZxcmZQLzgxcjRqa3UwT3c5VHRMOVRqMkRtYm1UOHJkWVRD?=
 =?utf-8?B?SGdUMk5SczhXTmRsd0h0dHJlWWk5cVN0Q3MybzA5VkROM3YvVytKWldpVjNk?=
 =?utf-8?B?WmRjYUR5SGRHcytOSVp2S28zTE5GUUVwRFRISFNTaStpK1hZelAweFA1MWE5?=
 =?utf-8?B?SzdQN1NqdE0yV281WHczZmd4NFZQZ3dTSGx0QXo0dEpOenB5ZmdhMDlVS0VK?=
 =?utf-8?B?WDJodE9nOU1qNUNUa2RGTG1MQURhMTdIOG5tUDc1NkpqRTlmZTk2dFVLRnlN?=
 =?utf-8?B?eTFWWFJPRGYxdDFNRnkzMzVyOEJEakJodzM2K0N1TWhyNTRIUVBvaEJNeElE?=
 =?utf-8?B?bFBNK1dEMzlxL2dEaVpZNkxHbkJFRGhiZzJIOS96bVgrWXFoL2FtV2ZNdjlF?=
 =?utf-8?B?eVdPRm9kM1dqb0hlTVhIbndkVjNwcDJIcFp2MmFEbngyK2NnSFYxYm84b1VC?=
 =?utf-8?B?Q2FDL1RNSHEyUUxyck5pakF0UFJLMUNHOEZhNktPTFI5ME9DemVDelJPK0xX?=
 =?utf-8?B?MThjc3BsQ3ZUL091elphYm8yUzFiYitEbFZnMHNBZUw2MklXMzBQN1p6NHBV?=
 =?utf-8?B?Y05qZWpFb3BSVUFWZHZmOG9yWW83RVNQVmdYZ296VDk2R0FBWlFzZ3B1elhN?=
 =?utf-8?B?eFhTSW83YTdTWDZ4V1M4RXNHdmZWZ0lDaHZJQmwxbGFtU3ZqRy9WOXNWWHhD?=
 =?utf-8?B?QmU2QkE5ZU41U3pVbUNiS2c3anYvdk5FMm5CaWdTWmtwRjJzUWQyT3V6VlU0?=
 =?utf-8?B?WWdPTkpNNmMrSVBIMXZrMlFma251M2l5NWRQZ0xaSmk5WXM2Z2RUREdkVDFr?=
 =?utf-8?B?TGkyM1M2Q2JVdDdMZTVWL2tlMkZLQkw3Y3RRWWtKOElsN05DNFMwTFd2eGxo?=
 =?utf-8?B?YUpwa3FDeGVaaklybytPT1czYk84M3JyMWd0YUxBeCsrb2tOb0pnYWF1MWVn?=
 =?utf-8?B?YmhPdTRLbUxNTEhiUzZGUWJuNEtlYjBpNEhIL2tPNnRRclBuUXZpU0VReHBO?=
 =?utf-8?B?VGtpRm9wV3lTdWRyUUhZaWN6YlV2bWxuVEwzQVU4Y3pDT0xDYmxjRVRrVEQ5?=
 =?utf-8?B?TThLemkyd1JVMThOS2pyUTBINlB6UnlHYnRVV2lRSUVnYWt3SUQzTU53VEhL?=
 =?utf-8?B?TXZucUpsU3I1MTBhT1lwMDBmT2xoaXNiaS9BWkxqZU9qN1IvbXpqSWJZZGJj?=
 =?utf-8?B?U0dsejVYWVRwcFBzSUU4U3kxVnBoUDRrZzU5RXRNdUR2WUwvb3NYUWdaYUNI?=
 =?utf-8?B?U0RzRU1LUkRzam9Ia1NleE1YTzFFVzdJMjB3NUZpakY5MmpvYk9UNnJhRlZZ?=
 =?utf-8?B?NmN0ZmJWUW9pOFZUcitZT3EySUYxT2d2QkM0ZmJoOVRadS9YYWJTcUNqUTJU?=
 =?utf-8?B?QS9MM054UDhTZmZ0bDFMTE56M0VQOTJ5M3hWU1VxajYwZjg1eS95LytkNXV3?=
 =?utf-8?B?SGxXVUpsRGduK1B5NGQ2MDNKQTYzbzEvaUFZTUx1aEJJS1QzOUdnZlNqc3FN?=
 =?utf-8?B?MTBYVnZVWlhXM1hxRWZ2QlhKcTVhNisvakNjNWhHK1ZEV0dRdENwQXVkUTY1?=
 =?utf-8?B?SXd2Tk9ERC9PaUIvY3BmejVxYS9OQjA0RVV4MXYzTlZKQmZ3bC9Hd3dmcU5H?=
 =?utf-8?B?OEF1WXJKZE1BblVBcnJnTHorUm0yVHRUSnZwekVxU2srMjBDdVBveUdQaHZk?=
 =?utf-8?B?NDBpQUpPTnp0WHk1QUF2N1gyT1JkRFBwRGY3T0MvWWUzdlpic0RnWHRRVndP?=
 =?utf-8?Q?VJWoQP73Eubpzaeg=3D?=
X-Exchange-RoutingPolicyChecked: QHtRh9usMwi3jZxATCFj2EGavtG6aFODXFTEN1gRmS8hct9H3NRibr3NbqapHdqg0X3fZOsZsl3rouH5G/F78vm7EOJhsH7Pw5mUNxsMoHV5vKYtVfSUdjIkOkDJjx1p2K7TVdpCxZv3y1iVrHwtetXFBkDnogFQ6euX9fsj/odO4AZDGbcHJWNptS4VCk+IA1t0F558aDzgFb6LdrJTotOW2dQOeBUQFDvFS9T3Pb8XeZ3S/wxOulT8iMrZcy6n/3tPrb8G71Q8mWtqJKOn7mt2c8TR2jYBw3imj0eVe/1iY6MA7l3HyR71FL1uPJXPHbQZOPmLd78+mdQjMn1s8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: b688caf9-1e29-4881-d230-08df347f7a71
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 23:10:23.0887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYAajJ3pZqb0iZIRPf9ZxNUIjfBDLixroVHTvPBAHmMAmPd+vr0QZHc4zRzRvVAjf4SeoRPvkd0UF8Tmet6GDfO7wEXwXRSsZ9Orqs/sjA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/26/2026 11:25 AM, Jesus Narvaez wrote:
> Starting on NVL-P and newer platforms which support 64 bit semaphores,
> opt in to enable GuC to check the semaphore instruction field when it
> receives it from HW.
>
> The 64 bit semaphore instruction includes a field that is passed through
> the CSB to the GuC. The GuC then checks for any invalid values in this
> field and sends a G2H message back if the check failed, so add a
> handler to deal with the context that has been marked as unrunnable.
>
> Rejecting the unsupported values now means later on, if the values are
> used for something else like sending hints about semaphore behavior,
> there won't be any conflicts due to the change in behavior.
>
> v2:
> - Updated commit message to explain why GuC checks the instruction field
>    (Daniele)
> - Use "instruction field" in comments, but kept KLV name to match GuC
>    specs (Daniele)
> - Removed LRCA variable and print out in handler (Daniele)
>
> Signed-off-by: Jesus Narvaez <jesus.narvaez@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h    |  9 +++++
>   drivers/gpu/drm/xe/xe_guc.c              | 10 ++++++
>   drivers/gpu/drm/xe/xe_guc_ct.c           |  4 +++
>   drivers/gpu/drm/xe/xe_guc_submit.c       | 46 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.h       |  2 ++
>   drivers/gpu/drm/xe/xe_trace.h            |  5 +++
>   7 files changed, 77 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index f5c9b37038d4..520b771906cd 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -143,6 +143,7 @@ enum xe_guc_action {
>   	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
>   	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
>   	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CGP_CONTEXT_ERROR = 0x4605,
> +	XE_GUC_ACTION_NOTIFY_CONTEXT_INVALID_SEMAPHORE_INSTRUCTION_FIELD = 0x460B,
>   	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>   	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>   	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 4bcdc1a96785..dd34d61ebf3a 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -169,6 +169,12 @@ enum  {
>    *      This flag will enable notification from GuC to KMD via G2H message
>    *      GUC_ACTION_GUC2HOST_NOTIFY_UNCORRECTABLE_LOCAL_ERROR upon receiving the
>    *      same interrupt from the CS.
> + *
> + * _`GUC_KLV_OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK` : 0x400A
> + *      This flag will enable the GuC to check the semaphore instruction field

IMO this is still not clear in regards to what we're checking. Maybe say 
something like "... GuC to check for unsupported values in the semaphore 
instruction token info metadata field when GuC receives it from the HW 
via the CSB". The commit message could also use a bit more refining. 
With that:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> + *      when GuC receives it from HW. If the check fails the GuC removes the
> + *      context, marks it as not runnable and notifies the driver via G2H
> + *      message GUC_ACTION_GUC2HOST_CONTEXT_INVALID_SEMAPHORE_INSTRUCTION_FIELD.
>    */
>   
>   #define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
> @@ -180,6 +186,9 @@ enum  {
>   #define GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_KEY 0x4004
>   #define GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_LEN 0u
>   
> +#define GUC_KLV_OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK_KEY 0x400A
> +#define GUC_KLV_OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK_LEN 0u
> +
>   /**
>    * DOC: GuC Scheduling Policies KLVs
>    *
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index b1f4e132fa0c..c96c02fc924a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -663,6 +663,16 @@ int xe_guc_opt_in_features_enable(struct xe_guc *guc)
>   	if (supports_dynamic_ics(guc))
>   		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH);
>   
> +	/*
> +	 * 64 bit semaphore instruction field check support was added in GuC
> +	 * v70.64.0, which maps to compatibility version v1.33.0.
> +	 * Support starts with platforms that have 64 bit semaphores, which
> +	 * is NVL-P and newer.
> +	 */
> +	if ((GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 33, 0)) &&
> +	    xe->info.platform >= XE_NOVALAKE_P)
> +		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK);
> +
>   	if (count) {
>   		xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index d42f0133c1eb..27afe95c4ce7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1909,6 +1909,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   		ret = xe_guc_exec_queue_cgp_context_error_handler(guc, payload,
>   								  adj_len);
>   		break;
> +	case XE_GUC_ACTION_NOTIFY_CONTEXT_INVALID_SEMAPHORE_INSTRUCTION_FIELD:
> +		ret = xe_guc_context_invalid_semaphore_instruction_field_handler(guc, payload,
> +										 adj_len);
> +		break;
>   	default:
>   		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 7e2ce1a79a75..179ad7287ffd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3723,6 +3723,52 @@ int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 le
>   	return 0;
>   }
>   
> +/**
> + * xe_guc_context_invalid_semaphore_instruction_field_handler - Invalid semaphore field handler
> + * @guc: guc
> + * @msg: message indicating which context failed the field check
> + * @len: length of message
> + *
> + * The GuC has detected an unsupported SW Token Info value in a 64 bit semaphore
> + * instruction and has already removed the offending context and marked it as
> + * not runnable, so trigger reset-cleanup on the queue to match the state GuC
> + * already applied.
> + *
> + * Return: 0 on success, -EPROTO for malformed messages.
> + */
> +int xe_guc_context_invalid_semaphore_instruction_field_handler(struct xe_guc *guc,
> +							       u32 *msg, u32 len)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_exec_queue *q;
> +	u32 guc_id, type;
> +	u64 token, data;
> +
> +	if (unlikely(len != 8))
> +		return -EPROTO;
> +
> +	guc_id = msg[0];
> +
> +	token = (u64)msg[4] << 32 | msg[3];
> +	type  = msg[5];
> +	data  = (u64)msg[7] << 32 | msg[6];
> +
> +	q = g2h_exec_queue_lookup(guc, guc_id);
> +	if (unlikely(!q))
> +		return -EPROTO;
> +
> +	xe_gt_info(gt,
> +		   "GuC: invalid semaphore instruction field! guc_id=%d, type=%u, token=0x%llx, data=0x%llx",
> +		   guc_id, type, token, data);
> +
> +	trace_xe_guc_invalid_semaphore_instruction_field(q);
> +
> +	/* Treat the same as engine reset */
> +	xe_guc_exec_queue_reset_trigger_cleanup(q);
> +
> +	return 0;
> +}
> +
>   static void
>   guc_exec_queue_wq_snapshot_capture(struct xe_exec_queue *q,
>   				   struct xe_guc_submit_exec_queue_snapshot *snapshot)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 7a81d0aa19bb..3eef8784a1a5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -41,6 +41,8 @@ int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
>   int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>   int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
>   						u32 len);
> +int xe_guc_context_invalid_semaphore_instruction_field_handler(struct xe_guc *guc,
> +							       u32 *msg, u32 len);
>   
>   struct xe_guc_submit_exec_queue_snapshot *
>   xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index d4e9d91f6f7f..e52054eccc8d 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -223,6 +223,11 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_cgp_context_error,
>   	     TP_ARGS(q)
>   );
>   
> +DEFINE_EVENT(xe_exec_queue, xe_guc_invalid_semaphore_instruction_field,
> +	     TP_PROTO(struct xe_exec_queue *q),
> +	     TP_ARGS(q)
> +);
> +
>   DEFINE_EVENT(xe_exec_queue, xe_exec_queue_stop,
>   	     TP_PROTO(struct xe_exec_queue *q),
>   	     TP_ARGS(q)
