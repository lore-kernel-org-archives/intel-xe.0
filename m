Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66220C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 07:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB6710E7EC;
	Thu,  7 Dec 2023 07:29:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CD410E7EC
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 07:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701934185; x=1733470185;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cAT8W1il0B9cCLytka0/eY/hadkpllxKgcZpl7+2y2c=;
 b=Su+H23pUFcUemxg1RlpYm9N6jiCGrnXtIZMHiYEU4VYDkbV5OpB69SEG
 2td9oJKazS6gyb3unIHLPzn5DYVVhY79v6s/GzojhwiXjctW3A8nSg0JU
 RJNrSeQNPf6/z0gSSalxsmFcXjFCa/2hKAPz00VNzpUpz+jDUW7mpgFJF
 RAeClnhuyUfAiE/KxIB3P24wHmFD15AvOk7hYmoojd8lGlsxzCWGza7Q4
 w4O70OKWA1ogzwGNm7RQuVGBrLVp+oxYCxZUGue9qyXlNX2plHpxv2Si+
 VgAiz+xYIfu8OAv/GibiE/pVgC0cpSvb+ortHqUo4SY1zNy537EEJCJh+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373678636"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373678636"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 23:28:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="842117149"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="842117149"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 23:28:25 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 23:28:24 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 23:28:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 23:28:23 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 23:28:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nh2GZItOA8pcrUTDCCeu56mM07Pw/Gg3rCRq9ujbF2H0PTUHAGoLFRbKm1SFiFZfAPU5QoSReUtw7F1Fb2CdF2aELtXlh6+mkqEPvLgObJRcACBFrHEEMqhAHqKvs8ZP6jOcoGD27AsNnLNBWooD1v4Zwq6it2Y3gSs5xQOiAw7omyYt1jWTwA8NzkJ/vBMcbfpgAoeZ52ryTaWCwCbAiVkYK7vtIpLf1H/p4s8O8UYWyGryKr5q77yTrlg1uKz3lBjOgx2Ds6m/kWbPKoQ9xnATLUDHsxtvjcO7bPmoA0Q8tMk5RFDi+fdyq0sQ65/QwcIbFjq3upk24uhzqIiTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bxdx6rAEG7G4wW0RsU96cq5GYfbLhAKeW/EeLgMvC4=;
 b=hHF7j54UcK1Zkrt8vkEqiyO5QQyOx2l012j+3hnnvUAfwDJh79e7Q2t0DFg0Etf3fJJzBnXbLWslHdjgHRpe3DyBlIGzKyvqpYWSEr0lQ7YK0dgX2D3rVcxprfhJRxNsIIIGNJLWuh7D/eq15YDbyjS6nRsECYJ8qIdP5X4Ea8VPUyPqP+YJwXentvS2iWXS5EKEPJrdD8J7ABqtQxwEDuuFYp0MCTjdA+q3+Xr4KcBMf54Jdh2mq0+5FeKqVtb2u7GrDWJkeptflXNq4fezuVgnCzPdDNXQDC2up+A1/QjnXkrR50DBA1jiP4Es/kXV1xdjRn5OpltTaJitcOjeTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SA1PR11MB6759.namprd11.prod.outlook.com (2603:10b6:806:25e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 07:28:21 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 07:28:21 +0000
Message-ID: <38a32c29-fd64-4770-82cd-6e3660d14191@intel.com>
Date: Thu, 7 Dec 2023 12:58:14 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
 <20231206044735.966213-2-sujaritha.sundaresan@intel.com>
 <CY5PR11MB62113FC5A386520506F9912C9584A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <d9e06457-ec98-46b4-9235-8e9b3b71ffa0@intel.com>
 <7b70c647-6fb6-46ed-98e0-8e898625b5a3@intel.com>
 <SJ1PR11MB62049D5B2C629111948A668E818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <65cbe85b-30a2-470c-974f-ba811ec38b52@intel.com>
 <a4be4be8-700e-44b4-b0af-1d847774054a@intel.com>
 <d6d0fd1e-3c13-4992-8969-ea6533b7128a@intel.com>
In-Reply-To: <d6d0fd1e-3c13-4992-8969-ea6533b7128a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::17) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SA1PR11MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: bda3b448-486c-4e69-3074-08dbf6f61712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VxXA7jdoa7HFChSZK5xIRDDTdV/ErhkdI7ZAe3dTMUAEaNGj/ZmC0DnfeE4WuFkb1LKyXCn4Z4fce/R1aiKQEvDa9ROlhEpO0/UdXsEtigjeNmc2Qmm1E/drbtENA8sQPuzCz8hGA6Vz5L3A1Yl4MQ4iwkvm2tHZh5EUlsb8P7lgNJhOAfQeVZMkLdWPIJOWmdimlYDSWXtX7cRIkVXY//stO7dprIHRUQ9DfYbB//8wTwF8DLbcxSKkElgfOhkHKlhbPwjQ8GTBkV3u7kTgdbykpILNmH0akSyd9F6MVibf/sNr4KTlztSj9Rz7Z2nTf8lspdMRVj3FejaEhOq45c006DLpUA9DLuTr/5gXHkVlCxyAlLpqlKuwiHFVO2qa5+PLR9VbB79hZoBeUnjSzq/5usA4zBJv5IVsN3HTyrNXk/SvKTKYz3c7YJRstxQw54yYrjx5XyWXZ96BaIV1F4pa+HsMf8H39+ec3UvFPLYBgE6Le9IqOkJTUnAqijvSUthY3A0nBf2BYdaWY3u+lTNX+B9v+t3TsBuflP4PmcUlN1E5jLzFijdcRJkGU24m5JaXrJQsX15HG/snWNCcGzuPeRBimGaaJa63wDeVsfAOwAiaOKceM3J8DQySeirJP0ceIzvteL7Bf8GguS76agCx2Jrjp29UT+84q2z5HkpODkPUbdO5hdS4PMrq1/S/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(136003)(376002)(366004)(230922051799003)(230273577357003)(230173577357003)(64100799003)(451199024)(1800799012)(186009)(110136005)(316002)(66556008)(66946007)(66476007)(6506007)(53546011)(6512007)(6666004)(41300700001)(26005)(36756003)(2616005)(107886003)(6486002)(478600001)(38100700002)(86362001)(31696002)(82960400001)(83380400001)(2906002)(31686004)(5660300002)(8936002)(4326008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3Z6d1VFOGY1WkU5cUlMbWVyV0FVV3UwdHV2eTdpWGhsZm5JYXBNN0R0MGxB?=
 =?utf-8?B?c1JGOEVJYmsxOU9Bdk15elYxdDJGVWRUaCtDZVZEYlRYK21KcmQwS3VvQ1hC?=
 =?utf-8?B?WjRvTUczMUhGVG1nZkROMlBoMm9IdDFiZHVKay9ONVJQRGZSN2hCbkhjK1ZI?=
 =?utf-8?B?dDdjdVlVWU55cE9BSjZUcXRsT2hhbGpsUUFJVFhjM3Zxak4xd2tIMTVkUVli?=
 =?utf-8?B?VHRwS2xZZ1Q4dDBvQXY0OXNtVURRTDJGcGgvYlFRb2ZzdGtud0EyOXZiMy81?=
 =?utf-8?B?eXlkV2pUN1RNam43TmZOM09iQi9RY0VQbjg0MzRvVGRmczdTQzkrL1R0Rmwx?=
 =?utf-8?B?cmFxYkRsNnhRY3Q0aUFSZGVEaFc2d2o1OHhUaDFNZ2p4b25EdGRyVTJUOTJi?=
 =?utf-8?B?K3NEOTBOeDMzcFg1N25CbTl1SjNWcHFqOWVQQmt0Y2xqZklESHMvOFZ3NTBm?=
 =?utf-8?B?Ylk2Wkl6S1FiUGRZZndUWG9vajE3cFEwbU1zcE0wUnlGTTNqVlE5Umg3Ykx6?=
 =?utf-8?B?L0h2SDEycGRlZFZ6bzE1UWNyOExoRDYwOC9sOWpubDNJNHBDSWVubE04dUl3?=
 =?utf-8?B?aUV4cm56N29VRHZxazdlNFdoemVUQ2tvMmNSdGZPM1pQOEsxd1plRlVQUTVk?=
 =?utf-8?B?N0NhMFhjY0psUjhFcFRLUndOZkdwTEU2RFFNeEozR2VZYnB1dmIrQzM2UUFZ?=
 =?utf-8?B?Z05iRlBZUUpDdjUvT0xQZlBZTGh4UHFNajBhZFpIbmpaZVNIK1lKUHhKNDE1?=
 =?utf-8?B?OVdEdFYrdkNlUU9hVnFEajRZWHBEZCttamp1bzk4blUzb2pzTXIzRnFmNzZl?=
 =?utf-8?B?dmpsZlZZTGpzT1RpOVIzdittN1MxR2xHTmgxL0dvUW9HK2FZRG9qUnI0OFhp?=
 =?utf-8?B?WHNkM0RQcllkajRoVTRhdFB5ZmN3c0Y0SjdPM0lKSU1nRTVUOVdkSDkxOGha?=
 =?utf-8?B?eWFDUEMrV2ZQZ2lEcWp2NitSUTNwVDEySUQ4d0hhMVNOcFkyZXdlMDJOU0ky?=
 =?utf-8?B?bGh4eVVKYkVLMHYxOFZlWDd3OXBtajdGWllnVHNVeFRyd2FPeVl3cDh3SW1F?=
 =?utf-8?B?ZFEvL1hCM3hsczFNekowczhQVGFpK0pYU0JKUkdWNkJVdTl6ZERrQS9yUUp6?=
 =?utf-8?B?M0l5RTRFYnhzK1VRQ3hDZW5nZzc5M2p5NitFazNxRkdjZUhpb0g4dDhSd3dY?=
 =?utf-8?B?S2U5YTRzWnR1TTJlSWJpQ0p1VFo3cFpPK3UrK3QrTmVhcE1pcDlqaEZzZnVB?=
 =?utf-8?B?eVZ6R1JNTE0vZUFyNzBUeXgzSzlkQTNKWXYxT3hvd1RDcjRMdkt2dTg5bWFt?=
 =?utf-8?B?Q3pUYk16bDVtbUdxbENEbEZOZHVpdUlyTktFU3dzV1RCMENaTENZcEVNcU44?=
 =?utf-8?B?VzE2MVFIM0tiMEtRbTVDSzBNQVFxTVZtOUNJYzExVFA3SCsvWVhFMTBqcmk2?=
 =?utf-8?B?ZnQyQSthNUh5U2ZtMk1zOG91b1dZcENpMG05RjJ3ZTgwOEpnY3NrSURaamhm?=
 =?utf-8?B?YXY4S2s3aVNWcXN4TWR4aitITERUOW9TRU5abnZVQmJmc1BVMzJlaFJUUURs?=
 =?utf-8?B?RytabVl2ak1NMkE0YlRWYjd6aG5LVmFRYmI3dWpMRVVnZ1ZnZmNuWmdXcmpK?=
 =?utf-8?B?ZWFkY3lLeVBSSkY1cWtFS0x3emYyTDVpL1g5cEtHbXY2bVFTOFZMN0VEVnFJ?=
 =?utf-8?B?d0VhbHp5YVZTWUlITCt6MmVQeU5FeFlyR2JoZE9uT0xsV1NYRkhoYzFFTENL?=
 =?utf-8?B?SFQvMWV2MVJxaFVodVZ1SGtFQS9RbGtXSlgzN0g0L2RVeE5HMzVRTDRSY0hJ?=
 =?utf-8?B?S29pTXpCaktWZ3ord2pZZW9IbzJrRzBpU3VBa3g3anc0S1AxN1pwd21qU3lE?=
 =?utf-8?B?RjdSc2V0MnlIQnJ4ckRXc1BXMjFPeDI4YXRBS280Ykc4RDlaWUhIK1BUOHVu?=
 =?utf-8?B?SGd2c0lvQ1ZMc25qZWxuZ3orc3ZCcnhUM1BnblJWQ3BTWFpkTk5wejNBZ0JL?=
 =?utf-8?B?aG5wbDNCZlZFMThIMlVWelpQMUpxVVo4VnZJT1N2aE80clpGeHlHTlU0eWtm?=
 =?utf-8?B?a2NLVXR6bzlJV0RMendWcGhCQnc4ejZnNXF0eVlYNFc4RFl1T1NGUllROExh?=
 =?utf-8?B?UVJ1RlJMV1o0elpFT2xwTjlKYlREbzVrMVdWZ2l6SnlMYnhuc1BITW5jaWZG?=
 =?utf-8?Q?NxlXPIXS1/SgWYl7ylcpwBM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bda3b448-486c-4e69-3074-08dbf6f61712
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 07:28:21.5831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /p9W5ThCYBhQwzzg7yKvSdvQLKYe004pIvTDUdBSfycN0jDOMMTFDn20SflAr4G9th9lO1jzVvDTstm7tUl5p3DipPoYQH/tSaKEOSJpng8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6759
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under
 tile
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/7/2023 12:08 PM, Sundaresan, Sujaritha wrote:
>
> On 12/7/2023 11:36 AM, Riana Tauro wrote:
>>
>>
>> On 12/7/2023 10:51 AM, Sundaresan, Sujaritha wrote:
>>>
>>> On 12/7/2023 10:42 AM, Upadhyay, Tejas wrote:
>>>>
>>>>> -----Original Message-----
>>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>>>>> Sundaresan, Sujaritha
>>>>> Sent: Wednesday, December 6, 2023 5:44 PM
>>>>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>>>>> xe@lists.freedesktop.org
>>>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>>>> Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory 
>>>>> directory under
>>>>> tile
>>>>>
>>>>>
>>>>> On 12/6/2023 5:38 PM, Sundaresan, Sujaritha wrote:
>>>>>> On 12/6/2023 5:23 PM, Gupta, Anshuman wrote:
>>>>>>>> -----Original Message-----
>>>>>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On 
>>>>>>>> Behalf Of
>>>>>>>> Sujaritha Sundaresan
>>>>>>>> Sent: Wednesday, December 6, 2023 10:18 AM
>>>>>>>> To: intel-xe@lists.freedesktop.org
>>>>>>>> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>; Vivi,
>>>>>>>> Rodrigo <rodrigo.vivi@intel.com>
>>>>>>>> Subject: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory
>>>>>>>> under tile
>>>>>>>>
>>>>>>>> Add a new memory directory under /device/tile<n> and move
>>>>>>>> physical_vram_size attribute to the new directory.
>>>>>>>>
>>>>>>>> New hierarchy:
>>>>>>>>
>>>>>>>> /device/tile<n>/memory/physical_vram_size_bytes
>>>>>>>>
>>>>>>>> v2: Fix heading typo (Riana)
>>>>>>>>       Fix cleanup error on unload/reload cycle
>>>>>>>>
>>>>>>>> Signed-off-by: Sujaritha Sundaresan 
>>>>>>>> <sujaritha.sundaresan@intel.com>
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/xe/xe_tile_sysfs.c | 15 ++++++++++++---
>>>>>>>>    1 file changed, 12 insertions(+), 3 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>> index 16376607c68f..e8ce4d9270e6 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>> @@ -24,7 +24,8 @@ static ssize_t
>>>>>>>>    physical_vram_size_bytes_show(struct device *kdev, struct
>>>>>>>> device_attribute *attr,
>>>>>>>>                      char *buf)
>>>>>>>>    {
>>>>>>>> -    struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>>>>>>>> +    struct kobject *kobj = &kdev->kobj;
>>>>>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>>>>>>
>>>>>>>>        return sysfs_emit(buf, "%llu\n",
>>>>>>>> tile->mem.vram.actual_physical_size);
>>>>>>>>    }
>>>>>>>> @@ -38,7 +39,7 @@ static void tile_sysfs_fini(struct drm_device
>>>>>>>> *drm, void
>>>>>>>> *arg)  {
>>>>>>>>        struct xe_tile *tile = arg;
>>>>>>>>
>>>>>>>> -    kobject_put(tile->sysfs);
>>>>>>>> +    kobject_del(tile->sysfs);
>>>>>>> Why kobekct_del instead of kobject_put?
>>>>>>> Thanks,
>>>>>>> Anshuman Gupta.
>>>>>> Hi Anshuman,
>>>>>>
>>>>>> Basically when sanity checking, after reload we see that we are not
>>>>>> doing a proper cleanup.
>>>>>>
>>>>>> kobject_put will only decrement the ref count and possibly free the
>>>>>> kobject.
>>>>>>
>>>>>> But that is not happening in this case. There is a duplicate 
>>>>>> remaining
>>>>>> of the tile directory.
>>>>>>
>>>>>> This required a clean unregister of the parent from sysfs hence the
>>>>>> use of kobject_del.
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Suja
>>>>> As a continuation of the above response;
>>>>>
>>>>> I can probably add a kobject_put call as well to ensure that we 
>>>>> are cleaning
>>>>> up the memory side of
>>>>>
>>>>> things as well. Will add.
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Suja
>>>>>
>>>>>>>>    }
>>>>>>>>
>>>>>>>>    void xe_tile_sysfs_init(struct xe_tile *tile) @@ -46,6 +47,7 @@
>>>>>>>> void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>>>        struct xe_device *xe = tile_to_xe(tile);
>>>>>>>>        struct device *dev = xe->drm.dev;
>>>>>>>>        struct kobj_tile *kt;
>>>>>>>> +    struct kobject *kobj;
>>>>>>>>        int err;
>>>>>>>>
>>>>>>>>        kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -64,8 +66,15 
>>>>>>>> @@ void
>>>>>>>> xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>>>
>>>>>>>>        tile->sysfs = &kt->base;
>>>>>>>>
>>>>>>>> +    kobj = kobject_create_and_add("memory", tile->sysfs);
>>>>>>>> +    if (!kobj) {
>>>>>>>> +        kobject_put(kobj);
>>>> Do you mean to put kobject_put(tile->sysfs) instead of 
>>>> kobject_put(kobj) ? as there was no Kobj created by the time you 
>>>> reached here!
>>>>
>>>> Tejas
>>>
>>> Yup this should be fixed.
>> Hi Suja
>>
>> Removing tile won't be right, as there are other directories (gt#) 
>> dependent on it. Simple return should be good with a warn?
>>
>> Thanks
>> Riana
> Sure. We can probably have the original cleanup in fini.
>>>
>>> Thanks.
>>>
>>> Suja
>>>
>>>>
>>>>>>>> + drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
>>>>>>>> ENOMEM);
>>>>>>>> +        return;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>>        if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>>>>>>> -        sysfs_create_file(tile->sysfs, physical_memsize_attr))
>>>>>>>> +        sysfs_create_file(kobj, physical_memsize_attr))
>>>>>>>>            drm_warn(&xe->drm,
>>>>>>>>                 "Sysfs creation to read addr_range per tile
>>>>>>>> failed\n");
>>>>>>>>
>>>>>>>> -- 
>>>>>>>> 2.25.1

Hi all,

So after all of this discussion, here's the final results after testing 
the cleanup.

Regardless of anything we do in the init function, it looks like without 
having the

two-step kobject_del and kobject_put cleanup in the sysfs_fini function 
we will

see an error on reload with the tile directory not being fully cleaned 
up and reporting

duplicate creation.

The solution seems to be just to add a kobject_del before kobject_put in 
the fini

function.

I am only having warnings and simple returns on the init side.

If there can be a consensus about this from the reviewers, I can float 
the next version

accordingly.

Thanks,

Suja

