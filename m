Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A624CCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 20:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9C410EA17;
	Thu, 30 Oct 2025 20:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jjx/KYVr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69A810EA17
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 20:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761854762; x=1793390762;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=w2IpweleMAsE4IO1zAIuj+VfqxsSMbUkDcoBRNu7KQ4=;
 b=Jjx/KYVr76sUC3lb8j9lz8b5k2IHKSFc2jfYpsPlZAUtEowcn06M+bzb
 /WAg0kHXveuDhCz3oot0CCBzz/Dlmi0EZP081WmkDIogh+qiLLGNtVCx/
 ApyuiEf/RvVdeqsoMQslQ2ZXIce/L/gzJV7tcPWP2DZJeQPi/YxqBNqQt
 YySORdTMoVEYlPuiiPop4sDGbNr8uxH2JcEjDFvEJPD0fKFYh8wT96Spc
 P2jw3cwkbO5oh5B9gcEE3HVaRjqLXHZGVNP/E/xFwWvhbKzDVS6zScQOQ
 zVEBrpv5ZEhGLfRipFIBCffQjQwUTSvutuR36q8BaFQbiASodUEuz67TG w==;
X-CSE-ConnectionGUID: 4BOun2B7ToiIlhyjxuCFTg==
X-CSE-MsgGUID: 9559k0uATtKhYCpL4v3Edw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="86634914"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="86634914"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:06:01 -0700
X-CSE-ConnectionGUID: K2ZgQSK+SRKM/TYbSunjAQ==
X-CSE-MsgGUID: U0SlujsfQ4CqPUXALafZag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="191200223"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:06:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:06:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:06:00 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:06:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnfZHQRg5sjjACDtQveirBpxYF5PyS1yiATLkPpJK9F3S5l0SLEsiS4hyvlOTqZ/bsUnTtLx/Mc8qy+Xbl37TsO3xGaCPp1WjVQr5F8+bOKLwfknM+WfwmU8rmLz8yMSIpK5pwVhwxx/c6BuI/JN6W4iXR9rLEkKIRTAF4LF4+bzdKUtOkBFnTfVk4mvDhsamCLOYZ61Te0J29ZKe8nb1IHJx/pSfyOamounqJ99Jp4TYCEmpDjcmaPXxqC78dNFSoHMlJAM5RRHrDCyrQszSc7UU5k4bmuL9NWp4sPkPqgIltAIptxsy/EaGI9/FFaDYTEI9HCCEY1BDLIWTRSebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2I+QOCJyfKCTrrprIDfjH5z2Zrr45kVBL5k9X7llYxk=;
 b=idKul48msApv9WznjrqTi349uc0eZUK+2gyP/v24TmpY0UWk8k69QtypnrHCPI+Rp1v3GWWHFPLT+nmGZvjxXCZBkfS/EXRDIqkLGXO8cAN4nIrF/6G1MjninlAS+yAH0RdiqEibb5usD3hamLcMGpTAIv0eLPN5FF+X0q/C/Ija+k4DnZhe270wi4qEFrohCRHvV6CGvXgX2MNjQYG69L8wKoMWc2zeKeOljmD+yFh94Wa9WdqIKO11QJ/t8OJ/Rn3VTqDwHafjvFmxJKcKrBZTx1wtENYTgAVSecPkuUgHcegrj909aogsjxOLpEin74Js8ohr0fa/VrqWFyfHpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5003.namprd11.prod.outlook.com (2603:10b6:806:11e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 20:05:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:05:57 +0000
Date: Thu, 30 Oct 2025 15:05:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Inline gt_reset in the worker
Message-ID: <oufgzkk4znvj7ujhcbkz7kl3hib3bmil5gxbk7sih4wtlydsus@tx6jersuj53s>
References: <20251029-pm-comment-v1-1-fcfa906dca25@intel.com>
 <aQJwO3RMyifEMg12@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQJwO3RMyifEMg12@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:a03:331::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a8206b-864e-4b58-5438-08de17efbd79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gA6hFNOjDw05inDaFVvlYS5V+gOSsBb8U4bpFFnRfhU/AVtevz13qxWYVMH3?=
 =?us-ascii?Q?Ddt8HcdlXJa9j+LP5oAfeg+OwcmTQaGYxq0tcRfDeJvDBm+eVQ9UmqYp4sOX?=
 =?us-ascii?Q?nNVWi6e8n0scStk8m9Jva6wjCPkBw+4XEUmS3J6Hiex1Y9P6+oslVtTABxNS?=
 =?us-ascii?Q?6mI7lRCV2HU405bHnjgzOxUVM6iP7hWLc9lDI3O/oeQKPTxFiNTfaQhI3+ye?=
 =?us-ascii?Q?xtyxiqSRiWLWSCcMrTTMaf2113X0yaf9DmGYWs2YB5EImkBHcaT+CyjTXiUK?=
 =?us-ascii?Q?d2aAveM5s6xX7FLjxNguwREpNfD4SL4t+7rFbs9659HETAtkMBEnNSDqt2to?=
 =?us-ascii?Q?ZwQrPxIbgndnVtvb8OImmbVJhVrXn+g0KxvRWUGkvkH6vJxwnmxVCS3ptzQb?=
 =?us-ascii?Q?7X1euYR8Tz2f4UlC/LrJUEAtQPUXq3EaLDKlQFb5AAvYk3THDtf+ae5v//im?=
 =?us-ascii?Q?/km9gGaQ3Fb63MzgVTm40aYRvGf7YNKqXMLn/BPgmavT0UUXbHrnun7TYX71?=
 =?us-ascii?Q?IY+8A3pbP7zfWBaiUZz7M8TlCgjDkyiJ1XRWXNMqzllu4PbHx35MNuardORH?=
 =?us-ascii?Q?2i892LeQeOGKiWUqk5cIjCUdINdlcu/+qhs5tjdmWadWZEtEcRIzDCRMTPAs?=
 =?us-ascii?Q?JpkvrU9ylmDzvdZncEuswxAMXY+JZLQAMjScORqVy6Cd7rMzMQJ4R8FJ3Gz7?=
 =?us-ascii?Q?iI5+8Z8WJwNMsGsaaQrDX0zt3AlptYoNiOa1rjGKnC22d+68B0CYk/Ez3bD8?=
 =?us-ascii?Q?7pAWQ6PcS97n+x32wXHLuimgOhRzHRRtDYArOBWZh0uE8P8kwFCAG+8GKQeh?=
 =?us-ascii?Q?HwS6uh5nLToqjdFhzb1hgQTwoa5ygFmB84PQ2ig1IUX06zfyirXKZoh5e4Vt?=
 =?us-ascii?Q?iC89eLjmNI9MyepH6V0kxTTZlz7vyiME2LKDHL8BCJl56kQ0utrlSbsjWgKm?=
 =?us-ascii?Q?NU3MUyUxISPZOJ0InryeBV6EjmSgF0rqQtVav9oYXPaUcnVBEYEMnqDtX7Bz?=
 =?us-ascii?Q?nwIUebFnylin13R7tSpWwHmdEzUyRxZzobaCHA/KRjGPzb0fw14mDjvVoDwP?=
 =?us-ascii?Q?bg3yymIMDFXuCx4PYafDUrb7ujwGDayGkwIUdB5Txm5q/aYSDez4pEh9+yRO?=
 =?us-ascii?Q?APq3VTbqEMmhkew4q/Z7YAN2i7sbLk22igYqgSD13wFXAwRK9iUr5IyhJWvY?=
 =?us-ascii?Q?FMPDHgzKswctr1eWFn7DALlr4ogRmGljpgw83rlwrjDAs1mm14U3mYB3gWN9?=
 =?us-ascii?Q?O9qzOCpv7RNsOl5ofXIViQdT/9KWcarGK2IR9P2yxAwB66dJr1fMKlIkIreN?=
 =?us-ascii?Q?Eev2cuQ59lsrzJdMH8XdSLyv8j3QVcEeud011ioSOhc/ZJ+AujxXMh20AEK7?=
 =?us-ascii?Q?mJ0X1cVl8XVQymBZCGWlsHJaq2hjCCFtj8nCp3pcQ9rSOTtdtkUnFVY/Nwa5?=
 =?us-ascii?Q?59j2s24bIKIHroITtsIpcYv0HVbZ2rw6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oo/HJ5uvDbOZHlbt+ovQ5PMaPmwe66RIr0oUTZi7j/FKf2woo1WqsIUG4XuJ?=
 =?us-ascii?Q?s2Q+iRX0qyfpfjQ7QbFB2T5ucBjACIoKVeY1LAmBSUrz2AL74zyPEFqs8seD?=
 =?us-ascii?Q?p36PUThRj8Lps26ufBE7vYG1WWHuB6caSVegr+yrkjvFHyhcI+aOqIlAeAWW?=
 =?us-ascii?Q?oToqWHUvRIbDD80AG2pmfXBWIfUAGSDQhoZTG9FUgpRDYbXaxqTo3zYPTKgR?=
 =?us-ascii?Q?eeQakidA0k752tOK9rtERL7u/Eq0FQlrcwl/QDm52mKVkch1W4pC3MqahqTZ?=
 =?us-ascii?Q?WVb7TuOW4FMqofnEhP9Oasf6a42LA2rF0sUZSf25cYMesImLv90QscdKNL2Y?=
 =?us-ascii?Q?Obsr3qmqNADQn9vSr4YNwVGbbDViue4UnuUJ2vSY+r2IaDMqXivwkBhzUoHc?=
 =?us-ascii?Q?g5SOeZzgTjPpFUaCKAhbh+JBkAIOsYqMfwHE9jCEVM4VJrgb38ou8OXjy4mp?=
 =?us-ascii?Q?PDCVW4bHrwYoff7R+OKIGM0f/fYTDbT/0evFEdEwPdaXi0IJwjurz72RFMfx?=
 =?us-ascii?Q?g1IOPy+ulPTsK4O79EM+1E+wNVpON/+vAZpAjWSqo8TSEx8YYOX0ZNWXfht5?=
 =?us-ascii?Q?r9ABOgl67Jhw9E0wa0UpedIP/5aCzNAsVQyJhe6wJXhGj/PmDhlUN7JuB4mw?=
 =?us-ascii?Q?vNpUkNyNykgqKbs1OfZFsdpl1O+Uo+Nff8VK6rgsdesVvUZ7wb0M2zV+Q57N?=
 =?us-ascii?Q?kqPco/na0/DklijeuGmS33UPmTurkDbYOXFY7OObJj9D8/4ma+CFpiT0AyUk?=
 =?us-ascii?Q?Kfio9tkAtkbXyVbRQaSyHNetRf1I3h/EjHVjwpIpwi4mN1IIJW0eU2KQnjoQ?=
 =?us-ascii?Q?rDUfcAEpIUJFt1mRXj11Qt5i7aJt3W/x8WqMTLn4cwRxs92IBIzRY1GHbTXM?=
 =?us-ascii?Q?pYfKu0qMhblnj9fvM5aGgdtsITsNlJfRwxoRiQQ7E3xjhqRUtcmwXhKt0m5V?=
 =?us-ascii?Q?wBMfnWa8V0nabSmXSF9FI4WE/s21fI7ER17fz1BASPIFLPcF25RRpLXuFKnY?=
 =?us-ascii?Q?isBo6kgbXwZM0mep7IX1m/DyXOQppsh7NrBMweGVOqLuGsRr6oNuI004Wf8X?=
 =?us-ascii?Q?B4uOLWkJ9MPeSZQ56V088YmfLGolgZz/YkKjlaNAsRqL3HZgNinahNFJ3Sv0?=
 =?us-ascii?Q?A1VcoA6kFTGevzmd05CMfVyUQKP9bBIWPXQJ0/phNWtGjG01PpD3YGCqPj1Y?=
 =?us-ascii?Q?6RhtAgH6exWTyvwkhR9tR/ko22fSKNXJEqVhCcYCp4ile42othWK6tOyunMc?=
 =?us-ascii?Q?8YFHiwBmTTKagDQGhujFgShbCYceGVw/srIOQerjHm0OGJgGtubbBuPlGtNv?=
 =?us-ascii?Q?Q/Misgx6KgDvCC3Go+oGkMcumuhJ6gMGN+KFDLseV95wkmbzT9l8hh8RP7xi?=
 =?us-ascii?Q?7Zn0bbbGJll6JTaTTKxmPQ4woScYCzdD8gbnLPHDphKlwbYA/0U99C6RepW4?=
 =?us-ascii?Q?cANdJ9ULR93s+2AUZqDuY4NmIPM9D5DdI+XdvxhkuBGqkcRH96g/idrMrqbF?=
 =?us-ascii?Q?zp/A8+9opbcV1iRnActu28imXOH7YZ7y7M7cygbQRot1zH8r0zH8RtxynPr3?=
 =?us-ascii?Q?RHVv5tZIAg2XhzZNc6AP9dG56DgoQ90txouerCZMW1FYgP/DoLrneRqRiRaY?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a8206b-864e-4b58-5438-08de17efbd79
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:05:57.8943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2aKZvn3MLlbe95lVgAiHxgdkksiWFfjohOrHf0G6KbQNKBnNyi+uWIafAhOP0bmYnbwuEszLFszQnQvIkJIEVo94TzXfQi3Shct7zpnewA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5003
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

On Wed, Oct 29, 2025 at 12:51:23PM -0700, Matthew Brost wrote:
>On Wed, Oct 29, 2025 at 12:24:59PM -0700, Lucas De Marchi wrote:
>> gt_reset() doesn't make sense by itself: it can only be called as part
>> of the worker. Inline it there to avoid it being called from elsewhere
>> and clarify the gt_reset() vs do_gt_reset() paths. Note that the error
>> return from gt_reset() was just being ignored.
>>
>> Also add a comment to the xe_pm_runtime_put() to make sure the
>> get()/put() pair is clear.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt.c | 32 ++++++++------------------------
>>  1 file changed, 8 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 89808b33d0a8b..51d6b4e4e1311 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -813,36 +813,29 @@ static int do_gt_restart(struct xe_gt *gt)
>>  	return 0;
>>  }
>>
>> -static int gt_reset(struct xe_gt *gt)
>> +static void gt_reset_worker(struct work_struct *w)
>>  {
>> +	struct xe_gt *gt = container_of(w, typeof(*gt), reset.worker);
>>  	unsigned int fw_ref;
>>  	int err;
>>
>> -	if (xe_device_wedged(gt_to_xe(gt))) {
>> -		err = -ECANCELED;
>> +	if (xe_device_wedged(gt_to_xe(gt)))
>>  		goto err_pm_put;
>> -	}
>>
>>  	/* We only support GT resets with GuC submission */
>> -	if (!xe_device_uc_enabled(gt_to_xe(gt))) {
>> -		err = -ENODEV;
>> +	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>>  		goto err_pm_put;
>> -	}
>>
>>  	xe_gt_info(gt, "reset started\n");
>>
>> -	if (xe_fault_inject_gt_reset()) {
>> -		err = -ECANCELED;
>> +	if (xe_fault_inject_gt_reset())
>>  		goto err_fail;
>> -	}
>>
>>  	xe_gt_sanitize(gt);
>>
>>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
>> -		err = -ETIMEDOUT;
>> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>>  		goto err_out;
>> -	}
>>
>>  	if (IS_SRIOV_PF(gt_to_xe(gt)))
>>  		xe_gt_sriov_pf_stop_prepare(gt);
>> @@ -864,12 +857,12 @@ static int gt_reset(struct xe_gt *gt)
>>  		goto err_out;
>>
>>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +
>> +	/* Pair with get while enqueueing the work in xe_gt_reset_async() */
>
>Nit, I'd add commit on other side of this (i.e., the get) too.

will do

>
>Feell free to add that when merging. Good cleanup.

I will send a [CI]  patch, because it seems patchwork was dead when I
sent so there's no CI results.

>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>

thanks
Lucas De Marchi

>
>>  	xe_pm_runtime_put(gt_to_xe(gt));
>>
>>  	xe_gt_info(gt, "reset done\n");
>>
>> -	return 0;
>> -
>>  err_out:
>>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>  	XE_WARN_ON(xe_uc_start(&gt->uc));
>> @@ -879,15 +872,6 @@ static int gt_reset(struct xe_gt *gt)
>>  	xe_device_declare_wedged(gt_to_xe(gt));
>>  err_pm_put:
>>  	xe_pm_runtime_put(gt_to_xe(gt));
>> -
>> -	return err;
>> -}
>> -
>> -static void gt_reset_worker(struct work_struct *w)
>> -{
>> -	struct xe_gt *gt = container_of(w, typeof(*gt), reset.worker);
>> -
>> -	gt_reset(gt);
>>  }
>>
>>  void xe_gt_reset_async(struct xe_gt *gt)
>>
>>
>>
