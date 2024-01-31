Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1311BC47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 05:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62B310ECE4;
	Wed, 31 Jan 2024 05:21:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A392310ECE4
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706678500; x=1738214500;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q9SWj++j9eWBuXGE7VAnz5t5d1uAZsOk0PX8hX/C8LQ=;
 b=WULR431UHVmCQvUuCHlKlKLoYnHCUKwb4+og+Qy/shOgkKT5le5wDbPc
 0AGUTaKT8TkPdRHYn9Ew8/66Hin7k7mLtnr41n4fBcgr1Z2esfAEzP5uD
 +Ms61mJfeAtRUBmdDOBgeOKBkDwjdpzFtdhZeLLk1AevKf6KbwOH1TKsI
 Jp/4XEMTBpCnrJlwZ4rmnqTZBnl0UOLhp7NmrOKty0Kbn/3tmkEBOC69g
 HRMCQpDAanynOZZ4fQm3ObvaPQs5soY9j1D2XSreHZqoQm8TYqHb1ileN
 0FhtyRotD9AugVhApWahrmWu7v8Tx/Z29zRDFIMu70y1kQIyFt+nGSUV8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="402351001"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="402351001"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 21:21:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822436359"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="822436359"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 21:21:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 21:21:38 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 21:21:38 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 21:21:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwuBDAcKJHmNcUYjfod5ushkgPHWpRZzF05JMPDQlPDtlHZCx28BL8epdH9wgXvC/D0icmcF7USUhgNeJrp5dcnBRtu8SUkzIhlfg3l0C+X2R3icb5KG4G67uqGNNsVarXcSv9Ozc540CYUBfQfvtu2I4GkMj+TbkBcfC1KDx6wOhMwcsH5Xm6rUjgyWtzSPAzL+VHLbTG41Fg44PP5HF4B3CqztegUMbjF4MqDX7pTtFIGjsxK8zNRjnsLkhhkADFan8L9/YVx9BJehsldol2cMMi0kUdxaxuGaa+LbDtBuUpshdh0tI5hrR6jEIq9PS5VOFOGN+7Kmk/9qn9Vc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Fiknf1h5INFH0T2+kOKlUbAhdZGAPjiGYRT/LvWymw=;
 b=cv2NYUeOLnK7FV2l8Aly1GNiOAxZFuvTcfm9WAcdmYkfVefJWptG2jtBgC3174qytKbip2aLwWwasxM6CLfSSndAMiYdsbVjoS8Rd6nkB5V41dEWGTrHVbaQZbYgD9BDUfzNPn+4q18UAlYD30kz2Pq/iFFsMsIVLPI9v7Avj6lpR3wJXnx6hvKjZoBgYZW01pfwVVoRdNucvwkj5GoIE3s/RojL3DNhvPko5pBGDMD3Ye6pVmVX44X899Z3jIaZogQLRy4udWEJvK9aUTdGCxZ5SDFGpP8xUqeNOZ8xSldi7AvGvuFZ448MjAPMGwfM/p1lOADfh6SZNLibd6VS/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.34; Wed, 31 Jan 2024 05:21:36 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7249.017; Wed, 31 Jan 2024
 05:21:36 +0000
