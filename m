Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129D2C6FA8F
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 05:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9704E10E3AB;
	Tue, 29 Aug 2023 05:16:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A1610E3AB
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 05:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693286193; x=1724822193;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RoZOvb6XSRTsXSyytJ3q5ae2lN3w25NqoVpu77ttsh8=;
 b=fyOqcVgAilUEB24cYSuiFyIDqRwMHsw3GSSUszbvollc9oOFx1J4J6wS
 Kb7ZmdJhTDWQUV2j2FgXUWVvjOLhouUuyRNQ+MjHUmOB3Awzu3KjpDZLr
 nFXSsNIepvFC3HeNnzwOmD4ZTKP/oi/yN+PA7/OVX2KpUXz3/FQuyNlWY
 jpVgQ8ZugVX+VjSGJsSxxpX1GFHbaSGc1EimcLD1nEkebMjbQkVOMhSIu
 m6jEPkRG7eZg7zSobfG+GVy+ZPE4B0lSik8BBO/PlhrhGNsyu5TtTsJhP
 4dLTB1AS1XMvjunmiapvG7CbawzAu/SoYSbBasPyfI8KhTksTr9rVTX0c A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="441624352"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="441624352"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 22:16:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="803956249"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="803956249"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2023 22:16:31 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 22:16:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 22:16:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 22:16:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3w0sqIImb+36bsN1Q0HJ24DpYDCZIIKw612eo3msoQrqpGJX+LX1/irB59UbzslsRdwS7n0Ma901F8nvv75uZbuQtXSvDn5JUAw7J9jmTgUlDIo4QP+VQLTSOSfxPlKVEV2bayOEOAuHTRO8vRYHxV+flXydqjTTVTs/LJBb/FumdKwLrVD6aDd8Tiv6JKRRv7yp/o1NHVePLEAcw2b7kk0oCsGtngeUq0bajEC0F/c0o1JrMCFaXcaUNtrFRBgLrXf0zLrPRDepT4LQB89bCTBkhRea89yj7BKH4Ugp3/iiEdaxUrpWSQ93EU1h+ezpUcbUUnwPwTT5lbCQz+1hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeWhQVugpUcJqqZGqTTm59iACRmxWb8AgelT76YsgYc=;
 b=Gtzhp2AA5fv438KLxjvfvHJL1kzFTJIx+0vNE/bgbcUGcKstO5Yr4gBtYlmuHs4D3KZmMizEyuC+aorl1a0RB8Ug2tsWm+NGVh/i/beOg6Fa+M8rN9LhHdbO1SFo8A/AWsQLms2th22uAAyYfGMJwcBhSdOzAflDsZTLBH8ut/U3mns6fLOKAY64wVHEY31UICWOWRa0KOcOo+OORNq6Luo/uHjiW35bx496HllWAncPAmhcUK7Q3uRYLb6IhgiXakjhBjuyulQOYYy8C3LeVMA8VCPtsY5S0pWHTxCHuDakiouCFWGWuR8Vhl2ILK5A1T6+Ra5qyTRyu/ipdzH+fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH7PR11MB6499.namprd11.prod.outlook.com (2603:10b6:510:1f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 05:16:29 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 05:16:28 +0000
Message-ID: <e72d7788-7c54-341d-53a5-e8d67f0f6bfe@intel.com>
Date: Tue, 29 Aug 2023 10:46:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230821120728.3871527-1-sujaritha.sundaresan@intel.com>
 <20230821120728.3871527-3-sujaritha.sundaresan@intel.com>
 <CY5PR11MB6211CCF155D51F1A42496166951EA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <CY5PR11MB6211CCF155D51F1A42496166951EA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::16) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH7PR11MB6499:EE_
