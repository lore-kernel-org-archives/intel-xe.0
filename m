Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D93C77B7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 21:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830A910E2FD;
	Mon, 29 May 2023 21:48:28 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF74489A4E
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 21:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685396906; x=1716932906;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=q7mgY1qB5wUKmYROVG4z1/VUpaCuuU0UUdmsymWqb3k=;
 b=AhW7peaG4KbjfSeqxo4pCnJcJ5dEp8Ujy+Z6+jw/I3tgY4uIV+7goAO/
 OFWoaW8uPP9YrMRj8r4G4fTWjOPqoYBgHNzuX7bx2ug/jqpzp3/XrZ6dm
 hvEvEwQkWQ2p7xpb+D7Ltqvlou60M6/I1r/g15Tl1xdvyR7DQJIgqY7Id
 lx2s+Vd4QzVxf4CjgTcLVmWCXrZLeTLKAfY28Tw7B3M49iy6YuVpJntGf
 UBknvUH8JryL4Q8SvpyGp4T0zoIE8jtcIsM4t5TPAGjKxJC7inmYfAfWF
 bMwHxMNpRA9RoUN7iNVoaVwYpR14cFj3IdHp1YdsZs8x3ne8Rv+GTvuUv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="344271065"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="344271065"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 14:48:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="709398666"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="709398666"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 29 May 2023 14:48:25 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 14:48:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 14:48:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 14:48:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U06+ZwR3RbmKVEvpuaUEUpQ4if0SZkhCkl1e0bxuBaFGcmQLiqG66XSMVeKLg4yCJi6DfZuF+fLA0/kzjRRHCel4yYfOMpTuvNRp8CZ7fk0WVIZNdcM6rfnjS4P4bos9mgIRdjK0EQbDNXdYfR4CABlr74Wd1zed7OnR+dCCse13WEzzVBt7mNc7Rml8li8jdh3ijY8Ng1kDACbvIhlvRVPTxmYU68SwBG7+XvrKahioylvum976knz3VAUuqR6EM+uyjAmw3tZMyaC6GkuG7QR84hynsz7otBIN/IcWAmRlT+BIv4spq87iNd2B8rm86pvFt/NXFttLA845eowRDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D49Eetln14fbMelwa9D2jviJUGKtQxjtsQ4yd6AwX+M=;
 b=gbtII5rC+ZW6V9ww/dbgBZiWPxGpnjL379JvU4vaYzqM1jjSr7dOEfWxFKjCstENMoiwkUraON+3Ced+DsluwwWJ1knORpTEUan5olvm4TrlJCNUkY4K5lswB5GBcAv9lFTSD7rueiArz2sDQ+wmNKXHcz1G2CRkHZbprMqLdVeV61T8FLXa+/WFnW/YCll6f8M3TlaFSAgZ5K7enoaxAio1OdTuETC9FGAK6DJzPf9Jly77xq/Y1XqIt3Mz2IU8fQm/q+dHs0WFvm9mPeBtoTtBkU/mdZr3i1Y5EtkJBB04Ai9ILbGmDJP+SFBF2h2SDdp61gk2z0NosZRqfemQDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CO1PR11MB4786.namprd11.prod.outlook.com (2603:10b6:303:94::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Mon, 29 May
 2023 21:48:22 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 21:48:21 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <wjqnree2qplqlfkwuzxcfujob53ooe7ccdenzvypymjjecam2u@p23d6xn3mwi3>
References: <20230525232406.688875-1-gustavo.sousa@intel.com>
 <20230526001038.GJ10045@mdroper-desk1.amr.corp.intel.com>
 <168506366187.3319.4933213415417310598@gjsousa-mobl2>
 <wjqnree2qplqlfkwuzxcfujob53ooe7ccdenzvypymjjecam2u@p23d6xn3mwi3>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Mon, 29 May 2023 18:48:17 -0300
Message-ID: <168539689700.259912.17352008220425971440@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::36) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CO1PR11MB4786:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b74220b-5242-4a67-9b29-08db608e6b3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5A7/BaUHpoxKLW8Czg+IQsTFX7QbzqeQz/STylLhLNufZWgHwnIgV1jqlhTMove1JD/yXKlvJnj3YxaChbCBwTfksqUKolUs6ETBS+Is3vFHNwVugiip629Vp71yuA/4wM/cWLM1klENhvfInulv2efqwLHiXDEE+l/OSbQRoU125UYIkS7BNlDmtPhqhhtW+LvbBSuAOsNLVBODo79c3w5ZFkIOuunp2lZO+t13lQhabVpdGHkHpcDtSMPSPIIDq/imk14I3ZPB61/rscBsollYBg3qFVJHGlrGLtzNhz7X5DlsWZ9jGz+HbiWxs7nhV4nmp8MNfiOWyJo7MWnnteDo0SoNn+eQREZgbMhQHU3hAYOk1nGhzfDYoXx8KXcfbq9fUJ1RsmHdHTBnp8BhLjx31/t1TU/3sLNuk++cXtpzuH/IPXqOpttiDVbkFftzP5fufJ1UXn62bpz7PrxLWGbHpaVlph0GEtZ/Q5khNWIfJCT25MadgmGcSn1WjwrJS4BH05O8ODu4fg2n+zL/yxO6lBVf1GwPizb/xTmcHS6cLXvrVlQQjkShlBrl+T4r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199021)(66946007)(4326008)(6636002)(66556008)(66476007)(83380400001)(5660300002)(44832011)(86362001)(41300700001)(38100700002)(186003)(8936002)(8676002)(82960400001)(6486002)(6862004)(2906002)(33716001)(6666004)(6512007)(6506007)(316002)(26005)(478600001)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWQ1R0JkckNDcmNBZTJOZGYySmFzLzN2c0o5TjViSHFBbXRaaW50QnppRmcz?=
 =?utf-8?B?MmpmSGpXaHRQeVdLZ1ZubEE3UmgxY1hIaUJkTUFSVXQ0UlZmMzFhckJLWlh4?=
 =?utf-8?B?cHlFVUV5UFNXZEhKa1BzQlBYNUEwa3pWd3BNcFBabXBKaXl2MDJUeEN4YndC?=
 =?utf-8?B?Z0dZakFIVlluU3NYYXNwaDdKRk5JQzk0WjNWTmZpN1lkaXNWSXhUa29tQ3RX?=
 =?utf-8?B?NzhkRXY0dGFrQWhUU2M3b0RmcW95WHlJdTl1VGhiUW90bTgwbUdHNVhOODFz?=
 =?utf-8?B?RGRaV2tiZGZrQm84MEIvT0h1MTYwb0thbmxqeUFmOUFxRm1EeG03S01tbHAr?=
 =?utf-8?B?LzhteWNrY2p4U2RQSmg2Nm8xenh6UjBvOVEzU29WWk5MYkw0RDFuS0FLWE1q?=
 =?utf-8?B?QTVhbjNMT0lmc0tzaUlURVgzV3U4eUdUWW9yVTZnakxUL1lvcHdkZ3dKTjdo?=
 =?utf-8?B?YkhqNXA2Rjl0WVpjSWJJUU1aTmdibG9SQ3BQU0w4RjltTVF1eXh5eWpBLzhs?=
 =?utf-8?B?RkxLTXpPSDJyUVJHbHdWem5icXlicCtudFFVSStxK21udjlkdkh2aFpOZmlq?=
 =?utf-8?B?NWhFT1JBY3d4cW5DcWk0NWtrYTdVV1IrOFpzenJ5aThpUzJjWWxaTFdYVWV4?=
 =?utf-8?B?MG5ZZEoxYk50TXdHVVNjVkhteDZ6SFdkZ2E2NTNMSG14WTU1UkVvNGlWTHNY?=
 =?utf-8?B?dHMrYndScktOeHJUOFVwS2laRlBQZ1B1ZnZVRDdURnA0SDlNMFJrS1oreWVa?=
 =?utf-8?B?Mko1VkVLL3ZDaFVuMWpsc0VQUXBZQmR3SVFDQ1lDZzVEbUFDbWNOWUw5Titp?=
 =?utf-8?B?bzAzWGEwWWlHNGZTNm9ValE5Vzd2cmZ3Yk9LYUhTZS9uV3hudG5vVVhwend6?=
 =?utf-8?B?dytKbjVWc2VLdE1OZ0FpSmlZTG9DaDRjZXNrcXpaUUxSUk1HajlhWm56NWRw?=
 =?utf-8?B?UlJ1RGNkVWM5ZFJjcVplY3VzZGZ5N3V5QW5EcjlpR0ZQT2wwZlZvN1Y3Rk5q?=
 =?utf-8?B?cW1yQkJ1QmtTUVFWSEE2MW5jWlhkUXM1d0VHbWpPQjF2YmNXK1J0aG56cm9W?=
 =?utf-8?B?ZHVmaEh1WG1Ic3VuNmdDdHFtSFBNbDFwZ0ZnMlBPSHJDTVFmWktxM2F1MFpM?=
 =?utf-8?B?MVpSOEx3REJnZjk5amQxNzJJc0pCbWZFWXEwaGhsTHBBNEJQamh1TWh0TTNz?=
 =?utf-8?B?bnR6SEtoNFM4V2puQTROSjNEMFplTE9ZYmoyWE1xRDY0U0c0Sld6VURwUm5n?=
 =?utf-8?B?ZGgwTHUxYlcyTDdKMmoyKzRONWRxb29SMWpzYjRKM051dGlzNHdOLzhZNVZk?=
 =?utf-8?B?UW1uSCtxcUp2cUdRc05TVVBud0haL2N1SEVpUGo3SXFnNk85SkR4WjhtUklp?=
 =?utf-8?B?NHV0QUhTM3h6dHY2eHN3a2NjRVlPQk1VM3VhSjBDL2FKakxGblVqSGpscW5r?=
 =?utf-8?B?dm5BTFJGWVFUaG1TaHlMSnlYVHFrSC9GUmN5YUMwbXdlYlRUdStpdG9hN1J3?=
 =?utf-8?B?NU5janRqTkVrMzZXelNHbkFnSlcybDRTWHNvcE1MUEcwVVlUYWZmU05hMGVL?=
 =?utf-8?B?bXBMVW9NeWtaU21DSFBwQ0NibFNmWFRMaVJGNkRaQmcyR2VzQXJzd0JEUDNF?=
 =?utf-8?B?WTAxcVZvYkNVaHlOVjB5M2pCQytTUmtzK2E2cFB3MXMwdEkwTHB6QlpJVEx3?=
 =?utf-8?B?Njk2dGduMXZjbTRiY1BaSHNRQlEvL2Q0MCtZZFNkZG41ODloUkc4RlJBUHln?=
 =?utf-8?B?QXFNait1TzY2bGlzZy9MRjhOZ3F0UzdTNjRTa01DSEo0QnYvWGI4Y2hQY2VE?=
 =?utf-8?B?MFBBZXMwZDlBQk91SzFhMHUycTFRUStIbWVBUFJrbVJtTzQ4TWtIa3duRGVS?=
 =?utf-8?B?TXkwRFVyK2g5L0YvZFJORmQrdGhvZ1Y3c1NMVEttcG00d25ReHUzd3hiZDBu?=
 =?utf-8?B?TmZpTnBWdXU4VHNJRmRWR2lwRnJQMkxIUFBzbFZXTzFua0pwMFc2WFcxSi9T?=
 =?utf-8?B?bWpIRi9qZC93bW1ucVJMbUhodkM1dlgzVk9QMktqY2o0TWFCeVh4Y2dGOFR3?=
 =?utf-8?B?R2xMQUc3OUNSTFdBNExIN1Z4cVNtbTBPRG1UK1p0S0ZLOTVlUGVFUXpJeVZT?=
 =?utf-8?B?VXd3SGIzcVFGSHdPRmdnNmRJVEh6aWlUbE5SMFp3Z21zUWZpWkM4UWZSL2gy?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b74220b-5242-4a67-9b29-08db608e6b3b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 21:48:20.8946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7PNAXlZuq0hdGKDrexmKdhRngC2bq3JE0cnZScDMrsVx0qYqXopYQF5ogfZOf38OteByXQGN4h4+Cf5iIwtaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4786
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/reg_sr: Apply limit to register
 whitelisting
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-05-26 13:58:22-03:00)
>On Thu, May 25, 2023 at 10:14:21PM -0300, Gustavo Sousa wrote:
>>Quoting Matt Roper (2023-05-25 21:10:38-03:00)
>>>On Thu, May 25, 2023 at 08:24:06PM -0300, Gustavo Sousa wrote:
>>>> If RING_MAX_NONPRIV_SLOTS denotes the maximum number of whitelisting
>>>> slots, then it makes sense to refuse going above it.
>>>>
>>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_reg_sr.c | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_re=
g_sr.c
>>>> index 0312823101ad..b82f704179a0 100644
>>>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>>>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>>>> @@ -231,6 +231,13 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *=
sr, u32 mmio_base,
>>>>
>>>>          p =3D drm_debug_printer(KBUILD_MODNAME);
>>>>          xa_for_each(&sr->xa, reg, entry) {
>>>> +                if (slot =3D=3D RING_MAX_NONPRIV_SLOTS) {
>>>> +                        drm_err(&xe->drm,
>>>
>>>We probably want xe_gt_err() here so that we'll know which GT we hit
>>>this error on.  Also, it wouldn't hurt to pass hwe as a parameter to
>>>this function (instead of mmio_base) and include hwe->name in the error
>>>message here so that we also know which engine ran out of slots.
>>
>>Yeah, makes sense. Arguably, we could simply pass hwe as a single
>>parameter and figure out the rest. Is there any reason not to do that?
>>
>>If the above is something reasonable, I wonder if xe_reg_sr.c is really
>>the correct place to have this function. Maybe it should be something
>>like xe_hw_engine_apply_whilelist()?
>
>As long as xe_reg_sr_apply_mmio() is there, I think we could leave this

By "there" do you mean "inside xe_reg_sr_apply_whitelist()"? I'm asking
because xe_reg_sr_apply_mmio() is not called by
xe_reg_sr_apply_whitelist().

Or is "there" the whole file?

>one in xe_reg_sr.c. If we are going to migrate it somewhere, then
>probably xe_reg_whitelist.c would be a better home so the RING_FORCE_*

Yeah, that makes sense.

>are all contained in that unit.... We could then add a func() action and
>remove XE_RTP_ACTION_WHITELIST() too. Not sure sure it's worth though.

Well, we could at least do the move to xe_reg_whitelist.c for now, and
think about XE_RTP_ACTION_WHITELIST() in another patch eventually.

Let me know if that would be acceptable.

--
Gustavo Sousa
