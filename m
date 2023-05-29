Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5450CC77B7A
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 11:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279D410E0A9;
	Mon, 29 May 2023 11:30:19 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C6910E27B
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 11:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685359816; x=1716895816;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WX6Flrj+7DIC2dOquyettSopPg9F1ft7cjYJWT5m+BE=;
 b=HvPB0/Iz3BovaCSGsDJzK3YJHPJY7E0qaKETkyaKwpZDvskM4kZOAQ54
 6MRgdG1DqUx9EdCoXMj2EQ+OQitbffGeHPz8ga8snlh9jW7XWEQ5Wg67N
 C6DUBUxOoQJjIqUYC9rDAPZLt7NvhucSPjqOi9TmXuwXw3KpMw2VrITQ2
 fAR75O5Pl82ZovgRnfutzDV/j1AUQVYah36d+NttfYcI9L16ijyE4B6T5
 JLAwwJPbtxtyfV9Xe5rfbfPMhL0MckXTyS8DKA0Zv8QPfvJFdjj+tlCif
 +NjsLviEwqki/Dxi9oCBwUdEz4B1uYBcAnny62RSS45GMoslRkQvp4dCo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="334310017"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="334310017"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 04:30:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="830365609"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="830365609"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 29 May 2023 04:30:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 04:30:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 04:30:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 04:30:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 04:30:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dx12iLepCIaCaz+hpcopxui9N/9Mhzs34IheUvjNwyNLn1H1JIJUe2IDJlWzgd3SmI6QZ7sjSlW1KZ471F5Lc72+OSmH8AMrPhTHllIXcEMtyGk4Pn6fsOczI8cddYShBmg6BNbmsMUGFIgzS39FICqx5q/OABM3h4+7+i6s0Q1yUtqcuX0IcIiLX6faI+NvAWlY3pjo0qqU6TtSIhpO9c0bIALseAA2U9ykeeZqJhEb/LQtE7RCMvNwzmArk/CHxlIKlTqc8IjxPTHc6IrGXB22WovpXesIywkUn4pGqRtp33jL6P5x0zryoWcEbwnlhmCsQr5xtjaGtpBY9U1CQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnmTPT/h47ys+KiHpWc+nSBMH2NO6qyU7K6Qr/LfO3o=;
 b=ibGjLQjuSBhvfuxtuGK1Qes7tz7DzMnxk4d2Z4oUthDRrY9ACiYggDU9ruFyemjPa3zKEpgDqXm/ENQQfeS/rJxIu8YaCIJJLUx4RiFA0g/KtegxSt3o01ubTBX1DC1bTw4XxJTy97vp7R8VhSmndYEk31ZxQdpUuY3/AnXP9Qv6s7MBui9AAoM9z0Ln62Nq/b0IHTu7gvOsWXFUIODvU2ROZkfFkF7t7uhHUOHSuoMoCfxa2KoZ2LQWJCA1pXNgyW6K8dmzdw7xNFFTLGzFwHHKkzox4v6bG/hD08RZHt8FLJFG/hSASP2VHrgxPWK+Swf7t2ndWaWXg0BJWXsfyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ2PR11MB8402.namprd11.prod.outlook.com (2603:10b6:a03:545::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Mon, 29 May
 2023 11:30:12 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::83ef:7f2a:478f:b807]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::83ef:7f2a:478f:b807%5]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 11:30:11 +0000
