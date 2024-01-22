Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B329C47DAF
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 11:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0277210ED83;
	Mon, 22 Jan 2024 11:05:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342AC10ED82
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 11:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705921553; x=1737457553;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=WJnFj2xTSazW28jcPcixy7moC8f7NaRX6DKFtkUn8PI=;
 b=fWEdztldo0sko1On8mjtFYFlZe8gewzl1rDiA+RFMGhF3laGR0S2jyko
 ypMewJOyf+hqe53xAYNOckDya6sXAORo7bsTe6XjLWWUnWXdiGvVBnIV+
 8vkFxSOR9v1YgUDPZTqtxGslLfGi9cw0YSvJPlPUj6kGRBfWm+SDFRPsT
 ZnKBHYavLnsMgtocjAO56zp6hFgfNaiS2/65G/wlHepoVQIwKjZVvxTJb
 N7tNmeYmg/yRhUg/Zuh/m2i3TVCvyadWmjsAdHitwzIRHQk/pluLxh52a
 mnZF6+19n68508VEMh0xkBdRm2Bl2GAtnTKFyDQ6m/cA6pfA8XX2bN0nc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7855520"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208,217";a="7855520"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 03:05:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="958703863"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
 d="scan'208,217";a="958703863"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 03:05:51 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 03:05:51 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 03:05:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 03:05:50 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 03:05:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmYXAbOMJg9nEUl3/lv9dmS2aXpIawi9elEws5QUx+RJomYcoTOW+1XEdqgWEd/Dei4agv8Rx0BFsImKgbXbd8NqyMINpvJUQN9VAhYJLzs2lSWE51Ld+oHM/3OArhp5prfY1ZsGGXMK3ogizVbv57Xzj0+YRvEleg1NDgRX8I86ytL5Xm595PVEopu6TVvEVdJP4Vl0N1qN3IzquWd0sWaMHiNdDYYHoS/tC7xuDPKbdZqEq4CIEWBePjFEpMx3y/Mo5EYVdMlGiIzHLvp4qHK7TcZrjyvEn2C+D8hNMeL+W4mqYd2tBVBEMn4eDGqkbODAyvFAnbPARMkurDUfoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdhnaF+YI2nvoQhALixFNOt9DqktnsqujoQGgCX+unk=;
 b=jS5kJ6sq1QFxfCuKc3jhNO1NWyu3SbrPrYeL2VBEc/P7WRZa6wLFXpiESOftyVxy/eNOVb0kGzqsay5fc/PDRcIanc9O4D6K4cL0ZxlOlN5hYSdk4cLoeFSA+Rb56FCzuiXABFtRoxvdR1UHYdQDI5rWtYR8u3wGTXJAxqX4KaskuU+2SzHOXYRNDXLcnrdDL52gUyK5G8n9s0aGfTjG5t5KLz7jqY+MsrGjNDBdW2p7yM44ZTTxT7GqLk2xi32fHQrOqPsHCx5XDMXDKnaa1UgUc6KlAzQVDqdbde42OQswUQscc4FxFAApuTUVt4HQhO3TrdGARjcA9fSCSsGySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31; Mon, 22 Jan
 2024 11:05:36 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::f3c8:b435:76a3:b957]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::f3c8:b435:76a3:b957%5]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 11:05:36 +0000
Content-Type: multipart/alternative;
 boundary="------------fQd1Mu2e6cntUUaIJNP434TR"
