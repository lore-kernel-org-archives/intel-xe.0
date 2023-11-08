Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37984C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 17:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0250510E18C;
	Wed,  8 Nov 2023 17:18:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E58310E7FF
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 17:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699463909; x=1730999909;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Jy3t82ksyuJiDwRbJ62N3SaB6OEKEwf/9JfXHg8Wxkc=;
 b=bM9gOxjhKATixOZVhWbW8/9DMt7F7hiaraBCQmVM0GZxBCuhcmvOV4sj
 GpeEGv6W4FTbqzbkD0npPJ1aWO8FO+75fOFftstIbjFuSV59ddi3nMP6k
 zWF/DNo62u2OixxcoVi4sRvuFbSV0F1F7xwjavmNzM79JR4E/JcMBpRQZ
 G3rFIIpwU6gSSNl3Ql3R3sM765Vk8LoRcpKDildWg6oViETIed8ZdFI7Z
 QHjj6h1BwpUXXkOHSYDg8EbrVFt1uCmo4sCNQ43kvWnmeCOUT6MPyy3p2
 sWWWEH4ncTloh392XC4M6dmeq8bzOwhIMJ6ahS4M49kyUkOLdyToSjzLZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="393725355"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="393725355"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 09:18:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="906849795"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="906849795"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 09:18:26 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 09:18:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 09:18:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 09:18:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 09:18:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkC2Kv2L2cN973fDyqu1iWdzSjm8KXkPTCtyWVTAJblQASs19pRqwPbNpVl1OoUVx6NQNb98JykeDeiG/lRUQcbmi/N7bG2NGmwCDvRyP1cRR7oo9Oq+pxSHHHAEPk/XWwvih3tNFpoIs6YyNzxjP/SLw9MQI1ohwivChlZVYTchMsjPMWG8RCTR7uUv+2a6fj+1lpBA814cMOYYHugYRvOLK841QNPe8kpanQkOKWtaiAVfhO87s150+6AFuhfeTIBIc4pYL562HImg8DMaGw7gOVbu/AbFxGpiWPxzuC46tXiF1/ru1r8NSxxN6eaJgqdajmT/UnHwV7ot41e4Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ny3qaiIq0qL4/hdc7qSIS088L2E9yRZmeHzSqcR/Pyk=;
 b=DHantYurKP6kDfC965QdujifsI2JXLT9LkikBeamzlV0lmkVzBHe+75ayljuPridxvHmq8VoCHQVsbhL+m9UrJaZD46bgkpIJZDqxau9Uguf2J3v+bi3cOQe+Lxyj8bmhpRcSCj9e57iQkCWCu4X9c2QzA3cZkzp/6LNKLtLFThqqjtC2KyUfRhBfJaTUHSq5ffpkr676Q0v0R6SGgkxdKOw0xfKRFQpRzdXJqXUyhIig0lpsSJ6yZhV3FzmdvQ8aftd1mCMTH3xvt8Uy9CmGCaDvZxkGdXFsSWlTryXLjs3s3zQ9TyMKYylRwLJX9w5qWHtJNc0ubykDLhB9kr68Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA0PR11MB7790.namprd11.prod.outlook.com (2603:10b6:208:403::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 17:18:22 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 17:18:21 +0000
Date: Wed, 8 Nov 2023 18:18:19 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <bw3l45vnpmgmiepviwsy2fdqfza6cm3aj2h3kn6bdmihavlpzq@4kpk7ertxozd>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-3-michal.winiarski@intel.com>
 <ZUtV9EE+/PzCASVw@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZUtV9EE+/PzCASVw@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: WA0P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::27) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA0PR11MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4668bd-f51e-4692-0392-08dbe07eb527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: itpCwu1if3F1YJE6fLnMPseFN669FrSwAY9ZMLrV7wM4DAQg/EM2Ami7QVMNYP/xbFFl04NNXJ35MxjEbRvOR0QcNAPB/qZdpN2H3CWghjwAS8EtmQ+bqAbUi0qhx+A8Rk7xCBZyvKE8uMaW1/rqZqdSNFeZVPDePteex6MvZzTJPcXj2J/kVOrwZh5AVWGNklJs5JWAk4svOBvgfy7hQ7kCTfqc14U4GgfvPg6dcsJMaJJyc1B54iK1auO8EIweuze4xHAX+8maEfevGz/sr5l2OOLISwjVrHUm35rBekgUdOh4sPU4D9ylHaYmJ5/Un+Tl3HTEDK8buts3FYSlMZCjY3hCmFKBSUjj87Yzi7feweDCuDXbqMGjllQPe0Mkiy/OqjsZt86xn20Q56ZgUNJCbI455KLFGv0bkSVoGzDUtvai5672NnSUCQ5cuqNM0gk9VFmqFka14OSPRJzpJQpjJBXc6HMJd4QTGBLlCGTDowbDbA4r6drfWDO1jzLKlh8QJl4jY4U0dJ7CQu1/Hy0hLUZr96h1elV39AiL89WXZ3HgMVd3w5E5d2ldO4xg2bWS5PA23e6o+TgIBspFUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(366004)(39860400002)(346002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(6486002)(966005)(478600001)(86362001)(83380400001)(38100700002)(82960400001)(66946007)(9686003)(6506007)(6512007)(316002)(66476007)(66556008)(6636002)(26005)(5660300002)(2906002)(41300700001)(8936002)(6862004)(8676002)(33716001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUh3SDBVVVhpRVc4dzV3ZDBCdnJaS3lXRGkyRG9XWWRKbjl1YTgvbG1ubmg3?=
 =?utf-8?B?TVZUZDlRM2wzS1FqaXpkOVpQVC9pVnFRRW9yK1pZSXlhU1EyWmN3dHY2WTVM?=
 =?utf-8?B?YzVtdWFsQVJ3K1crcHQ3eGlTTkt4SjJBRHJSOXdZQWhMdkw3OWlqeklPLzJU?=
 =?utf-8?B?OUhTYXNDbVU2UFBFWEZqaFgybFcybEZzVFBrZWZycllTa3RWdTZpdHpWWHhG?=
 =?utf-8?B?TjBWRXo5bi80azVTM2JNUTlFUnRGTFA5ankremtnbDBsdVhYd0U0RU5wekhX?=
 =?utf-8?B?b0hJaVdnTHdHUmFsaXBTRkd2Y0NZRUduV2tvZThDdGJXdFFCSmZ5TDc3QkRh?=
 =?utf-8?B?UkQrVE96b3pPYzVmMitCa0ZsQ2JBNVErbldrU2RyZnJlSTVlRHo4UGxaSkEy?=
 =?utf-8?B?U2RscDlJY0E2ZzlFZ0wyVFVsQnRVaU43N09lR3BmaHBOOGpSV2JUMlFwWnAz?=
 =?utf-8?B?T05SQ0xjRkdJTTdLWjhZT2VXcm1mVUEzT2s0M0pWb1VWN3BYWVpTNXNhTzR1?=
 =?utf-8?B?Y3JTRVUvQ292bGU5MkEzK2Y1THp2TUdTeTJLRWIrWFFQdUFUUEtvcU1VS2NE?=
 =?utf-8?B?cjhUWnZaM0Z6SDVvUTFYVzQwWFo0QmduZ1Fld1JIT2VBeEgyYURTVlJEcVhi?=
 =?utf-8?B?ZTJPMzkxN25xTVlLdHVSSDRscWMyZUlXQTlHcUVSenFlUW14Tk43dVNRSVNx?=
 =?utf-8?B?MU5sU2JRanc0MzY3dStGelZXbFdudlhObXRJaXBhVm9EaElFcUl6V3Y1WWZE?=
 =?utf-8?B?OE1FN05yQ01EYnBsb1BqQUsrdGQ5aGtMaWs2WThSOUs1RjZVN1J4T2dzQzV2?=
 =?utf-8?B?VU03WG8vSnZUcWRFSmFOWnRiWnYzR2ZIbWRpb0tqWFRQSU5vQWVhMERqK3M4?=
 =?utf-8?B?NEkzeHY0ZkI3TTFQSG9nUnZZUEErQVo2ekRLVThRb01HbklLOWdwOEhPYmRM?=
 =?utf-8?B?a21VNTIrYUg5T1pkdkdlTGxvbEJKK1B0MDV5MkdCU3h6UVN0WHoxeG1IZkxM?=
 =?utf-8?B?NWhWV0M0UkpwU2w1aWxMbE9JdnlGWDUyQnJsVkhrZE8yQlZZdXBkTGpJbmhF?=
 =?utf-8?B?a3pwS0dmT1dxSzdMa0NTMUwzZXd2K0UxSzJBaXl5bGwxNEJiZ1hncHdvOXlv?=
 =?utf-8?B?SU02bFBSTTNlWGRWQ0hrUmdPZm1ZRjByLzIwOXJ1ekZvNTVkdXJUc2FCdkls?=
 =?utf-8?B?VkxYUndoYWRHeE51MzIyb2xObEphNjYrTjluUWRjMk1FUWJ5K0JYZk5QRUYr?=
 =?utf-8?B?SStwNWYxZGk4YkxsYmQwbFVFTlAwcmdScC9sdVRHdjVSeVp1QnVLc1lHSS91?=
 =?utf-8?B?dmhwYmlnWVVnTWpVTU1ndVVQTnJKbjJ1aVV2YzA3WkFHMmI0dGdwZFJiVG9W?=
 =?utf-8?B?YXJ6b2QzeEQ0V2hGZTVhMkJEcXFZOXF4RW13dmovMVNCUGVhZ1VWMnZqdytP?=
 =?utf-8?B?dkU1VG1uemFPUUV4WjhNKzdmbHAvVVJpb2hpS05RN1FHNjkrWHVXQk91SlRo?=
 =?utf-8?B?YmxYNG1rZ3ZFWVVURk1vSTA2WTM2ZHF5dWZOVW5wZXp2WUlLRFdFcjk0d2NG?=
 =?utf-8?B?M3FxQVczRUcvTlBTYVZTanZhckVySk9kOTRMVGpwNlA1VW1WUnJYZzNWVGtY?=
 =?utf-8?B?RjVkZjllY01PSjVZbzlvM09zUkwzdUh1M2Y3ank3MkZxMm5xcDJqWk82a1RD?=
 =?utf-8?B?eFN6cVFITFJTMHNCcWxoc1NudzJxZ3hFWmdUSDFudUdMbG12RUJxWkV1SmtW?=
 =?utf-8?B?N2lkQ1cvOC9XSlJ5K3hsaEtoV3ZsT0wzV1lQdEFadGs2Q1pBUDk1dUJBMnRN?=
 =?utf-8?B?bnlZOEhiUjMvNGd0WUhjMFlRM3FReENoTmUvdGtUREdRZ2tQanlkTVpVWlVw?=
 =?utf-8?B?VXJ2THZhMk5PdmIzSFBQR0h5UlkxREN0bERieFRXL1dwN3hOZm90SjMrZ1Ji?=
 =?utf-8?B?bWFXenhjd2pScXN3SkIrVGFxU2d6Z2UvalNtVVNaRmNVSk5DMUJPbFBIdzMw?=
 =?utf-8?B?TVpPTVQvU2RpSjNxS2V5bittNEFUMUo5WmhFNWorTnA1dnZjcHJBYVB6RnlQ?=
 =?utf-8?B?dG5DQmtNNThJemIrekNDaHFpa1lHaGdxUzE5a1FNNkpRTHAvU3pLcXdwZVk0?=
 =?utf-8?B?bkVaREhuRFZCM2ZmTGNIa1BFVEI0c2F5dmE4dWhpNGxybTVZMGQvemNpL09Z?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4668bd-f51e-4692-0392-08dbe07eb527
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 17:18:21.8554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ml3LnmoKoCtV74SbdhgWuiBYON8xSimq4VXpfdsr7bzUFYi5ApjlVMYAokT1+2M1ZNuxKnHkRgHVQamGSoF+5ev555gUhjCqtZ7rOr35eNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7790
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/12] drm/xe: Skip calling drm_dev_put on
 probe error
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

On Wed, Nov 08, 2023 at 09:33:40AM +0000, Matthew Brost wrote:
> On Wed, Nov 08, 2023 at 01:33:34AM +0100, Michał Winiarski wrote:
> > DRM device used by Xe is managed, which means that final ref will be
> > dropped on driver detach.
> > 
> 
> Where is the detach called if xe_pci_probe() fails? I'm struggling to find that.

By "DRM device used by Xe is managed" I mean that it is allocated using
devres. In other words - devm_drm_dev_init adds
devm_drm_dev_init_release to the parent of DRM device devres stack
(which is the pci device in our case). That's the final ref being
dropped:
https://elixir.bootlin.com/linux/v6.6/source/drivers/gpu/drm/drm_drv.c#L708

Now - on probe in the core device driver model: 
https://elixir.bootlin.com/linux/v6.6/source/drivers/base/dd.c#L658
Upon failure, we end up callng device_unbind_cleanup, which then calls
devres_release_all:
https://elixir.bootlin.com/linux/v6.6/source/drivers/base/dd.c#L549
Which then calls all of the "actions" added to the devres stack.

We can then expect to see something like this on probe failure in dmesg:
[27215.580902] xe 0000:00:02.0: DEVRES ADD ffff88810ca9c540 devm_drm_dev_init_release (16 bytes)
(...probe failure happens here...)
[27215.698659] xe 0000:00:02.0: DEVRES REL ffff88810ca9c540 devm_drm_dev_init_release (16 bytes)
[27215.707388] xe 0000:00:02.0: [drm:drm_managed_release [drm]] drmres release begin
(...all DRM-managed resources are released here...)

Thanks,
-Michał

> 
> Matt
> 
