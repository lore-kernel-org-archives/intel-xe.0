Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12022C77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 05:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C3210E08E;
	Tue, 30 May 2023 05:11:09 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33A210E08E
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 05:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685423467; x=1716959467;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/DDHW02TSpqU82ERPJ5fNzohuJiWf62eKf+y+XJ/F0Y=;
 b=c8apT7GOLkvZJoWVX0muL1NUXXgdybGCRgy9Wvs1li7HPWqyaz5jV74F
 Mq2qTMvJ0AWzDX9atxa1YRhthjg3wr0QcfOcQtSKkugTh6ZmwUm5OWxSZ
 OtU5uPqYGe8bhMrdxnr2SkEWspMJfwD2S2mSp5KbamkzQ1fp885Va/k+7
 OW2+0lDZnTnj5bp+N06x72k6/cZTMyczbAocRJytZfX1crnzZmPMygIta
 aEG3vmhHYRkM9KXk8JmKXHHv8yKVdbY/Qps9+K1wexfx+zoGP7uVUrEyQ
 JS3XHgigiWKwkLLYqz8xlmB2EqKPkB78LTe7Tu+9KkAtHLCMSgEj9tnUp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="334439853"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="334439853"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 22:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="830597936"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="830597936"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 29 May 2023 22:11:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 22:11:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 22:11:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 22:11:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWZIECWZNvJRN1491YpA/gUM7COuYojjwnYbUP50IY/qYcoD4JZRxWP7I4rAx8PKqfmlhqzXFRSaczM7IaTojjdrrgf9otOP9LBDrur6PSXEdGz4R4n7GpiZGddodSqfyHD43FuaceJ1XTRv5Fz+Ppzvt/5WXiH8/7YqTlF5pXOyqikH3gQ+SmCMLSZDOvKiEBbbfYCcZK+xmJMtSmrXSbdN7Vs26IQeJf5HD3Yios+Nro+XvZOquEBJBXUQPCsZrHLs9gPhg/YZoqUVdSemi3Vn40irMFLgw/t2vevT1jkOGT4VyveSEB3dnwfLki4MRtl3ESnpy+QaU9bzYwpMnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pzc4YFNA5NXyizP3n0BskhMEA3Xe2mYO0r6yVDCNnDU=;
 b=fzaDHvnxJox12sx1Pluh6EsW9gUD2Lo5YqbbvfjYNqFxjCQY+MY3pg/84zdyLMbCM/cv+Y7EKX+GheuBi7eu8cl2i3bHExF4HJmVILwXlKD7E/W84mwUunXyF0P+DMLm0kkVfVma3FNPJaJIqqtR5wFwxsVMxGchpAe3QXvN8Hd/GRXF+VzMntNIud18mggV50kbea7ux4j9kmOv4I4oXtTk8AefN7eUoKDeRTTUOCL8yA0rVdrhgOEMPQ7Eiq2elwWemFu+1L3Qk8lBIxQ4cwWsTDB4WXRPrh2S33WdDtVZ5XEhIpylMzIF9dPRFhjOs4KjeiiR9+wSXL5oyl5WYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH7PR11MB8502.namprd11.prod.outlook.com (2603:10b6:510:30c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.23; Tue, 30 May 2023 05:11:01 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3a23:193f:52c6:9e1c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3a23:193f:52c6:9e1c%6]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 05:11:01 +0000