X-MS-Office365-Filtering-Correlation-Id: 57560843-1ae8-4e8f-b9a2-08dba84f1928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jtxRocevFR60rVALXwmeJ9Unm10qcbgHjnO36H7WIhETtHRAgQCpRBbeDMiAR5OHQFEGxD5SdZG5Uixq9MAFMauBQvC4V++qzA/lULu9muJdo8e3EQIJPmVp+lg8vMBr/b/HbSKesqF2m8aSnaDSkIuWGlJcnD12UyN6tqSxpaiOinHBCFOOmY6HcrA0p2HAkWw/Wa31+6AQp7d/SvUo5WVQJzf5/ZRyfIRgRMY8Zn9ciBTB84pVj3LY6CtGtAkKW1APmQG+ris+A9t+lcYQT8xEYam5r84G13pFPHRalZM796Jo/S47SqsTMGBWlDDyNFxH63Wv6DXJMikGc5JNfYqDAD5EH78TFeSpHMwP0UAnG5uz45Ahryoz+rC7Re5Z5szvUQCkfUyBI1E1GTspnB/GbwYJ6zUTlsWfoJv43bL0q91rHihl+h5lH+n/YUhWKkLzpAaulo5lABX4kBva++8wG8ZiP38knmrMk44DRLToFmcHTA3D1Zh5roSCgrOi3FBYv6EjKFAEfv1pjF0Gj6uEj+HSoPKfwXdSE2Z5cu0/l82+NbulgsmLPvaU0T60A/eyOZX3UFIv9Pjngodcizu3M+bDm58CjxR60ucvTKddSC5M7XyzqMYkLF9SZVhZ4hAkaEML4Vs7wzWCynyVyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(396003)(366004)(39860400002)(186009)(1800799009)(451199024)(31686004)(6486002)(6506007)(6512007)(6666004)(36756003)(38100700002)(31696002)(86362001)(82960400001)(26005)(2616005)(2906002)(83380400001)(53546011)(478600001)(110136005)(66946007)(8936002)(41300700001)(5660300002)(66556008)(8676002)(66476007)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzRPMVFRVFo4ZzF4UUZzcEZ0Q3NENVUrSHU1alAxQ0FmWWRDQ2lqV0hNTkZq?=
 =?utf-8?B?MTdHY1hqY3FhUFh4M1hYc3Z2QmxmckNwRWxlYVZ5NmZNaTd5blVTWGdXSEdu?=
 =?utf-8?B?MlZqUmNnY0w2T2VFdzd1cVUxMERmelZZK2YzcXpDeWgyKzl1Q0ZndmJHa1NP?=
 =?utf-8?B?UUIvWm9IZzhmWTBSbUxtS2xnRER0Sk5DOWVKcy9SZ3JSNyt2QWdpeGMzY3NI?=
 =?utf-8?B?MmlHL1JuOURmS3dIOGV3UWthWDRsMm5kMTlwai9zUTdTcXV5TFptNllwcjhN?=
 =?utf-8?B?Z1JDbTRZYWY1TDFXcGFzaDFZNCtWT2xwd0wyZm0yQU40Vy82VlFpa2k4ODN1?=
 =?utf-8?B?RUlZcVpIOTlKSjZEejhUTUc2NWlUY1dWa0ppN3UvcE0rTitmYldrQUkvNlBo?=
 =?utf-8?B?RTZzQWJoZXczc1BhMXA1UzFoWDlwRyt6WnhUWU5kdmhHVXBTcVlRTkZSUlZ2?=
 =?utf-8?B?NWxQTzVpTUlFQjgyVWtWRFFiU25LbDdURXIrdC9NMm1SVzhuREJpOHROdjNh?=
 =?utf-8?B?NVVGZWVCRXZwenJyZVZkVzR0VmgyVEw5WHhrWndKb1JVZEhhdTAybitYNmFH?=
 =?utf-8?B?UzY2a2dEMHV2UVNoaGVyZjVDTnVZL0lkeGpHN0drb0dZTW1uVTNrbFZHYUVY?=
 =?utf-8?B?aUp5dmhNVCtyMm93K0xJMFZZamlvUDVRalE4U2x2bjdwejVGa0xTUzhjNkZN?=
 =?utf-8?B?NDlEa1hZODAzT0RQZVg2Zm0xak1kcWdKM3hJb0xheFFJdWROR09YK0x3Qkxx?=
 =?utf-8?B?TEEyQ25MVmh4NFRtV0hBbTQzeEl6eFNmK2lDSXVmeUhVWDg1Tk9Ea2tPUkYy?=
 =?utf-8?B?ZVNOTU5hNDJ4dXN1d1lwc2gzQ2RFWmRaeXU1eFR4dzZRRllEQW9EMnhaRHhQ?=
 =?utf-8?B?VEtDZk8rQldGT2NlMzZwbjZPZ25rM2o5bXFQMEhhSGZuUm1IVVV6eGFNK0VM?=
 =?utf-8?B?SUFwNE8vSmFQZzQ0anBUcnpOTnAwT0VONVkwMnNDMWxyRkRMaTIvMkhBcU1S?=
 =?utf-8?B?dGdiR1pRM25JNkFQcmNvY0hsREFSQXp4OHJtREVmRHRINW1jTHJHcE1PdTYr?=
 =?utf-8?B?RkRMckRqbWdkZmJ0Q2NMQ0ZQUzNGTUJXL1BITDdjTkxkdHEzbXF4TWlKeDJM?=
 =?utf-8?B?MHVOSHpXWU9OSTBVV2h5ejJ2WU8vbjlzSWFROFVuZUV4UlBnR3M3eXNjRVRj?=
 =?utf-8?B?S3hDdlVCa3d2a2k4bHFqQmpjUVFuQUI4RTdYdnNqcnNBWTh6K2g3eTZtbUtv?=
 =?utf-8?B?V1F0RjB2OGNDTmduU2VWV3RsUkE1QzBVS1Z5K1N0bFZQakFHSEE0UkpuYVNP?=
 =?utf-8?B?Q0QvRDVBWXNQN2NlQmxGRndybGVLd0dueHI1Skp3Z3pHTkJxUmd4RzRSYlAz?=
 =?utf-8?B?ZmV5bk1NOVNRaFdKaFNseTNtMnNkcE1qZlllazNnWlNKQ2RFdDZqMi9zSEE3?=
 =?utf-8?B?Wm9mRkZFNkJPRDBKS1lXcCthN2NxdW02Ny9VZDhrQm5BcnZDUGVHNlR1Mm5E?=
 =?utf-8?B?Q0FJQy82TzlkWEprRmdwcEtrSEMrMTNCQkFYNDJGaGxxSWtXMUcvblVxcUJG?=
 =?utf-8?B?cklMMUU4Y1JEallzQytQZzJnc3BlM3BTZXNBdms0aU5XblNWU2QxTWkyTHJp?=
 =?utf-8?B?L2lKbEhER0UrUVNxZVJoQnJ3UTBMZ0xqemR5c0NXS2VOY0syUWorYU9MVllu?=
 =?utf-8?B?OXdXUG0vUlY1Q0dOeVhLWUQzbVRpK3lBY21DaHg1N0dzNGxEaHdMUlVORVVn?=
 =?utf-8?B?VW5pcVZqNzhrUDNmYWdPdEROM3RJOWxtV08zNHVjTVRzMHlSL1k4MTBmMkFF?=
 =?utf-8?B?WFhNajdJbW5DMnZETTV1SFl2ajZKeEtuTlJad3ZGLzZJWVZ5RDR1QmJKaU5z?=
 =?utf-8?B?eTQyYWNGSW1zNmw2M0hsc3FETVp3MldnMDJ2dThYVFVzdklMdDlmY2R4NU1v?=
 =?utf-8?B?WVVndDVTc2F0TzhoejdRVzBBNzZhQjUvYzF6UVZ0T2RNM1BIL2h1WHFsK3pp?=
 =?utf-8?B?MEcycVlYTk9IbFd4UGw5Nml5NVBjSC8rc0taUVA4NTNLVlNkbm9XY1FyTy95?=
 =?utf-8?B?TDM5VWFnWTlhN0dDWktxUWF5UzNCZkZQTEU4Z2dSSitHNVhjVVJFUW0ybEVn?=
 =?utf-8?B?d3hCaTB2UzcwdmpIbzlQRTBYR1l6c3AwamJWcFgvTjhkcklzYmV0dDBoNDZt?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57560843-1ae8-4e8f-b9a2-08dba84f1928
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 05:16:28.5818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zyQpj88pBqnshsFSrrJUIUYf0zLvmbjmTlzGobGTwwibno+Z2jAKGeVI648l1rmbSBWNKgAd/HBKhpPseXXH4I+CiWkGoBGmBEtsbqS+NA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6499
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Sysfs entries to query vram
 fused min, max frequency
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


