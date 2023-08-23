Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E72EEE49AB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 06:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99AA10E32B;
	Wed, 23 Aug 2023 06:38:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A09910E2C5
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 06:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692772706; x=1724308706;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=1mca0NP2AFK/XHnpxmKAua4aPU+HOM97N6aU76RJ0xg=;
 b=eLcyTHFjkB3ng18uP6xu4RvVyzoyKlMphW4rgm6Uv2afWfCIADt2PKxJ
 DrP609An5LBLb0WpdegfJfPNoQzlaKdheu48DbsP7MJNtx7Wg7BfrX6by
 W4NUl3y13lr1fiorE6OYPLSMu8KDkIZvoKeDddpU4rulk8sqs97sjOp2U
 TtP2CC9X7kPRJG4ZMN/bYxiNX98xLCQZbrysyI4V4wbcBCu+lLOZcMuM4
 0k6AcB6w9ZLuWC7+mw2ogcCP++wjT/HkayP73ERJwXhjgto5AqvrzvXKp
 cf4LzK8xZHesuU35xEAqAdODMVwAjg5rOqyu0novIv4HePvpCwiL9MBOH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372971899"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="372971899"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 23:37:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="730095669"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="730095669"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 22 Aug 2023 23:37:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 23:37:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 23:37:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 23:37:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOtuXqhadtn7KlUT+74Xd1rV8DSBTjiUJOspaHFuvFQoPDsoEdeXXpQO1qOL5cq/VN8xO2AgKHrqavVRUsXjW9bZsC7ecg9xLju4FuGopAlDTDXK4JA6q+vOlJV1AA2bErJqYo88k8FkCoJugE09LWETFdBc/tgMXkQokZH8uxZMCn9Olg6JiqPrY/6zK3iO2tt0MJb91NynP3lOnI7alMaTBswiXczQG6E+jlw6O7HIONqa3Zk2pEqGzOAaMdPrCFo8f1wi4etWJ8S2/ViEQKLhLXc6xNpNakFw/RnrGr1I//FtosuAnf0riA9Cv3o2r65J2s7TdBx9feRkKRqHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9FYVl4sSAGlkf0wGu0mV+vTR53QnfytjuKLPfU6pZM=;
 b=TlYWRwqrVrbXDjBrmE7zzmUVl+8a+nf7AAni2lvRHd30jtoYEPUbHZeGcddyXdl+ThxSVOLciv9HSTxP6cWNS1zN3EcVRcpibInVx15oDcb6V74wTrNSVGFTB5C/3NTRbrqT5sFR466GDlMpbTPn2imLv9+anzxOXOmUtSoXljNRsvML4vUltxvbRHJp5QaLh2p8Q6/2Afe7DCauuRMWjaDqn7FYk0DlfWvRKKD48W2Z2HXhBXZNB8DaGxXWMGEXaZVitX39q27tgXVuzi/o35uU8BxjLhgDu6jS+C66mp9cSQRO76WEdCYuOVTKe6oKl6quO1wp1Fsphb5nI/C5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH0PR11MB5580.namprd11.prod.outlook.com (2603:10b6:510:e5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 06:37:52 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 06:37:52 +0000
Date: Wed, 23 Aug 2023 12:07:41 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <ZOWpNQhjHinmzzk9@bvivekan-mobl>
References: <20230823050955.1226024-1-riana.tauro@intel.com>
 <20230823050955.1226024-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230823050955.1226024-3-riana.tauro@intel.com>
X-ClientProxiedBy: PN3PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::13) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH0PR11MB5580:EE_
X-MS-Office365-Filtering-Correlation-Id: 4112404f-eba5-4620-83ee-08dba3a3799e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3tXAdinEbJz3hXz/q/3tkVa/CJ+PA5DDbYueqYkZ1eUzJM5YFZJGBBbGoVWbYf0/1y9BJM2ViAkAlOX+nZf9drvVyehwL//je1T2jaKE4pLzlzHVrlFhuAOGbZ8EQrXuZr22rmEsyjohjRwW+2J1lTdtDrpfBP5FGQHPaKdEsCAuFtEvtD1fMrDA85cT8wnfVDGGD+G3cTGUzQ1W9BrUmAEA2nB9PQCDXDY1YkY5BPO/1fwG1HJT3NrWMmkXQI/EpgW48Q+EH7VSUSLeaEqmUeAqMrockzMYVxXTooHCf3KSrk2HCDb8+mDVWVrjxEfxUMNPwtHXlYPnmzjcLwBngzqnCCyaepwllgka9NFYd48ZwEOZtL3YXZRXf3F9uDJJ0Uxq/b5odfId+B5X8H7qSlXaln7r4Tg46ZWL/7Q1GZykKOrbRRH7PRY73VNKRAJQypPpZ8r8WEUYOKvEQ0NitmxvuyMl3Qqqq6Qvc1A10LU4AjS8fsNRHP+rxDn4YcnD/AKVlri5dYIMWpDr0ZOXfcFGJQzL7n2CNVDIiT3zwPezBXLrG2dX36nWuVlg+YCGuQ7M2ep7f+zRyTlvPUPdi8UQbfP1H7yjtW4QpLqSH8o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(366004)(39860400002)(346002)(396003)(1800799009)(186009)(451199024)(83380400001)(2906002)(82960400001)(38100700002)(86362001)(33716001)(41300700001)(6512007)(9686003)(66946007)(66556008)(66476007)(6506007)(6486002)(316002)(53546011)(8676002)(8936002)(478600001)(6666004)(26005)(5660300002)(44832011)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXhZSkFIVkZWcXREUzBib0FBUjlyMCtaZURXd0syNTJMM0hncGZyNCtBZUI2?=
 =?utf-8?B?b0VzZVB4aHM1YWlEWU1vZFRuVEV3ZU5lK1VTRDNRRnJNNGhXSVE1MEwyYzhy?=
 =?utf-8?B?WGxQV0hGNm1lVXVEWU96YThwZ2crOUtQSTJVV2EzenRKblo3cG5oRmUvOUIw?=
 =?utf-8?B?WTRNSTVJN2dBbktuT1ZZak9PT3gwaUc0RWlNbVBYTkJ0NEhTTTZjcnVvc2J2?=
 =?utf-8?B?aXcvYjNSOHdzVXFlRkx0NEhOWCt3QldvSlM0NzlxbmFPOUd0Wlo0UXI1UnZT?=
 =?utf-8?B?TjVZdmJUZXN1b21jSFF3cG4zOFlWeGxxODdQM1pUZEVZWVF0d2t2Q3c5elBQ?=
 =?utf-8?B?UjE1OFlkNFllMTU5WkR0YnV0c1dzWmQzY2pWOEZpcGVGYWNFNWppUHhiOHlm?=
 =?utf-8?B?WnByZzRGcW9odERZWEo0TTZMUy8xU2FMQml3QVZzUFU2SW9Md3dBQjVVeGVI?=
 =?utf-8?B?WUV1NVUxdmw5aW5DUi9VY3QvSmp4TEg0WkFzQ3Y0K245WEU1YWNBMXZqK1Rh?=
 =?utf-8?B?TGlseGJhSnhoRERzZ1JGRG5oYkp0L29XZG0vTmlpdjZqbCtTY1VGWjlqNTY4?=
 =?utf-8?B?NkZIYUZpdncrU1B2MFkzdTBVOEQzQVJUM2NFcjcvbGRTWkV5TGVoQjRwRytF?=
 =?utf-8?B?Y0tIdGNDYk10ajl4ME5SRWpreVpMN04rWEdEcHZtS0UwcVlhYU1YNDhab3pn?=
 =?utf-8?B?RlBsVkgrTERDSWZValZvcVZXY1BWOWh6RG9PaCs2N0xmSUQ0VEJzYnpza1FJ?=
 =?utf-8?B?T082ejRwaFVOUlBhRDY0VEFTSUJpWmtPNkljMngzRWZBdWtVK2dqdmxvMFpU?=
 =?utf-8?B?dzZRQi9HU0FHdE5ORzFXRmMvZWxkLytyaUFhNkRuOVdVbGR0M3JIWDNvWjdS?=
 =?utf-8?B?Q2dUQkl3WXkzWlhpZ1B3MnAvQTFxQjh4Zlp3Sk00WENCL1J1dkZzeUJ5YzAw?=
 =?utf-8?B?RERxZy9LZFBwUzRqanE3M1RxS0YxdG1DeGlralB0clFDQTRoY0w2OGo0Vk15?=
 =?utf-8?B?RXVPVUpKOWllZU5vdkhDQlBleStUMDNiTkN2VWo2KzhWRGZVQXVoamFJR0Zu?=
 =?utf-8?B?Q244Q2F5TS9xSnlDRUoxMTZKcGFCNTZCL0VZeFBKNW9hRVZ6VE1mV2lleEVG?=
 =?utf-8?B?MFQ4VlRTVVM2ZTFXMjBWcGUrbnJTZU0rd2k0QVU0ZVczL0I3UGxlM2VjZmYr?=
 =?utf-8?B?MkFlVmE3aVkrMGNiR2RSeTN0c25BbUJocDBCZFpOSzVFK3ZNQjNXNGQwclpv?=
 =?utf-8?B?akFDNXZyQmxlWGFWL082WVhtRllCTFZ6NmE5azRlaUdzTSs5ZDYrWTlzY0E2?=
 =?utf-8?B?MmRPUzFnd2dvZGtPRUdsUTd2bXRvSURlN0I0ZWdkcm1HNVl3bjNGaitMRHor?=
 =?utf-8?B?OS8rZWJLbGJ1aUdNTnFyQXVCaTdxWUw0WnZSZmtkUStKcCtDY1pReXpQMzNa?=
 =?utf-8?B?TVdvUzNqeXpKWGk3RHJNMGxkR0hqZHRqdlNTTUpLVE11QVl4dGVmVGt5WW9J?=
 =?utf-8?B?N3FPMGNFT2g5bFU1U29Rb2lETjRyWGY3K0RFNWdCa2VuQkdwVUNXeTNYekJZ?=
 =?utf-8?B?dm1OaHpSOG85RlJtUXErOEVwYjJLUnIzQlNySlpYZnNEakh4eGdsZGZOa21y?=
 =?utf-8?B?bEh3RnJHOUduQzZyZW8zY1MwOU9LK1lMZ1BkRWN0dXdyRlU3Y2hSQ3FlZnI0?=
 =?utf-8?B?SHZ5eTN4VGhwYlJYYXNMbldORHV0Y1VmVjJ1Mk5UemUwNVVsaUF0bHFHb2Zq?=
 =?utf-8?B?Y2xWbkZjd1NpWGc5Vm42R0xQeXlXNG9CQ1gxd1VwL0djcG5TR1Mwd3hVY2ds?=
 =?utf-8?B?YWJWRHkyNVFDWEo2dWdxRFFYdEdFbklRdTd6Z080Z3hMeW9LWHVxL0pReGVu?=
 =?utf-8?B?M044Nk11RkZTM2xKVVVVU0NTem8wRU56QmRGRGVNV0JQZ0NPQ3NwOGJpV2N1?=
 =?utf-8?B?TFN2TG42V0JLNjE1NDFUZy9vRldQUzFYK3Z5NXNEZ0VvTjlJZm5yYWV6RFho?=
 =?utf-8?B?bUVjazNXaVRoaXg5R1R3R0JGbDVFbXRuOVczYkJNQkkwVVFLUjlHNEU2Nitp?=
 =?utf-8?B?UW0zTjFabDlPMDhueTdaZ3lFYlkyRGxVRDZjRElKWjR3V0MyTXphTkdXS2lE?=
 =?utf-8?B?dnlIaUhHWE9zNXJ6Q2VWVUdFMmQyWTdxMXU2V2pQNDloQ08zUlhEVHVYSWEz?=
 =?utf-8?Q?3WrIhYwv4P3Q4Edt8VkSnLY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4112404f-eba5-4620-83ee-08dba3a3799e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 06:37:52.2173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jixf3SK5BVwLge6FsHWUBrv2qNnxKwc2LknSHSJXC4G/sIg/DTjkgr6BYmqoELzCrCLnoXUWM9nyAeHw27hBnQzIvuBsVzaqieBFzNiUoyDCL0oCawABPWo803bKU7Kp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5580
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] RFC drm/xe: Disable GuC CT communication
 for D3Hot Transition
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

