Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04267C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 16:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F9F10EA35;
	Fri, 15 Dec 2023 16:43:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF3F10EA35
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702658635; x=1734194635;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HE2KJYGLZpPVjHlPhIRw9typt5yZDLlRKNe791O3CRE=;
 b=ZkTAONVtnXYmL1pYNyqptforOsaZF/s6MA48p88muf2gu433jOPmQCet
 B4qvos2V3k6gUekNu/I7iDKZNVU8qavPXe73CIEcpFwR4xKA5rL85gfDN
 5X31LexfsA6ojWbv5t+Gj/EkShpQ8+u03NsFQ/CsVYS7IG+jTVr5DJutY
 mXq9v3GcovLTXRtfbFVAzhQFKKdcvpwi710JTQddJmhMiPoEm9QDISKNx
 X6x6fohE0HNlhgXfLNTvYlJ6knl6j8e50CkFDQ782nre0cPSD93fbkbYb
 xphrsm9KrEciegexXwNALQSbm8shUUIpTX3xebesca5cLDOT07bXGFf4y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="380295213"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="380295213"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:43:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="803767249"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="803767249"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 08:43:55 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 08:43:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 08:43:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 08:43:54 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 08:43:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TV8j2t7vLxZvrZJuU96VnScOzUCHe9kkoFIloJKiLiHy7ZwTcMo3Ep4nqN0T1FvyZU5W7A2Xjx9dWj5GzwfGCMd2foj7wvvhX1m7VWpmkkkHd8jk/eGNTLP8/yFE58aQqsklKFYgxqL6+O+JGO6uLB4W2dw4Z/V+gqXjTrbGtOs2Wn8faZqfZutUcee2Z2nRd1bwnpBh2lNiDe3Oq5FoEbRa8KLzERhMV1WDlSC5uEyNqs7f2S1vhLW5zPeORwpvx1GboiSI8eo7D1c9mSmaR25TlQUhr3Yqt9fvNArLVheMMS63La2j/h+QZstncV+TfFFwN0pLiFjwEPQJ0QAiMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IE0JiA/e+pKwawommu3YMx/3wkhT8wU3Nrjn1RTXw+I=;
 b=dWCYYGf1K6R50wfWHtpfwkdDaM4dBbcC6HgHjjHsxslwLyMJYLMFuG3zpLZP33kazQJNtAJ6UP7EBxqL4KfFKDuaSRGZiIv5+wcFKo/T1HjNE+3yUhcC5ABlEaLAUTks24Nxiy7K/HnBw59pSm3K+hjIEXJsU5Ee7OTfVcnBeoekH5sk70FhrJBwv3TAVkFEJiVBsupqZvY4lOSeBMFGQMRE16XqDWE7lMaLJnjjBESuWEYBFOxYALcaErQeRGAEulUQf+7khFPGvDIkeQIAvivaErYtZ5F7SvNwA9CfMvoKt3gQj09BrUw2EyybI3tW6OFzDb0dDoRW8DmvNoKPOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4554.namprd11.prod.outlook.com (2603:10b6:303:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 16:43:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 16:43:51 +0000
Date: Fri, 15 Dec 2023 10:43:49 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Enable W=1 warnings by default
Message-ID: <jephtblnou24dy7fqbo665rxxudzrc2myabzit3ixarezlsa6x@7xjeytyal6cv>
References: <20231214213954.3223263-1-lucas.demarchi@intel.com>
 <20231214213954.3223263-3-lucas.demarchi@intel.com>
 <ZXuiTCekgfRNBlKO@intel.com> <ZXxjhJvm6QQSOGEo@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZXxjhJvm6QQSOGEo@intel.com>
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4554:EE_
X-MS-Office365-Filtering-Correlation-Id: cdd18d81-1eba-4b1c-8635-08dbfd8d04c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 45lRG1am7I3WSs6vCUZGzN2ckGpzrKk1G0cAONuivNHy3gG+wST8snqwfEvQcCFCy/1ewIJTj0/0sljrwiKWSsJIolQkqVn85ND+qpRCkZOzO3IgGxjLPeVHcXWwLea/lXcyYdiMKHTHwOOCKE7D8unKBI6N3hNGiFNMyU7fWqM+tBMRLJam5RxDgqQMuFiRXMxz3bVaAfi/UJAx+v5JbF+UTVqf/qiBf9s+dh7AIafNxmqz2OSR8iu5kW1/geXxC6zX5C15yLmoKatv4ZUipTydy06WGIvxz7rJ1Iavto5q5faMTPYN1NtgDE5icvSRVijUd2lz8Aec4MuPVvTFu3vp8uhoYj3kRs49zd+Q5TWSk22/2SUrnzj9w3E6lOcqPNi8dFqpjPSUIxUqLWLsvm7asclOcePWgvU6c8W9KiDBTsPgjpdGLj9ohItgE9DOh0CE7tLc7n6IbafSJemqmJpBS9hWehVv1mJ51Wf5A1wSffZoxF2BbhGIUoVz3XCRtRkGNoqXNr+juINeOnhHmrhFsWTI7jztoHeJJNwIr4kf6DBTbcXnSoPr4EbFi3LK9HYDTPbSuKIYwHhqEubXGGmM4hFi6CD2Fd1GY+j9tIrbGLiO16iD8Ws9T//h3hMq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(396003)(366004)(136003)(346002)(230922051799003)(230273577357003)(230173577357003)(1800799012)(186009)(64100799003)(451199024)(82960400001)(66476007)(66556008)(6636002)(54906003)(41300700001)(8676002)(83380400001)(2906002)(8936002)(4326008)(38100700002)(5660300002)(66946007)(316002)(6862004)(33716001)(4744005)(86362001)(6486002)(478600001)(6506007)(6512007)(9686003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RC85dm14NVFZWkNMUHF5amtxMzYyZktMYWlFYlJuOGNtTmU2ckZBRlI2OEY0?=
 =?utf-8?B?VHV3bmhxMG5URmt6VVgxUXlBTk1tV3dFU1g3cnpCaGZtbjNmVVdaZjdvOXBz?=
 =?utf-8?B?NEI3T1U5MElxalY2OHNaMm1rZGhyWk1yWWFEV29ySndrd294N2JpK0JIb3NB?=
 =?utf-8?B?ZExnd0xPRmczZjZteUVYNFZJUGx1aitNL1pxM2FOUlMwODAxdGphRE1GWmlV?=
 =?utf-8?B?RGxCc3kwOFZtZFRWcXNkVi9KemlxQVJIWkYxdGN6VW5WbFpEelRSSWRFM2E3?=
 =?utf-8?B?S2F3VVdxbzlXRFpDRTA5UDdmK0MzL0RIbUxsM0xhaGlFRGx5amUxVXlsWWxq?=
 =?utf-8?B?ZEtWdGVteDNiZi9qaEgvcVlvYk5NUTMvd3dudzI2Y2FoTnVCT2Z5bFRqOU1B?=
 =?utf-8?B?K3MycHBlWDR6cy9wT2x2NURQZ3JSbENLbGlGTzBmMGt4bWVaV2Q3MU5WRXRr?=
 =?utf-8?B?Zk1JK1BxQWJqRmtpdlppVzZiSFV5eXBuZFErc3pjR0h5ZjRyTG45bkptYVph?=
 =?utf-8?B?U2lsS1RnSktQbm9uUW4xT3lVRWlLL2piblgrQzFoSmxGMDJYYVFmWjFHYXl0?=
 =?utf-8?B?dEIxbHBqNVNtazZrdDg3SkRJQTlsQzBIbE5iNXFpaEQvamt5YUhya2NDR3hR?=
 =?utf-8?B?bUttckpzNFRMaExpb0lFTVBRcXBwOEU2eWxRd2xWalY5eWZCRkdUSzJtUkdD?=
 =?utf-8?B?WnFXei9OSHJJWGVqR3VyK3YvTnVzOXlOSHY5VEo3eFk2emJONUNmUWxaNm1m?=
 =?utf-8?B?aXhJZXFiVkd0N05hVmJXMVRsa3k4bFNMZkk5ejdEcGthbEYzSXRoWE15ZmZP?=
 =?utf-8?B?VDk0RXVibm1DLzJmTzFEaTZUNENmMjYrdVh6MUFFaTJodHkxOXcvMS9tMms4?=
 =?utf-8?B?cUIxVkx1YmZkcytLbEVtSmFucU4xU1ZiZmJJNThiTXFBS202bEJac1pjaU1o?=
 =?utf-8?B?eTNtMXNEcStpZlRNT3ZrUlRYVWlzU2xRVW9Sa2ZrUFZUVDJKblZ0MFZ0M1NC?=
 =?utf-8?B?L3l1emg4V1JtRDBCMjNad0VWSEQwejYrUitaNUptWnNsZE5NYzRidkNzRUZo?=
 =?utf-8?B?QThCL1p5dXZCWklLWlN0L2JTVmNQZFpvUDlxNy9DS0M5ZFpEeEJwZTZCR2tp?=
 =?utf-8?B?T3VKbG1oMENNamJDaUdubk81NTk4M3dGaWUydjVaaERLTGxNL1NCdVJyNEdV?=
 =?utf-8?B?SlFpQlVHVkcxQXg2RkN2Vk1LOTE1NmdJNzYrdG51Y2cyY0hZbTFOZTgrWktZ?=
 =?utf-8?B?YXQrZFRWTXZIS3hVcDdXSnlIL0JGaFFsOW94Ty9BMFlVM2NHeDFRelhIdnhS?=
 =?utf-8?B?WEt1NDlhYkJOQnVoamdXZHl4YnVpS3ZJOGtUSFlGcTBCS0VJL0g2d0lLMlN4?=
 =?utf-8?B?ZHpqYkZFWlJTWk9DM2kzdGhxYVJNdWFsZmE5cW1pZ3FlWmRGL0JHNlhsMTZE?=
 =?utf-8?B?U200NlNpc0txL3Z2VWNpRFhBUG9ISHhjaENkUXZud3d4cklvdk16SEYrbkNz?=
 =?utf-8?B?OHpXRm1JS0FYN05seno4YzhpQyt4c0JDS0hvN1pjZVpKVHZxcUJ3aTcyUWt5?=
 =?utf-8?B?ZmNCN2ZzQStWM0xSUGhUTG9sSVlEbzM1R0dIREIrN1BDeFIrSVdTREQxaXdX?=
 =?utf-8?B?T3I5QkQweXBSc01RS2xEUnZCT0JkdWNGUmV4c1JEN0pzUVlIa2h0czhza3gx?=
 =?utf-8?B?RHJwRW5VUzd4TFlZQ2RKRDhUWVVlWGZhZFZiNGdMbmRFUStGS2lyTEZ0SG0r?=
 =?utf-8?B?S3N1dnF4Q3RzWDhLYUhRQUxGRWptZ01UVzRhT3ZLTVRIaVVWZWFNVVBqVjNp?=
 =?utf-8?B?U09XQW1iWFJTWE8xckFrQ2VPSXQwY0FXdDl4LzYxOG84NUpGTVhwbmY5bU1I?=
 =?utf-8?B?YUFBSWxNNzMwMlJ6MmRyQ25QOGx3K01IYk1tK1d5SlZBbEkxVlh4NVBRaDI1?=
 =?utf-8?B?VmdxR0N0TWtySzN6OC9PL2RtMTRBTlJLQVNrcVdBMkZZQXV5MVRsSHlhYnIr?=
 =?utf-8?B?RWtEOHd6bkhVTkh6OWhQc1lRREF1ZDM4dklMZnRLVUNEa1k2aTY3M1FVcE1t?=
 =?utf-8?B?NHRrbHNZK0laMUpFVjBQSnhrOTBzMW82SmhpeXFneVJVMVpzeG84SHV3clgx?=
 =?utf-8?B?OWxydkxaU1BIbkY0NHJZYUx5QTg4ajdUODB6Z2NUejJubnN6Nkd1SzVadVdE?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd18d81-1eba-4b1c-8635-08dbfd8d04c2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 16:43:51.6355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XP3yQYkcoZboogB1nkwWZyamkfguNCd0txRiy/jDuiXGlLYubQ7LN5C4oywaX+co08+r82fQAXpEyRPY7PhhwsTav2rpNtk2GVVvI37c0C8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4554
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 09:32:36AM -0500, Rodrigo Vivi wrote:
>On Thu, Dec 14, 2023 at 07:48:12PM -0500, Rodrigo Vivi wrote:
>> On Thu, Dec 14, 2023 at 01:39:54PM -0800, Lucas De Marchi wrote:
>> > Like done in commit 2250c7ead8ad ("drm/i915: enable W=1 warnings by default")
>> > for i915, enable W=1 warnings by default in xe.
>>
>> I'm afraid we might have one more case before we can enable it:
>>
>> drivers/gpu/drm/xe/display/ext/i915_utils.c:18:5: warning: no previous prototype for ‘__i915_inject_probe_error’ [-Wmissing-prototypes]
>>    18 | int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
>>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>
>nevermind. please ignore this. it was a local failure because was not building
>everything.
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>on the series.


pushed, thank you all for reviews and acks.

Lucas De Marchi