On 8/21/2023 6:55 PM, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Sujaritha Sundaresan
>> Sent: Monday, August 21, 2023 5:37 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Subject: [Intel-xe] [PATCH 2/2] drm/xe: Sysfs entries to query vram fused
>> min, max frequency
>>
>> Add sysfs entries to query fused min and max frequency of vram
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c    | 55
>> +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pcode_api.h |  8 +++++
>>   2 files changed, 63 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> b/drivers/gpu/drm/xe/xe_guc_pc.c index c03bb58e7049..d7e9609c74c0
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -20,6 +20,7 @@
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>>
>>   #define MCHBAR_MIRROR_BASE_SNB	0x140000
>>
>> @@ -568,6 +569,54 @@ static ssize_t freq_max_store(struct device *dev,
>> struct device_attribute *attr,  }  static DEVICE_ATTR_RW(freq_max);
>>
>> +static ssize_t freq_vram_rp0_show(struct device *dev, struct
>> device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct xe_guc_pc *pc = dev_to_pc(dev);
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>> +			      PCODE_MBOX_FC_SC_READ_FUSED_P0,
>> +			      PCODE_MBOX_DOMAIN_HBM, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(freq_vram_rp0);
>> +
>> +static ssize_t freq_vram_rpn_show(struct device *dev, struct
>> device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct xe_guc_pc *pc = dev_to_pc(dev);
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>> +			      PCODE_MBOX_FC_SC_READ_FUSED_PN,
>> +			      PCODE_MBOX_DOMAIN_HBM, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(freq_vram_rpn);
>> +
>> +static const struct attribute *vram_freq_attrs[] = {
>> +	&dev_attr_freq_vram_rp0.attr,
>> +	&dev_attr_freq_vram_rpn.attr,
>> +	NULL
>> +};
>> +
>>   /**
>>    * xe_guc_pc_c_status - get the current GT C state
>>    * @pc: XE_GuC_PC instance
>> @@ -921,6 +970,12 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>
>>   	pc_init_fused_rp_values(pc);
>>
>> +	if (IS_DGFX(xe) && xe->info.platform != XE_DG2) {
> Let's be specific add this only for PVC.
>> +		err = sysfs_create_files(gt->sysfs, vram_freq_attrs);
>> +		if (err)
>> +			return err;
>> +	}
>> +
>>   	err = sysfs_create_files(gt->sysfs, pc_attrs);
>>   	if (err)
>>   		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 837ff7c71280..846c99aba3bc 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -25,6 +25,14 @@
>>   #define PCODE_DATA0			XE_REG(0x138128)
>>   #define PCODE_DATA1			XE_REG(0x13812C)
>>
>> +#define   XEHP_PCODE_FREQUENCY_CONFIG		0x6e	/* xehp, pvc
>> */
>> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>> +/*   XEHP_PCODE_FREQUENCY_CONFIG param2 */
>> +#define     PCODE_MBOX_DOMAIN_HBM		0x2
>> +
>>   /* Min Freq QOS Table */
>>   #define   PCODE_WRITE_MIN_FREQ_TABLE	0x8
>>   #define   PCODE_READ_MIN_FREQ_TABLE	0x9
>> --
>> 2.25.1

Hi Anshuman,

Should these just be moved to xe_tile_sysfs.c ?`

Thanks,

Suja

