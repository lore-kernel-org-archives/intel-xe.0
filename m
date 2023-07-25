Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFFEC001DE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 15:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204D510E3DB;
	Tue, 25 Jul 2023 15:26:29 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C4010E3DB
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 15:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690298788; x=1721834788;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NxziiSG/SyEUwkUZHda3zk+kh+jXugnsCV190SmOIyU=;
 b=LoYodd7qBzBCW8r1VOSZUoAXhmB+7TYX66uLR/HI+lVNek8+SQSzlaRF
 d3CH0R7LEt9LqpIPpnU/RXhFcFDmCRdrcNHqH/snBkJFKRYhcbS/tk2Ko
 GcWIvk7VPrKo9gN9kzPq7Ug1EySsmc7ja45d+ukbvjaGSH098EdPO/QuO
 eW/zLAwB5gLlyHq8S/CquFv4hKga6uKXBs63QaMnHbVaSqTnXcVjTOg2H
 Ot6w9P030KEoTJVL9IwNNGYl1bbZ500T3/katyZQXNgob3SCJ9N6Pbq03
 slrRVmyEAiOrjjYLsQEnCZLGGqJid/kL8M3qqZjDX5qrfxs+zqleVwjqq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="434013346"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="434013346"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 08:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="850069809"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="850069809"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 25 Jul 2023 08:26:27 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 08:26:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 08:26:26 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 08:26:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bf3jBAwtU8K0Ir8/Yfx+f/9DYn88gzcNJAZ4VyUF835t0yVRlww3tLdt4riw+Xq/R63CG9EthQ35fINvjc/Trh0V/535MlL3h7ELkMGLJZ8hhmjFkr6G1xwIs5Q0DAN5JYFWlx9nLtkQz7mluqawCnc0T047qTcRDB3vm4EGQPWWQ8Y4vtAyMpL9ARyxwKgWzxI/mDtIkMOddAlLeQg02QDH9ZRFOq+F+O7uCWl+nd4HB9IXcJHImxSSnYu06LCZP2S+gHRwRyBWZCA6qr9jrQR31Rkqgyt/eFyr0OZ5eE1+PppTy9pPw38XB78fd2FVJIIKp9pTA91CK4inbdxZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHs5dGMCiRacdCiHtJAyp4lmUgkKbnAESCn668mluHQ=;
 b=kmZPEc+y8XVWE6C34oZucmQOpgMH30wybGfP7n80bsHZ9UJjncn25TRkonB0TQXVg6C9Teo02MKlIXJDeyEMy7VYWSc+OUkU60X4vgcDmm9b9HUiMOdzk1nt4gOuet4Kko1kKLu6fF02kkL4UitkmQn7fKaFtJ9cwXVBj7yfFsOSjGNBCt1gvE0Q5VeLjeT7DHpHyX9aZ285vOOpGCskV5LAA1/hcGTvNugjuWwXpw18+9tPkJ22IsqITXyj2hbr8UZXELdL8bJX1WdR+6Aesq47DKJ2+ngKz8jmtq1xnCI1iXOxRtfU+pqN/682lQp0lg7GuwhcxaWNQjSUtbxgnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 15:26:25 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::e273:56c0:2fca:f739]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::e273:56c0:2fca:f739%7]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 15:26:25 +0000
Message-ID: <c166a27f-97ff-3838-b610-23e6a07ed029@intel.com>
Date: Tue, 25 Jul 2023 20:56:15 +0530
User-Agent: Mozilla Thunderbird
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230725150951.3757483-1-himal.prasad.ghimiray@intel.com>
 <20230725150951.3757483-4-himal.prasad.ghimiray@intel.com>
 <xiygtjslxuhj6i7af7r6sxty2xalvde6xjo5c3w7eq4es457yh@a4tbc6vs4i4d>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <xiygtjslxuhj6i7af7r6sxty2xalvde6xjo5c3w7eq4es457yh@a4tbc6vs4i4d>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM6PR11MB4545:EE_