Message-ID: <37e6f3da-34f8-7cd7-7f89-d7325e9ca1ee@intel.com>
Date: Tue, 30 May 2023 10:40:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: <intel-xe@lists.freedesktop.org>
References: <20230530051302.2248354-1-sujaritha.sundaresan@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <20230530051302.2248354-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::8) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH7PR11MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8e1a22-c26c-4c1a-a78a-08db60cc4262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rdGD3nNt4c8Y6A6wKYFJs/BXZgrvbLjqwps944X9ALr3oTsLrbwBJi/VAGmrdgrIVQHpI5/qLVDb6ePgaQm+schb9mcJ6mGb1hnVy4IhBXwNejJ/DN5gV3iWj/Kzv+d+tB5WsCq4AE5cLPdiPEUGd2l9D5lUSDnwZBETYsTftuukTQtdUYgq3kA7asCuY9WPJm8FpIOwfQltVIcsrNDwymBUw7FpEoxSj39l28keL7CIUQ0AzaxKYlydynBEKcTdGTCuf5mOcFEigFqV8Lq87bi4yOd7UkiRsr0hAaW7lDXwUKY1s48g4DTa42St72kbolZtfD6dm1nkjgIY2ae4PDbatjxlas6SFh+CPZUD7wqKaHXbfBypmIH8Z6ylkyzUwm9HLKn9QzbG/zZJXhyv58UzqMdA341AYv8Ih4y7bibgbM9RWoxAHwF1f24Zj9fyI+VH4rlcnvBTGb40w2skt8YBOJz7I2oQxjy3TWbDLqUUD89s3UvgDB1dbuwrQrWLsKitDli2DPCu2rDki8b3sWkJDAxN/b31NTY2JNw9veYs4/pfRiYok2agTG7Olsi2t8lJuWBO97ofrRABRl+bpIiDQUos46Nt3eoTlDU7elqF13iTVNm8sMjFDhllPW1UGR0Fs4WTJTUpWC8zE7Uc3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(2906002)(186003)(31686004)(53546011)(6512007)(26005)(6506007)(5660300002)(8936002)(8676002)(38100700002)(82960400001)(83380400001)(2616005)(107886003)(6486002)(86362001)(41300700001)(31696002)(316002)(6666004)(4326008)(66946007)(36756003)(66476007)(66556008)(6916009)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVRzczg3QWp3YitTVnZuZnExeEVFM2s2STBPdTIwakwwekVyKzRjMjAweThq?=
 =?utf-8?B?NFBBUlplZ0NzdXp0OUI1TG52amFFWnhrSzVrNzEvaWplNnZ1bWF3SlMvNU84?=
 =?utf-8?B?L0hva2ZranF3U0txQkxtV0ZNM0ZZT3F0eDNtajlPZVUwS3d6dEJVVGoxbzlI?=
 =?utf-8?B?dUdsaFNDREJrU2ZwRFJwbGRGaVZRRGZQMnBHK3RIMEl1bUNqNUNDdUl6b2VU?=
 =?utf-8?B?Vi90UFAvd3lneUlxam50WE16ayttc2JTZy9INUNNOU9hRXlwZDNKNzhhOWE4?=
 =?utf-8?B?Mnk1S05udGhXaVBOblJ6QUJKU0lnT083WkpyRHFWZTZVQ3praWVOWk9LWDdy?=
 =?utf-8?B?ZldCVXNYL0lyNG9NcmhmSTMrVTJjYjdndEpZNkxKMmM3SDVGa3gzSlhvc01U?=
 =?utf-8?B?VWp2RGV6eUVrbW04d1lvQlh6Y1E1WGZEZGt3L3VXZlFyRlB1Ty8yTzM1K1d4?=
 =?utf-8?B?akVlZXhhcFFwZXo2UFc3T3JtSEFOUFhKZFFrZ0ZmQ3Q3a1RwS1NpREJKeFJW?=
 =?utf-8?B?NDVnRDVYZC9keFFsWlZPT2gyQWxvZm5VMHhMN3o0dktjT0Y3VTdwY0trUVor?=
 =?utf-8?B?RGQrSFV1L0E3R0tLWDFsMjlKdC8rR3NzN3huUkdkamhLK3dReTFPbU9nVElE?=
 =?utf-8?B?NkYwSENub0d0WkNPK05oU0ZZanVyb0xFL3pGN2dpSXpZTG9SVzQzSTh6QXBu?=
 =?utf-8?B?Qk5BSDBBcER0QjNzcHc0WnJNbWR3VXZqSU5ybkhzV0NiMnRBT1Rrd093REwr?=
 =?utf-8?B?ZFBQUHFldzZVSGR2LzFnbzNnSEZndkF5b2JPU09pcklTd2pMeXgvM0lOOTI5?=
 =?utf-8?B?dUpyU2hOY2F2WURtTkhoUGpseXNOUTVnNXBFNFRjT0lTTm5VR1V1YjQzM3Qr?=
 =?utf-8?B?Y0RBeWt2cnhROEJYRXVVT1RjNjJPd0REZmM5aFM5MXRmR3Y1OWNQN1ZaZG1v?=
 =?utf-8?B?QzVpa1VFYWVHVWJMZ3k5Ymk5TUxBcnN3QnJObVNDUWNlRUl6V1MxZjUzY3da?=
 =?utf-8?B?UFBoVk5UTCt0QVpJNmUzK0RnNGhBTGxrMVFnaUU2NVZWeVhzNDlaSWhDYzdV?=
 =?utf-8?B?N2ljZEJsa2x6amJwV3BZdmh0aTRRTDRRcURGMnNWR3VxcVcwUFNnaDcwcVd1?=
 =?utf-8?B?NW0vVUZUZlhzTitHb3hQVmRUNnlCM1M2YlA5WGJlTDJRZTVZTlgwT3FaSjgx?=
 =?utf-8?B?YktySG5NTmllK0pQYUR1WW5QSHFoWlJZaFJTU2owUG9aVlF4TVdRZytFMi9w?=
 =?utf-8?B?NzlvL3hRelBwYlBjb0tjUnhtNlE3aS9PaWxVNnB5SG9ZRk5qOFhIZGRRY3ZZ?=
 =?utf-8?B?Y2IzU1lwUXN5SU1QSS9JNFN1dEhNTFNCS0kvNXVhdEIrSUFWdkhGb2lBaVAr?=
 =?utf-8?B?SUtBYXdaZlFLT2d4TVdicDc4SkFuM2x2dC9qV2EyZ1BGVmpyQVhVanJ6TWpI?=
 =?utf-8?B?SXQranFNOGtkQ1U3SXBOclZsdmFvY094Q3doQjhPTXRiMkJLNGNpN3lGYVZH?=
 =?utf-8?B?WVlDNGhkenhoN2d0RnhaUEd4WGNNNkNxWGgrYXdrejJDR2JnaXZjWWlPaGlq?=
 =?utf-8?B?NU0xSGwxQTRDVzRLYkJKTUNWVmphN0VDYk1QWWNhYWhuaTRYRGIxR1B0d2p2?=
 =?utf-8?B?VmcxazVZOWY4MFgwbmJRVW1wMEEvV1RPU3p0WEdjV0RvM3lQLzlzL2Eyay9y?=
 =?utf-8?B?SGxOeUhKZXRHdXFvYWFXT0tNV3crN0xCVmcySmZmQ2ZXQ0k3K1VJcCtRUDla?=
 =?utf-8?B?VHQrTHNaWDlablhxTFpicjlaQVd3eW9JSEVwOEFSQ3VBc2R1OEQvbTZTcnoz?=
 =?utf-8?B?VzlBa3dKUEtJQm5YR0wrWXJ4YnFWYUMxdEVPcDlUNlVnSVBBVmZNTFJjLzFR?=
 =?utf-8?B?ZGJOaGhOSlhMcnR6NTBKdjVaZEZHaGxrd05RbHc5RkprU2J3SVlTNjE1R1Ey?=
 =?utf-8?B?a1hON20yTGxYbEdGbzN3L0pnRzl3SHliWjVVcXU5S2R4bDFyV0hVT2drbURV?=
 =?utf-8?B?elFrQ0xYUjBEcys3MXV2REplZUw0VGppK1lySWtabUVKQXIvdktBRGhCbHJu?=
 =?utf-8?B?bTRucTl5b0w3VGRESU9YcXp2aFVQTVVZVW5NZUp0L2cvVW42Q3hOc0NkVzZw?=
 =?utf-8?B?L0dvZGdoWUx4SGc2MUVhQ1ZxcEtKYmljNUtlY0o4Y1NJNlVYVHovWGVSRXQ1?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8e1a22-c26c-4c1a-a78a-08db60cc4262
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 05:11:00.9976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Zeiu3a9lyl0ttj2yy3qdtEC1xyuoZ7Xw9x2vz3u/kDUMF68wjwxO6l2UOulQqVN8/hvtGzzb0XPABLZ6sexmyF4zPsaI7KX2EkHj8/9kUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8502
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Sysfs entries to query fused min,
 max frequency of
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