On 23.08.2023 10:39, Riana Tauro wrote:
> During Runtime suspend, GuC is reset for both D0->D3hot/D3Cold
> transistions. It is not necessary for GuC to reset for D0 -> D3hot,
> only enable/disable ctb communication.
> 
> Add a function that enables/disables CT communication when d3cold
> is not allowed.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 56 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h |  2 ++
>  drivers/gpu/drm/xe/xe_pm.c | 10 +++++--
>  drivers/gpu/drm/xe/xe_uc.c | 18 ++++++++++++
>  drivers/gpu/drm/xe/xe_uc.h |  2 ++
>  5 files changed, 85 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 13320af4ddd3..0d52621ce64d 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -676,6 +676,62 @@ int xe_gt_resume(struct xe_gt *gt)
>  	return err;
>  }
>  
> +int xe_gt_runtime_suspend(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	if (xe->d3cold.allowed)
> +		return xe_gt_suspend(gt);
> +
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		return err;
> +
> +	err = xe_uc_disable_communication(&gt->uc);
> +	if (err)
> +		goto err_force_wake;
> +
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +	xe_gt_info(gt, "suspended\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
> +
> +	return err;

Can this be simplified to 

=====
	err = xe_uc_disable_communication(&gt->uc);
	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
	if (err)
		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
	else
		xe_gt_info(gt, "suspended\n");

	return err;
====

> +}
> +
> +int xe_gt_runtime_resume(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	if (xe->d3cold.allowed)
> +		return xe_gt_resume(gt);
> +
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		return err;
> +
> +	err = xe_uc_resume(&gt->uc);
> +	if (err)
> +		goto err_force_wake;
> +
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +	xe_gt_info(gt, "resumed\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
> +
> +	return err;

Same comment as above.
> +}
> +
>  struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>  				     enum xe_engine_class class,
>  				     u16 instance, bool logical)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index caded203a8a0..e6574e51004f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -37,6 +37,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>  void xe_gt_suspend_prepare(struct xe_gt *gt);
>  int xe_gt_suspend(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
> +int xe_gt_runtime_suspend(struct xe_gt *gt);
> +int xe_gt_runtime_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 0f06d8304e17..6bc01bb45fc2 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -245,7 +245,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	}
>  
>  	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe_gt_runtime_suspend(gt);
>  		if (err)
>  			goto out;
>  	}
> @@ -294,14 +294,18 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_irq_resume(xe);
>  
> -	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_runtime_resume(gt);
> +		if (err)
> +			goto out;
> +	}
>  
>  	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>  		err = xe_bo_restore_user(xe);
>  		if (err)
>  			goto out;
>  	}
> +
>  out:
>  	lock_map_release(&xe_device_mem_access_lockdep_map);
>  	xe_pm_write_callback_task(xe, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index addd6f2681b9..b5b53c8c3edb 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -216,6 +216,15 @@ static void uc_reset_wait(struct xe_uc *uc)
>  		goto again;
>  }
>  
> +int xe_uc_disable_communication(struct xe_uc *uc)
> +{
> +	/* GuC submission not enabled, nothing to do */
> +	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> +		return 0;
> +
> +	return xe_guc_disable_communication(&uc->guc);
> +}
> +
>  int xe_uc_suspend(struct xe_uc *uc)
>  {
>  	int ret;
> @@ -232,3 +241,12 @@ int xe_uc_suspend(struct xe_uc *uc)
>  
>  	return xe_guc_suspend(&uc->guc);
>  }
> +
> +int xe_uc_resume(struct xe_uc *uc)

why not xe_uc_enable_communication?

Regards,
Bala

> +{
> +	/* GuC submission not enabled, nothing to do */
> +	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> +		return 0;
> +
> +	return xe_guc_enable_communication(&uc->guc);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 42219b361df5..29bd692d8800 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -12,8 +12,10 @@ int xe_uc_init(struct xe_uc *uc);
>  int xe_uc_init_hwconfig(struct xe_uc *uc);
>  int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>  int xe_uc_init_hw(struct xe_uc *uc);
> +int xe_uc_disable_communication(struct xe_uc *uc);
>  void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
> +int xe_uc_resume(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
>  int xe_uc_stop(struct xe_uc *uc);
>  int xe_uc_start(struct xe_uc *uc);
> -- 
> 2.40.0
> 