X-MS-Office365-Filtering-Correlation-Id: c08259b6-b69d-4f82-759d-08db8d23820f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJvpBTk+wjX9Ss8TOlt0INPmSmnwqf13ON2179Gy7qr/rXtSsqV4o4/G/Dh4DZSvfpk+y7rjVt/Wdlj3wtj0bBi9KDPkOC+uKM48zbKoITeO6n/hoq2gPBKQQHmAq+W7Eu3NMH9jevaBIZh2ZVBcIXDqXFu6JZy+/LMJQZV7jxZz2glWBSs/UNBiX6w99N5zIougq5qtWR0DFXJGQUUD+HIdKV/FqYhsqeiuT95/Hw2S5MnZnX7UPXtxNdbu3/sL/h4P+KXODn6n7dHjXNCDdEq8i10yLjAyrh1yUBl+Qy2cgDnON1f7RGe9Vw1IeQggcoTh6zM1PGfeyvYa8gmAQBztfb48k5leY7qJYmBF37lLE2g1iMPCHmBdWhcguXmXDR/ndXFYJmzkMVMFR+zz02am0aWdWRZew1aCCZg56wRZZFLuTQ4sBwVrrRModam+xjBw4c10K+H/CLG/W9xuY4lqEkpezL6YFqGy+xKMwZsBiLVAb3m60Gl7536P8SGzU6SIy2mlUKuw8VM5SiBnB8G/xix6FfPDjQW6ZCb+MUzDcV0a/xlz1G13jt19XCDLyKgYJlY0CKXCuyQz4AcK8Sk1IrwJD6rCC2QAOfcKEfq2lQLLO4RGu7JR6AWL0lkMzXns9ufglH98t/mq3bYXsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199021)(31686004)(36756003)(31696002)(86362001)(2906002)(83380400001)(186003)(107886003)(53546011)(6506007)(26005)(6666004)(38100700002)(6486002)(6512007)(478600001)(37006003)(4326008)(6636002)(8936002)(316002)(66476007)(66556008)(2616005)(66946007)(8676002)(41300700001)(5660300002)(82960400001)(6862004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0hsRjZreG52MW1MaXVBcVlFSE92S003cFBSNW1jMGZYUklxMDJRNlBjVm9m?=
 =?utf-8?B?SkF1L2E4SjEwL2tTNm5pNG1jajJrVG9wbzZCWGJMdEI4N2FPZlZxaVhmeXAx?=
 =?utf-8?B?L3lKT3YwNlZPelg5eXQrZGlZYVBvb2FzYWVnb2c4MjZuNEg4b0lLTEQ0Zmhm?=
 =?utf-8?B?b29tTStMaFY4ODNwM2RPc1VPai8zZWlUcHpzNWwxaGhJTW1pR2R4bmRCekFC?=
 =?utf-8?B?ZzdTS2M4SkdweXI1US9XMGJQWVNyaG1lWVQzMWNvMm5od0RZcUR2NTJwU0sr?=
 =?utf-8?B?bDlnNS9QeFo1WFAweERRcUd6aVlIREIxNEpqUnJZWWR6dGxVenluR2J1a1RE?=
 =?utf-8?B?d2IwNUhBMzd4MXhkdFR1ZzVPSjZuNHVxT3g4QWVoSlFtWHJETmRSUFRpd0V4?=
 =?utf-8?B?TkZrTXNLM01RWkMrWG5Bbkg3cFVaSVp2bXRHWXNXU3cvOFBYV0F5U0ZZUzJY?=
 =?utf-8?B?YUF1RVdvOHI5ZjFNZzk4YUpBMlRqN3RtSDlRLzR3STVITnE2QVJ5eXc1OHZl?=
 =?utf-8?B?Y2FXTW05OUl4Q1R4d1hhV3BRSW1nQm5lQ3BRZW9WT3doMkFiMnl4NStpTHhN?=
 =?utf-8?B?STNJOUl3UDF2S3pqeUVVR2tyZjNRQkJJeEJNNERCenk4cmU2T1Y1VWlHUnc5?=
 =?utf-8?B?MXYrNVFXMEkySjZnRVh2aFR2YjVORGVUZkYxOTRFZmJBT0FWZ3ZCRnR1TlNq?=
 =?utf-8?B?RUgyTXVqZVlyMHVWOWlLZlhxTXVRS1cyM1lsU0gwd3JiSUpWcGNVZy9hWW5V?=
 =?utf-8?B?ZzdNUllEY2d5YVd4bHZ2RGxwQnZWamo5RlE4Wnc3VW82ZFhYY0ltcE9oR3d0?=
 =?utf-8?B?aWZpajdoYkNhTmFwdGM3QWNZZ0tyOWlWbXczRXBLbFFzWXRXOENacmtRM09W?=
 =?utf-8?B?dlhtdjV5WXEvZE1Dc2Z3Q044MUpyemRranhJSG9wb0prdjVuWGtYSVZaVnFO?=
 =?utf-8?B?bGRqT1J6YmxWUkpoei93MXArM2tqK2NHNmRVTGRMeWhxSG5OSEowYnQ3UVFH?=
 =?utf-8?B?WWlpWDJQSGFVaDJxcnZ6dGN5Vy93U0IxWC84WDA2eU9sRmxjc25JUnlBNmpl?=
 =?utf-8?B?cVRnbVViVm5YUnlqM2V0TVYvRUF1d3lPckVpRS92MmtseTFxaTVYM0xpMGx6?=
 =?utf-8?B?UTF2dk1JSEVDVzhnYTNiQzdYSXcrdi8vUXFnamlJT3B2c2p2OUdxMlJ2Qjdi?=
 =?utf-8?B?UFVqYXFGQit3MlNjS2N2bWdNZW8xLy9LMHVEWXZ1S1Rkd1JrNlpLMlZ4ODNr?=
 =?utf-8?B?TEV3SndHNnE3TWFwY0NuVmJCVDRrcjJhc3hWYVlQaUt4ZnNiMnlndmc3ZU0x?=
 =?utf-8?B?SFRLejdrcEswanFTNi9wWWtZei90cDMvK3ErZDdJQWtNZU94ZUtlbTd3Qmx1?=
 =?utf-8?B?Z2VRckpEN1RaTVZuZStBRnlzMTNPL0ZKMHJIWFdyMnNrc01oVllacFBmYVNi?=
 =?utf-8?B?Q2x5bDJVT1JlbzZuajg4YjNHSXRGRFYzdGpJdng1M3hCN1g3L1RtejhYcVZw?=
 =?utf-8?B?RkRodGxUOTN2TVZKZHljbEgyUTJuQk1wUk83bjhBbFlFa0N6TlNIUDRybjNN?=
 =?utf-8?B?VWtJV3N1dWZkTmFMa3ZTc20yR09BOTRXb0tUYk9obDUvRDIvT1lOUXltSkFO?=
 =?utf-8?B?aEZrcWttT2xSNWxGTVdwNUpvSGMzN2ZXVFRTck1Qd1lTMlZNYkhDVjRIQVEw?=
 =?utf-8?B?RUNEOXdVK0lhTk5XL2dpL2Q3Nmk5Ym9WOWh1VTBiVlgvWnJYZkZyeDVoOEN2?=
 =?utf-8?B?bG0rLzZMZHp0QTAraG9LVUtlNVNmVWRORlpjTXc0WVFwam9kOTlIQ2JvTGtk?=
 =?utf-8?B?a2tXQldVY2tmclZNMFlEYUxHQTNEaHQvVHRWeGR3Ukh3SXFVcDNkTlNEenVy?=
 =?utf-8?B?eE1lSVJ3N3k5UmZVNmthdkdPbXFnRllrVmhwTERkYjBQaDVIUDJGb0xJSWx1?=
 =?utf-8?B?eFpUOFV1c3dSakNnZTJiWVFmM1NNOTlETEZ5ZVVjUGxJazBXWjJVajVuV3lV?=
 =?utf-8?B?SzlJYVo0NnlWTDZBQjFsNlJWbUJMZG5SNzY0MWVicFFGMnUvd3JyOE9Jb3Vl?=
 =?utf-8?B?VTBaa2ZnczRUYnlWU2t2cnpsK2d0MTkwbkNId1BBVDJPSlNEeWxzMHZET3BP?=
 =?utf-8?B?RFN6c09QR0ZpcUk1NmcxTDhCbUJFUEtSNW0vVzFFcDM5ZFBCK0JzeS9XbEUx?=
 =?utf-8?Q?gD1bSXCo3VD/m29l/t7BnR4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c08259b6-b69d-4f82-759d-08db8d23820f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 15:26:25.2223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3CV0y9JFU4HPOaqz02m9WUktCjUa3JFeu6qd2zVXyqjN/MgUEB0KJDuyGcKenUDamDXjVzEpCl3ABMDpAFuoWzy0u3lAdPIX+/YH+tSLWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4545
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v7 3/3] fault-inject: Include linux/types.h
 by default.
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Lucas,