Message-ID: <e7a781ec-5f4c-2029-10bc-698056cb37bd@intel.com>
Date: Mon, 29 May 2023 17:00:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-US
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230529092703.1451203-1-sujaritha.sundaresan@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230529092703.1451203-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::11) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ2PR11MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f805a1-4863-4cae-050f-08db60381027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S0wPKcz9O7HmUuEkwQ7GzDuYvcYjvd5HDbA+KE6g/NEIK71HKXbgxI/366A9wLw9QWLysn5wY1CxbsV3FaW+kGJrhNaqOLfl4JZiQ+tx+Emvir1rQ0LHJij8wG4DneuwyEq+eIBCfKUHlVO2FEa798LSZ0m1DeNb7dwcezxJLCQY1FyKmfMGgF7qS7zUzww6Q6VFIB9oo6WqS9tyAspUhcVhziodjs3X/ijf6fR8Dl1yZektfAu2OpnMF0qEoHqGo5QpDqSKQVHfdLXwMWtW2SFVGxJMC/7670ABrAX7/gzeiPZWOKF3Z8ZMZZtlV8yrIf+ElPfBiYZpAhS7UVsMP8qd/9A0ymZbHHMm+qrGppcYrs0N229CiQBbUVr01XmCtJs2+1wTb31jIF1516bnOreLQ/0anuYdcAS2VB+HrCTwIJmSxBvj3OnoqutxQCV5F0kAG9xoZCsmobjAo6yBljZmi311rC1yi0d/F0c+dwLzaBHk69C7fJu2Wli7jyFoO3kYU50duV2Ky59PGC0SvJxX7XlM1b4TP8Z0L7nhqQFJJq1QG0Kmu31NF62YiJVF0eV18c9pyluM84QzDSb+TWYhfrEkqbGoz+uT2rH3cdDGDLhU+FTPiYQZeXVpgCCamPbjztxGnHc5v0dHIlKUxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(478600001)(8936002)(8676002)(44832011)(5660300002)(36756003)(2906002)(86362001)(31696002)(66476007)(66556008)(66946007)(82960400001)(316002)(38100700002)(41300700001)(186003)(53546011)(6506007)(6512007)(26005)(6486002)(6666004)(83380400001)(31686004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3BkbzN6ZndKQVVCdUZIN2JLZEZQSEQrajBKcVIwRzZiQktrNGUzSmlsUDAv?=
 =?utf-8?B?SHYyZEUxa25xNkQvdlhwbFAwQlJ6RW81OHE0Z3p4b0V3eHRIKzN2V1NyZ0gv?=
 =?utf-8?B?RS9pZXQwMlZtV1pXYWwweTkrb3BrWG1wZVlMRnlCcEJCVkhDdTVYWmU5OGMz?=
 =?utf-8?B?bytzM05ER0IzcnNnb0Mwd2o0L3VER2pQRTBkbVJRWk1EYXlaTHRkUE5RNWJL?=
 =?utf-8?B?dHlIZk9GQ2NEdnN1Z3BxbzJrTmo4ejhpbm5ES094ZVhTRm9xZWlFUnRMTUJy?=
 =?utf-8?B?d0tvT3V6bEJDcS8wRml2UHExRjE1L1B6QUZ3NHh2MGpZckUwY1RDNnhLZTU5?=
 =?utf-8?B?RlE0emZRMW5DRGNyQUNpbU1uRlRpNEdxNjZlYURJUksrQ2kyalVKdkw4SDVT?=
 =?utf-8?B?R2ZySUZaY01Wak9hZmVYbjdLYms4TjhIUzNQWFZ0bkJIaDYzMXF2ZVZuSnFr?=
 =?utf-8?B?WWx5aE9qN1N2ekZLK2VjM1VsNWR4Yk80L3R1azZjcDVXVTNoYWp4UTk5a3dt?=
 =?utf-8?B?NWpveURMT3IrQjZxaHNCcXFwbEhHV3VoOGFBODU2RDBPMlBCNWZubDlNdThL?=
 =?utf-8?B?NXp4aTA2eUI5VmErZmEzZngvZTI4Sk83VHBuVzMrN3pKcllobktqL3h0M2Fq?=
 =?utf-8?B?REFucTRzL0VHNDc5dXRDalNyb2lUQ1ovcnQ4VlZMZS9mdHRBcldFY3JmWVg3?=
 =?utf-8?B?REVIZ0w5YzJkY0ZoK2RjdThYRTVzdEJwS25qNHN4V3FnOWRpRVlQRmRzcnV2?=
 =?utf-8?B?TFRpYlNqZXFCTUFMT1Fjd3dkL3oraElST1pkMDVpTnpQalBlTno0U2VFRTRm?=
 =?utf-8?B?am14dkhoaTVJQmMrWThIQ2M1SCtVZTQvSVdZZVliZytTZTlGWVpGeFVGeXYz?=
 =?utf-8?B?UkV0anpWelZuQmg4Nng2cHFiNDJwVjBldGhvbUw2czRZbkluVlZyQXg0aktJ?=
 =?utf-8?B?SUowcDNoeC9UWjhTQk12TWRzZ1hRTys5eFQ0Q1dqeThwaSs3dno2Nk5CeDY1?=
 =?utf-8?B?WXNOY0E3NUFHQlpsQ1FvWmkwNlEzblNyTlcwcWVOMFg1TlVTZzBvUXQvVFhp?=
 =?utf-8?B?VFFrdmFtTnUzNXhQQUUrV1hiZ094KzZrMDZVUUsvZitlcUZ6MTNvaGh4TXl5?=
 =?utf-8?B?bHVBd1V0YVdRUUhueHZ1MVg5TXduVE1nSTRtQVZ3MTBEdjZMR0hObGV1ZDJV?=
 =?utf-8?B?NWR6Rlh0OCt1a1JDdXRKYlJrUUFpSHgzbUNmMWdoaEY5Y0llaTJYM3AvWmEw?=
 =?utf-8?B?VFR4LzVDRXZ3R3R4YkY5TDV1Y040RTFrTlRBelRjcVNFZDV2aWVlV2NHYWlX?=
 =?utf-8?B?MjRaL1pEL21Dak1DaEZUb04yWXBnWEtoUVZiQ29DOGNDSHlOL0VpMVVhRlNh?=
 =?utf-8?B?SFM1MUFYUllVdDFaM1V4MGVKSHd5WkRMbXAzMTNlZ21tTng1ZFhDM2xKSXcy?=
 =?utf-8?B?M1JtTXhQMHFwckU5VlY4Tnp5SW9FS0NTYkhJNEV5aHU5MnUzaEJmSDRFalgr?=
 =?utf-8?B?dXJXUmg3dlBXelNVajI5NkZZOWJnY2tvclpXdFNaQTVLOFB2VGlXZ2tka29D?=
 =?utf-8?B?c1haZGNmVThpM1V6NHhKbzRKd1lNbHhDTWRCY2dnWVhxZFE2NUZPR083RWpH?=
 =?utf-8?B?SlRtYjFTRFY4QXJkYkp2Si8vVUxUVDg4RXAwTG4velZjeG84TGJ0L3pjM08y?=
 =?utf-8?B?OTJYK0dqYWNJQ2d3aHRsOEw4OWcrbUxsWlFmV25sT240R1VXSy9zc3ZyN1Nw?=
 =?utf-8?B?Y25zMUdnM3A0Sk5GMzRwQ2R0aDVGRGtZc015NCt0S2lQbGVrU3EyZ2MwSWhI?=
 =?utf-8?B?UWhxdjkxUmdlZHJVR1BpN2xLKy9qYTZqVHQzRHRKaWhUSUo2QlA0cDJaQ1cr?=
 =?utf-8?B?WTdzazVudUF4RXR5SmZZUkZ2YTlWU3RkY0xKeHh2cWw4NlIwdGgwMFdxUS9T?=
 =?utf-8?B?ZnVNbE5CTmtLVDlZSVhoSm14WHRJS1JhTUw1VUZFZ1ZzTWVlb1lBREV4cWZz?=
 =?utf-8?B?WnpJYkh5a3NhNEYvaFVMSERCcDJxUjhzYThjdXVaREFMbU1WVVFlb3Z3dmg5?=
 =?utf-8?B?dnpONlNBVG5KQU5iMFFYKzVZNWUrNTg5QkNnQmJ2UFJlRGY5R1lpcXZMc3J3?=
 =?utf-8?Q?5TNgzjALFXHcmLB/gq7R/a8d4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f805a1-4863-4cae-050f-08db60381027
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 11:30:11.2636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IkVsIYv0tqqEJm14XfsahNdNBRDniktt/ySi4PBN5asI2Bu/FMH/KwNm4pBGLLmPLogAtP58zY4qn8lwe1wYIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8402
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add a sysfs node for requested
 frequency
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

Hi Suja

On 5/29/2023 2:57 PM, Sujaritha Sundaresan wrote:
> Adding freq_pureq as a sysfs node to expose the frequency requested
> by the PUnit.
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e799faa1c6b8..8a1b3bc5d397 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -62,6 +62,7 @@
>    * device/gt#/freq_* *read-only* files:
>    * - freq_act: The actual resolved frequency decided by PCODE.
>    * - freq_cur: The current one requested by GuC PC to the Hardware.
> + * - freq_pureq: The frequency requested by PUnit.
>    * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
>    * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
>    * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
> @@ -425,6 +426,19 @@ static ssize_t freq_cur_show(struct device *dev,
>   }
>   static DEVICE_ATTR_RO(freq_cur);
>   
> +static ssize_t freq_pureq_show(struct device *dev,
> +			        struct device_attribute *attr, char *buf)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 freq;
> +
> +	freq = xe_mmio_read32(gt, RPNSWREQ);
freq_cur also reads the same mmio. REQ_RATIO_MASK is used in freq_cur.
Is there a mask missing here?
> +
> +	return sysfs_emit(buf, "%d\n", decode_freq(freq));
> +}
> +static DEVICE_ATTR_RO(freq_pureq);
Maybe freq_punit_req?

Thanks
Riana
> +
>   static ssize_t freq_rp0_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
> @@ -628,6 +642,7 @@ static DEVICE_ATTR_RO(rc6_residency);
>   static const struct attribute *pc_attrs[] = {
>   	&dev_attr_freq_act.attr,
>   	&dev_attr_freq_cur.attr,
> +	&dev_attr_freq_pureq.attr,
>   	&dev_attr_freq_rp0.attr,
>   	&dev_attr_freq_rpe.attr,
>   	&dev_attr_freq_rpn.attr,