Message-ID: <f20cbdaa-61d7-4174-92ed-c677ba792a73@intel.com>
Date: Mon, 22 Jan 2024 16:35:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/irq: allocate all possible msix interrupts
To: <intel-xe@lists.freedesktop.org>
References: <20240121090214.2072923-1-dliberman@habana.ai>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240121090214.2072923-1-dliberman@habana.ai>
X-ClientProxiedBy: BMXP287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::30) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: c7adc2c9-5831-4449-8e39-08dc1b3a0f8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M5ABpoTOzYwGf7mmHtbr9WUxjYXRr4o+lZqGY9ce4y8sT2eg1B/ygiMcylbp8I9mZWBRUe4ZHpWdoQMxS7TbAy8I9BVvbtAERNk7ZlBq7/3SBiD5cToRvLaI+acVBrFJb1NJKlWy6woirlHIhtLSHS7GMB/6l5RRQt9MuJCKjmPPMu7roUXLt1L1jvEwDldznI11r1wT3mqKB+iS76FhstxBvQUHZX05DNAyCu2fhHyPEOVjXd1fkUDILlEpvGKAsVFsHbiU2+j5TLqIxAFbgJQNWz2J2B5m2po+1T4BSeETf4hT7DUYQkkCzCPCIt3QKwijDGdQIRXjBbSYlf27cFOSXTFJ64KDK/orNXJJiaz60w3FEvXvWKg6Z/5Hm0SW2jEpv/bQn9iqRZAAmRX4o5DaoKP4WBveGTyFMLsNpYoEfbD6ttIRz/ERhcfuMvjBjQYr5D6zgy2EvF44u0wTxWc7LhXpBbhlqnBztueccf8ZhSU7/STaaAxqXsjw8dKLlALcl4tFV7KcvWBVQu18SpOrXrfeKLZpCgEoX0gMK6WNWVwEMMdTlTfaPDwijiVHx0rRgbT5hlarRs9ryPO+TB0GjlyjFuJtZmLA/Qvy8WsazFfWdiqTCVc5tpjEwvTsrRVEEl9FYTx022TUhCpKQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(136003)(346002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6506007)(53546011)(6512007)(33964004)(478600001)(6916009)(66556008)(66476007)(66946007)(8676002)(8936002)(316002)(6486002)(6666004)(26005)(2616005)(83380400001)(2906002)(5660300002)(41300700001)(36756003)(82960400001)(38100700002)(31696002)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjU2TCswanhKSFNQSXNRMG5tZGxoUXNDL3B0emprdmRoS3o5UUU1cjZMaktq?=
 =?utf-8?B?VUFkdkc4T3Z2QXUvYnBJYTJPZ1dLVEwvamo3SWRWcEhvTk5Kc2hibk85dHE1?=
 =?utf-8?B?aHN6citzbDNIWVM1ZjFlNzNWdTJXT0IvUXRNZzA3ajBHaGpWT1JwYm1LLzNM?=
 =?utf-8?B?bHNDUXRrT2dSVldBNXdBbFhhQmFtT1o1VHZJZ1VWMVRoRlZ6VktyYmo5U3Bm?=
 =?utf-8?B?cU1HNXlKVkFJWUJWS3Y5UVFjdkpOVUpTMXR1dE1PdjV1V2VKRWZrb3BuNEJE?=
 =?utf-8?B?bHljLzMzSEphZy9ndElIeURvT2FsS1JJWVJLN1BsQTVJUHdPTVZFb0M3VzBU?=
 =?utf-8?B?WTgweGRsajhTN0FNbjdRYmlkY0lvbzQ3NUVzbFBSeVZZY0VCSWlBdm55N0Va?=
 =?utf-8?B?OE1XbUZFd2NpdytPMW8zRm5ydi9YbkUycTdvNjJyM2ZXNUJVVFIzTmIwYVdM?=
 =?utf-8?B?aUdlbVJ1T3E5QUJJRit6Ni82dzY0cWhsQWxuVEpqTW1CQ0JRRFNQVTFGZGE4?=
 =?utf-8?B?OG50SEt5REZZSTM2OC9Gcjd3aytHSzQ3R0ZFRnFMSkt2a2QvU3VQbVorbHht?=
 =?utf-8?B?N3ZKQmFkNmZQcVhWbS8rNWVPWEswVHJQY2RrSG9xZ3hid1U3am1RNm4vN3dv?=
 =?utf-8?B?bTBybnRCOEZjYjRKN1NLU3BqTFNGZDlDcC81UHlaSXdYWUZndHVFbTZnYm4w?=
 =?utf-8?B?UGw0UmI2WTk2TmhaWlBSR0dBQ0IzdTgwRUNEYlo5U2JkalVzTkNIVWRyOW1R?=
 =?utf-8?B?d0NsdStWazhZRGNUUTZHWlByRzdCNHpmTmR6NFdKTFpxOUdNWllyL24vZWdH?=
 =?utf-8?B?RysxNWlybkQ2ZCtBdlZBYzduWmY4NU00SzdGZ2hzbGwxNm5xc2N5cXBrVDhi?=
 =?utf-8?B?aTJlQ0hNWkNHdGRFSVd5Mng2azdwbjJBRTVrcHY5cmZBRDRnOHFQQ2wvTDQw?=
 =?utf-8?B?QnlYYi85aHpvV2xxMlFZaFZpZGl3T2dQS2lRS2hpS3cxZjNwN3pKWlFubFZj?=
 =?utf-8?B?QTU3Nkd1djluVXVOTGt1aWVjTDUrczc3VXlDQ0tiakNYbUsvTGNxVVlrUm9y?=
 =?utf-8?B?azhyaDlvMFFhRU1qUHMycFZMcVo0WkluSUZxRnRpbjV5a3p5RXE5NFFTcG9D?=
 =?utf-8?B?cWZoZ0tYM2tkYVFvWEhraStwaXQvdk4wNFExUUdvU0N3MVNUNnE3RmE2b0xi?=
 =?utf-8?B?ZElvTTFDeUt4MTFpeGZQNjROZ3I2OW5UaHZMazFrSlZLVTRzQkpmRzZwWFlS?=
 =?utf-8?B?QmtZQ3NuQVdWa2RqaytPVFpKcnpscDlKTkJOcXBXd3lUaGl5UDlwdHFtaW5k?=
 =?utf-8?B?MEJSQWRRaDc5V2l0YlgrTmVKdlFPZTErL0hNZHd6T1hWN0RIRlFuUlA3L2l4?=
 =?utf-8?B?aG42UUFOOHlMT2phbGNFc2UydERpQkoxamVEMXRGZ0dBSytvN2ZteEErdmV3?=
 =?utf-8?B?bXE1MDZhc1ZocVI4T0picDh4RzVDODFJdThBYmNaZ0VUMlg2VXkzU3hyYlcw?=
 =?utf-8?B?bDZ0U1lNZ01xeVJ2ZFVqME1jRFpnNk1WT3RQMkw2MUNBN3pKYVhCcmxOamJV?=
 =?utf-8?B?MVllWnA2b0Rib1MwSkZrN2E0THY3eFhuQ0VEa2dxbGVTMU9uTVNlc3FGWm93?=
 =?utf-8?B?YTNxMDlPRElVWVprR0VaQm14dmRoUlA0YUxJUDFqTTNVWUQ2aVRNNitsNzRC?=
 =?utf-8?B?K05NTHRKTzBidkwzYzV2THZUMXlOZzB6ZTE5YU80ZFlPei9tT0pwWGVVVXNT?=
 =?utf-8?B?dTBTZnkwLzhCOTNYU2pYQ1FBRWIyeW5DeXJDakFDbWtHUkZQYmxMMHphTng1?=
 =?utf-8?B?dUgwZitIdGJMQUhnQUxsQWdFTUpXS05JaFgzVTZXcW0wY0orQ0VOUFg1OGZx?=
 =?utf-8?B?NW5NQVRUSGhFalV6eEV5RWJBVnNsdGU5VkFmQTlDUkZUMjJLMldWbmx4RnJ5?=
 =?utf-8?B?K09ra2FQK1lTeWFzY0NMZC9sUzBMSGRRbmtaSHhuVTg4bEhoRG5VR3lFWEhQ?=
 =?utf-8?B?V1QxSHBDSjVjcFFycVFLd1JjcGh0cWczNVFsaHorSlZoN0FOV0VlOVBPS1Mr?=
 =?utf-8?B?dkY3SFUrSDBlbWVLZWZ5bWJ4Znh1N3VUbG80VUpwb3Q1bDBjL2UzNTVHdmVG?=
 =?utf-8?B?YjQ3NjhpWGU1Sk5CZ1JVVS9jRFZMOXNWWHRUbUZiY0VTbUFWUGdvN1hiSTNl?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7adc2c9-5831-4449-8e39-08dc1b3a0f8e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 11:05:36.5985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LI55+tpRp8mVL9NriYyBVfAgF0ZPuye57iD6L+7UKbyCvwb8kZYkcXHrAucZkHKhJlqaaf8Q6Rtpi5TqSROeZDJfjHI9zam4F0OhtBs6fNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
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