On 25-07-2023 20:50, Lucas De Marchi wrote:
> On Tue, Jul 25, 2023 at 08:39:51PM +0530, Himal Prasad Ghimiray wrote:
>> Functions should_fail_alloc_page, should_failslab, and __should_failslab
>> are declared irrespective of CONFIG_FAULT_INJECTION. These functions use
>> bool and gfp_t types, which are treated as unknown when 
>> CONFIG_FAULT_INJECTION
>> is disabled because the inclusion of linux/types.h is missing.
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> I guess you meant Cc only
>
sorry for the miss. Yes I mean Cc. Will fix in next patch.
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>> include/linux/fault-inject.h | 3 ++-
>
> use ./scripts/get_maintainer.pl. We can't maintain patches outside xe.
> This patch should also be patch 1, otherwise we will break the build in
> previous patches

Sure. Will make required changes.

BR

Himal

>
> Lucas De Marchi
>
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/fault-inject.h b/include/linux/fault-inject.h
>> index 481abf530b3c..f83ab2b6cd08 100644
>> --- a/include/linux/fault-inject.h
>> +++ b/include/linux/fault-inject.h
>> @@ -2,9 +2,10 @@
>> #ifndef _LINUX_FAULT_INJECT_H
>> #define _LINUX_FAULT_INJECT_H
>>
>> +#include <linux/types.h>
>> +
>> #ifdef CONFIG_FAULT_INJECTION
>>
>> -#include <linux/types.h>
>> #include <linux/debugfs.h>
>> #include <linux/configfs.h>
>> #include <linux/ratelimit.h>
>> -- 
>> 2.25.1
>>