Please ignore this patch. For some reason the complete series did not 
get sent.

Will send the updated one.

-Suja

On 5/30/2023 10:43 AM, Sujaritha Sundaresan wrote:
> Adding sysfs entries to get fused min, max frequency of lmem
> using the pcode mailbox interface.
>
> Co-developed-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 44 ++++++++++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e799faa1c6b8..a38493bcadae 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -65,6 +65,10 @@
>    * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
>    * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
>    * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
> + * - freq_mem_rp0: The fused maximum frequency of LMEM using the PCODE mailbox
> + *		   interface.
> + * - freq_mem_rpn: The fused minimal frequency of LMEM using the PCODE mailbox
> + *		   interface.
>    *
>    * device/gt#/freq_* *read-write* files:
>    * - freq_min: GuC PC min request.
> @@ -625,6 +629,44 @@ static ssize_t rc6_residency_show(struct device *dev,
>   }
>   static DEVICE_ATTR_RO(rc6_residency);
>   
> +static ssize_t freq_mem_rp0_show(struct device *dev,
> +				 struct device_attribute *attr, char *buff)
> +{
> +	u32 val;
> +	int err;
> +
> +	err = xe_pcode_read(dev, XEHPSDV_PCODE_FREQUENCY_CONFIG,
> +			    PCODE_MBOX_FC_SC_READ_FUSED_P0,
> +			    PCODE_MBOX_DOMAIN_HBM, &val);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(freq_mem_rp0);
> +
> +static ssize_t freq_mem_rpn_show(struct device *dev,
> +				 struct device_attribute *attr, char *buff)
> +{
> +	u32 val;
> +	int err;
> +
> +	err = xe_pcode_read(dev, XEHPSDV_PCODE_FREQUENCY_CONFIG,
> +			    PCODE_MBOX_FC_SC_READ_FUSED_PN,
> +			    PCODE_MBOX_DOMAIN_HBM, &val);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(freq_mem_rpn);
> +
>   static const struct attribute *pc_attrs[] = {
>   	&dev_attr_freq_act.attr,
>   	&dev_attr_freq_cur.attr,
> @@ -635,6 +677,8 @@ static const struct attribute *pc_attrs[] = {
>   	&dev_attr_freq_max.attr,
>   	&dev_attr_rc_status.attr,
>   	&dev_attr_rc6_residency.attr,
> +	&dev_attr_freq_mem_rp0.attr,
> +	&dev_attr_freq_mem_rpn.attr,
>   	NULL
>   };
>   