--------------fQd1Mu2e6cntUUaIJNP434TR
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 21-01-2024 14:32, Dani Liberman wrote:
> If platform supports MSIX, driver needs to allocate all possible
> interrupts.
>
> v2:
>    - drop msix_cap and use the api return code instead.
>    - fix commit message.
>
> Cc: Ohad Sharabi<osharabi@habana.ai>
> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
> Signed-off-by: Dani Liberman<dliberman@habana.ai>
> ---
>   drivers/gpu/drm/xe/xe_irq.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 907c8ff0fa21..7a23d25c1062 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -662,7 +662,7 @@ int xe_irq_install(struct xe_device *xe)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   	irq_handler_t irq_handler;
> -	int err, irq;
> +	int err, irq, nvec;
>   
>   	irq_handler = xe_irq_handler(xe);
>   	if (!irq_handler) {
> @@ -672,7 +672,18 @@ int xe_irq_install(struct xe_device *xe)
>   
>   	xe_irq_reset(xe);
>   
> -	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
> +	nvec = pci_msix_vec_count(pdev);
> +	if (nvec <= 0) {
> +		if (nvec == -EINVAL) {
> +			/* MSIX capability is not supported in the device, using MSI */
> +			nvec = 1;
> +		} else {
> +			drm_err(&xe->drm, "MSIX: Failed getting count\n");
> +			return nvec;
> +		}
> +	}
> +
> +	err = pci_alloc_irq_vectors(pdev, nvec, nvec, PCI_IRQ_MSI | PCI_IRQ_MSIX);

Shouldn't the parameter be only PCI_IRQ_MSI in case nvec == EINVAL ?
>   	if (err < 0) {
>   		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
>   		return err;
--------------fQd1Mu2e6cntUUaIJNP434TR
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 21-01-2024 14:32, Dani Liberman
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240121090214.2072923-1-dliberman@habana.ai">
      <pre class="moz-quote-pre" wrap="">If platform supports MSIX, driver needs to allocate all possible
interrupts.

v2:
  - drop msix_cap and use the api return code instead.
  - fix commit message.

Cc: Ohad Sharabi <a class="moz-txt-link-rfc2396E" href="mailto:osharabi@habana.ai">&lt;osharabi@habana.ai&gt;</a>
Cc: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Signed-off-by: Dani Liberman <a class="moz-txt-link-rfc2396E" href="mailto:dliberman@habana.ai">&lt;dliberman@habana.ai&gt;</a>
---
 drivers/gpu/drm/xe/xe_irq.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 907c8ff0fa21..7a23d25c1062 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -662,7 +662,7 @@ int xe_irq_install(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
 	irq_handler_t irq_handler;
-	int err, irq;
+	int err, irq, nvec;
 
 	irq_handler = xe_irq_handler(xe);
 	if (!irq_handler) {
@@ -672,7 +672,18 @@ int xe_irq_install(struct xe_device *xe)
 
 	xe_irq_reset(xe);
 
-	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
+	nvec = pci_msix_vec_count(pdev);
+	if (nvec &lt;= 0) {
+		if (nvec == -EINVAL) {
+			/* MSIX capability is not supported in the device, using MSI */
+			nvec = 1;
+		} else {
+			drm_err(&amp;xe-&gt;drm, &quot;MSIX: Failed getting count\n&quot;);
+			return nvec;
+		}
+	}
+
+	err = pci_alloc_irq_vectors(pdev, nvec, nvec, PCI_IRQ_MSI | PCI_IRQ_MSIX);</pre>
    </blockquote>
    <br>
    Shouldn't the parameter be only <span style="white-space: pre-wrap">PCI_IRQ_MSI </span>
    in case nvec == <span style="white-space: pre-wrap">EINVAL</span>&nbsp;
    ? <br>
    <blockquote type="cite" cite="mid:20240121090214.2072923-1-dliberman@habana.ai">
      <pre class="moz-quote-pre" wrap="">
 	if (err &lt; 0) {
 		drm_err(&amp;xe-&gt;drm, &quot;MSI/MSIX: Failed to enable support %d\n&quot;, err);
 		return err;
</pre>
    </blockquote>
  </body>
</html>

--------------fQd1Mu2e6cntUUaIJNP434TR--