Message-ID: <963e8288-050e-459e-91be-9243991f49a4@intel.com>
Date: Wed, 31 Jan 2024 10:51:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/query: zero the engine info
To: Matthew Brost <matthew.brost@intel.com>
References: <20240130155122.12138-1-nirmoy.das@intel.com>
 <Zbky9x45K5h18tVB@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <Zbky9x45K5h18tVB@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::10) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d120bf3-8425-4a0b-0e66-08dc221c7e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kcU0SApSi3D5hgBFX0GnTmUEhe/9EIzfZRPyWNdVGXK+3Qr4Ya+YYT6B+KV0WfzQJKvaBZdFpEQB85MjSkXwZSodqqXDgicGUIPF/YIc89ZoOapr+hf1VEyqQfH1yLGPv1zN/i4EHo64WSJK03VbylsR3vfvnpbmn5P2C7LLf7GaTN3Y7vOz5CjpWMoELlhRq4J1nqF8vCznaaZTE7puxYvOlhYZ5nxUc/qIE1H25ElKbHsTnqErxxZt/+gPY+LO3ZWU4L3aJ4iHTzqydMl02OUGmuEgRtM2vuDvLVP/g93gPgTOZczIBjxIxAY599UKmhh6y9ovZu9JZLASpsQjqB6dpF6Tb/U6mw7Pbl+/0rIWqjcMLjxOIJ9GbgJocunWShHw3+oRjcJ4dFiH9mqcAkMLRo5uHO9KG3OBseOJybA6CYyZFclnLN/DmdnedhBzo+W8y0kp5sed2JHp6pJfwdGZgb70i15gPmcHyuZM2NGD3dWoZGXMFpVPwj2CPzIuyDDjgsIh/XbQxcVY44Lx1CTg17Ss1VojSgfcBzVDX4oCDHfRuzV609yUT1h7i96JLq/WzVsDdbSdVetfwvRNtEBJABA1ol8/j/AQ+0o0zc0MwrDlR+k+g6G1EF0aol/SADI7BNT20IqiZGR3TNW8EQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(44832011)(5660300002)(26005)(2616005)(4326008)(6862004)(8676002)(6506007)(53546011)(6512007)(83380400001)(2906002)(66476007)(66556008)(66946007)(6486002)(478600001)(316002)(6636002)(37006003)(6666004)(8936002)(31686004)(82960400001)(38100700002)(36756003)(41300700001)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0xwOVN0UWY4WE0zekRON2huNnA5cjVXcno1dkpCTGdzejV2ZkpzNm9KNG9D?=
 =?utf-8?B?ejhoZjltbGlORXFlRzRvZGg1aGFiTldSeGsrUmhYZFQ1TVU4ditqWXU0NkJ6?=
 =?utf-8?B?b2EwbVVnWTdEMHF3ci8rWGtMNmRiSEV3cUxiWGJUUkVnNDJtZmRwcWUwVjM2?=
 =?utf-8?B?b21PbmV5djkvYW93dldoMWIvZi93Qkx3eGROdXZ2Wi9hRXVDTXhsUmlWOGNx?=
 =?utf-8?B?N0FabE9zRzVFTG02djAxdzdoVXRzYzRaNXpiK1FBR0svUXk5R1U5ajloZk93?=
 =?utf-8?B?MUZFUjNadWRxMGhVbUI5REtmdWRlUHhvL3FrR3p0UzUrdEtER1kwSDFQWkhO?=
 =?utf-8?B?OXZUTFZHWHpPQlc0OW9RdEpmNGpXZnBSNk9RdTJFZVNma2RhS2w0bXZycXlT?=
 =?utf-8?B?dUVhWVRMRjR3c1pYeEUxVFFkRmxMSnJJRWhCTUFTeGpoM2MwTWIzNjNXbmMy?=
 =?utf-8?B?TjVHNCsvSytvMGh6b0hvczR5cEtyZjFPY2o3anlBZWx1NFBsL29xai81cmVj?=
 =?utf-8?B?dnBLTGRva0szbXVmVSt0empiSDZPRnVWdzcyWnJVZ01KWnVQZlhXVGRJTFZ3?=
 =?utf-8?B?bFRBZDlkVDB4TGxycWZReHVnZkNWaVp6ZjB6eGRQTXcxUFRETEtqZFh6REZ3?=
 =?utf-8?B?YmpZTnJmcFROSGxiQ3pLL2NDWjNJMEticlYzMkQyT1lVWE9TVHUveHp4ODRY?=
 =?utf-8?B?ZVpkaEdadFg2QlMyaTJxbFZUcmhsbFVmSFJxR2hvMnJlY2JhN0NLcWJGZ1lR?=
 =?utf-8?B?ejdkM216bFZ4bTBiRHpEaE9yR1JWVnBWRVZiVlRuN3U0aElERnRJNTdNeXZS?=
 =?utf-8?B?aFRpUjZWdFZaY2djSmVyR2x0QzVRdHdBZzVuMVc2dCtsZkhWRGdIczdpZUJU?=
 =?utf-8?B?K04zeDV2S3hjUWFqZmVyU1hJMWg4eWNqaGIwOXVLcDFGL0d5MjlsQ3NMdTJP?=
 =?utf-8?B?QzlxdmhkUVIvUzhwbFRRTWNLSVJBcWNQWkcyaHdlRHM4YW9EVlJENERzc0hE?=
 =?utf-8?B?YnM2R29UdWpuODBPcWVwc01LamhBdm9zYUYrZ0dOelV3L2txczc4RktYdGk3?=
 =?utf-8?B?aDFDcWpTbnQyVCswK21EcDdia2IzbkZKNXZET1k0RmUzTGgxWjBJam1KOUlu?=
 =?utf-8?B?UUE0VUpISGtBZnlZY2FvaWc5QnpHSlBBajlFeXJyTGZPMUZxRzc5RG5xc09O?=
 =?utf-8?B?RktKMGQxMnQvMTBCTkRRbUFkUDhlQzZWNzRnaS92blJUemtwa0wrS3IweitN?=
 =?utf-8?B?djM5d0pnblFIN1BKTVdDSGx2aE1IVmxZQUlwOC9qYlh2czdlZkIrZVZHcm5r?=
 =?utf-8?B?SkRqTkhIRjhiYlYzdGJwTFZOOVk0V2U0dHZTdzNORWE0R1RwUlBmQnZKZE1q?=
 =?utf-8?B?WWFCVGM2bGFNcU05YXJqWGt2ZUM0ZnM2UTZWQ2VtbjUzdDdiTy9MRzh4VmJq?=
 =?utf-8?B?ZUVCMFhMNnpka2ZMQlowUFNWajhuZTl5Y0lkbWdkVFlZNEZ5TXNhOTZLaERs?=
 =?utf-8?B?ZUlwUm42WmtCUVhxbmJsaFZSUnFmUUxPNFMrZ2RCRVROMVlpbVNGNnVGOUlM?=
 =?utf-8?B?RTVWUW9vbTM2bHFOUUROc25TMVpaNWg2TG1lWkc3Mkx1SzE0dFc2QXlNOVZ5?=
 =?utf-8?B?NnBRVko4SDdXTXdLcko4RzY5WHdLL3M5MmYrcGtRbmpZaTBqajhwRXdOR0tC?=
 =?utf-8?B?akovSVVQNFpaZ1lWVVNWUGFBMmxLTkxGN1lneURXcFpkbnJZUDVUb2ZDSXFh?=
 =?utf-8?B?b21OdXZ0djVjWExmSTRzT0EwNjIxME9QSmUzUGU3ZWRjR0tQTDVvUmZZMmVt?=
 =?utf-8?B?RStWVXZvd2IxRGJxMk5MdzNoZ1BTTVVWWmkzYUVHK1ZVNXN5a3o1SlZFREQy?=
 =?utf-8?B?czVFTDJOaS9PZHhVS3ZnTnpaYU4zKzAxZ3NZcDZiMGJ4L2ZFcFFGTm1TWGNT?=
 =?utf-8?B?RlVnR202N1BwTFcrL2JiS3Q5WXFVOWtTOXVEdHpPeUYzTnB3RjdxT2lFTDk0?=
 =?utf-8?B?K0NPNWdtRDhGV1d3a3RVUE9BY2dmK1J4SjJQMUZGeTZ2ZENpTFErV0hwRCtV?=
 =?utf-8?B?NUIvUnJjcDA0OWxmTnlEZWhLR1hhM2VvRHVtNUhXeG0wYWxRMnF3MTZWeks3?=
 =?utf-8?Q?E3KNbpXDCVHiGcHWkwFLKTpmV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d120bf3-8425-4a0b-0e66-08dc221c7e92
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:21:36.1467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JKvC+/3ZDjqesOfDw3a3HaxUX8P+zFoSuWIrG7CkHGuR0v0dZf1SKn8M7FTY6laJa9PQS90kJyHz8danMuzvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 1/30/2024 11:03 PM, Matthew Brost wrote:
> On Tue, Jan 30, 2024 at 04:51:22PM +0100, Nirmoy Das wrote:
>> Use kzalloc like other routines for better consistency.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Maybe s/zero the engine info/Use kzalloc for drm_xe_query_engines
Better, I will resend.
>
> With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks,

Nirmoy

>
>> ---
>>   drivers/gpu/drm/xe/xe_query.c | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 9b35673b286c..02a4e2c083e4 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -198,7 +198,7 @@ static int query_engines(struct xe_device *xe,
>>   		return -EINVAL;
>>   	}
>>   
>> -	engines = kmalloc(size, GFP_KERNEL);
>> +	engines = kzalloc(size, GFP_KERNEL);
>>   	if (!engines)
>>   		return -ENOMEM;
>>   
>> @@ -212,14 +212,10 @@ static int query_engines(struct xe_device *xe,
>>   			engines->engines[i].instance.engine_instance =
>>   				hwe->logical_instance;
>>   			engines->engines[i].instance.gt_id = gt->info.id;
>> -			engines->engines[i].instance.pad = 0;
>> -			memset(engines->engines[i].reserved, 0,
>> -			       sizeof(engines->engines[i].reserved));
>>   
>>   			i++;
>>   		}
>>   
>> -	engines->pad = 0;
>>   	engines->num_engines = i;
>>   
>>   	if (copy_to_user(query_ptr, engines, size)) {
>> -- 
>> 2.42.0
>>
