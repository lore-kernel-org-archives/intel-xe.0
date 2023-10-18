Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB98CDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 15:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D4A10E05C;
	Wed, 18 Oct 2023 15:14:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DA410E05C
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 15:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697642045; x=1729178045;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7XdTW4blVU3ORWxqfmgZO1Q4XLPUWbhpXBcmnxyL6Kg=;
 b=Ju5xGywKQrNTvItnvTnlKPCI7XPI3laPYLXNqkAPYccuhiiQHMtERbrR
 UJF+NiYlCSWBJ0LMwJN0RYUxqRGZnOKZvqSZsIVUSDPIwFqsreKw6cIAo
 LmbDK5LhIfgw6J9qUvt9oWL/rEyKDNKu+M9fN3VHYawv2md2v4D62at5G
 z+HgKLIkzGbLdxAtUSZevzk38ieJkd6LptHl46ilpqLPAu8bbh5bVvngw
 DF9kC654qG++RRA6RclB55PSuyLTculziEwCdr10RPOMWx7AYib9Thk9+
 yYI11ou5E0QdfdXqiPGuwH04/tXJWGh9/R8K3kr0zBYhnIQLGsiI1hg9H Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="365384479"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="365384479"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 08:10:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="826928183"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="826928183"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 08:10:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 08:10:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 08:10:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 08:10:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 08:10:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCQEoSBtMWwjGWcT5Dt1Zr/8MguwUOT/grIippH3Cxl5GR7qPM0JSye1/N2cLVVTs7Cu+noRoJrSNXvOnFH7pS0Mve9C2CLdmSF1oUT1m2Ws4VaW2sFWVPW0FgQWyZPRHp5e9UU+7AZjXRM+rx/+5dt88l55gwo3xzr1p/39LUNj7lAOq3+WwoJ8ThEH2Jy9+d7BIZ0StFS/8JLBVtSwFc22hYG3s7XH3ZIMhLmRnd3+YK61aHR0leJhlOYSrNjmKvfYshWHWFhQ2gub9Brut2jIpAM4gdl5R5mm7iJu0uqDh3u6BH8O/SVw0g+LK/rU0G4KA8a0Wqqaifp1eMQzPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knTwbpIL8S7+zNOaM3Mv4psrOC+BJf1XUYkvCnQ8e/o=;
 b=ndHa5XgGCiMnGCq8GrCpwoN/EsjqA3kDzQL1kWOODg6DgPMS58ir4G0JfeG3hRHo65CPMLlHzXf1fbObvJd9Z9j2rjic66BmDGEnVvC1tKkTpuOvKYmwTAhm6Hsvo0bi/3wEAQvHdSluSwYZtWHvQH7apcUEYJta57fdIFZ7luXGOgLteAOgsB+pzkHNIUbEpQYCaXjpJYeyhhRy7HglJ1aOByRMh9T67nms/Bk1blBHeW8zcHUQo8FVXHQt8cdz+S8byBpJZ3yXSXxzZMc0xXqKyrzhvHThtQlccz4NE7gUX6WVRAdVkIfzzxVWvdCfgo45cDZryZP+mojMW7elLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by PH0PR11MB4871.namprd11.prod.outlook.com (2603:10b6:510:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Wed, 18 Oct
 2023 15:10:49 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::c95e:8095:2c49:56cb]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::c95e:8095:2c49:56cb%7]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 15:10:49 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [PATCH 1/1] drm/xe: don't repin a userptr if mm is closed
Thread-Index: AQHZ9xzeB5A/aznC+EughL3JfQhdorA7iGYAgBQy8yA=
Date: Wed, 18 Oct 2023 15:10:48 +0000
Message-ID: <BYAPR11MB256788A7D1AC4A3CE738BC499AD5A@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20231004234721.2076190-1-fei.yang@intel.com>
 <20231004234721.2076190-2-fei.yang@intel.com>
 <ZR8C8tLFOKBihlmr@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZR8C8tLFOKBihlmr@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|PH0PR11MB4871:EE_
x-ms-office365-filtering-correlation-id: 51113308-37f3-42a3-41ec-08dbcfec6959
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LtLAg4n+hlx9QL6VvqxPZRMo8rb70yeoahR1ogaJpBv4GQUzxppFlxMNoIF7ZtJF6xntfv9eXUxJaHM9fi+efTDZd/x8ZDU5XdjTbxM1t+z9BgfvrKpAVEWdjFjMqUeGuz+SQQKCi72G5viks87dMyMVCBcyiHiP7hGZXBZlzxbBinIelcpXZY9dkJrNEIXEJtsYWs5ti0m2QktB0eF1sN1zRl5x8CwZSLHYS75WbgyzGEL2upn+SSW9oy/msfmS2AdpjDbvwvLtrc9LRwjaHsiRvQqWkRX8gX23bUxo0tC1fVp5y5YCiDKN/T5XCI/b8/XgwZy6Quo7IpHFbq3BTT9xWj53/+FHGijAr0PSyvWkxxOL2KO+PRVLQ3cd9ZKU9ksXVjouwtNUQrePjod0HfyH27xubid7/zIWEREqhjCE/6zR7TZPMTU+5HKhH6fZwwaZEDsta8wtOuDvY11EzoiYZkb9OxFStxYyglSJw5+twa9EeQv8vaukc4gPGJEQOA8JoIYnwF4w4opTiRcR+N7y7Nw6OaZzP3kHVPO9gIQI+GEP3fKMcCzPHbpTiAFel42AyEyZkoCIfA2dv4pJvGr2kXslEFm7VkWWCpjPYsUVKkc76xoxsYdgxzSrU1BY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(376002)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(38100700002)(6506007)(7696005)(83380400001)(26005)(122000001)(86362001)(33656002)(55016003)(38070700005)(9686003)(2906002)(6862004)(82960400001)(8676002)(66446008)(41300700001)(66946007)(71200400001)(8936002)(4326008)(64756008)(66476007)(6636002)(66556008)(76116006)(316002)(52536014)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6GAJvwGgDElrooCMI+vh+s7qy29I2GsmbPa3Vml4B13y+77CnZ6A3/w+qJHs?=
 =?us-ascii?Q?8J/wWRZIQRM4OJxDUxK4O23Ap5mc4srn/pY6E6V/y6SzaFTuBz9+4MJ3r875?=
 =?us-ascii?Q?ccWPFYhceqix+IHRv9o//WA1cKSkTGIQiPOneVakaQz35YJVCeSdhXXOuJNE?=
 =?us-ascii?Q?yC543IPeEEJ4Zs5fxq1bcWDIVt6s0QcgytPcfxpDKyuUUVLUf1yAb0BEXpd2?=
 =?us-ascii?Q?6AZDI2ruTZ9u5lfU2EiE6HRirIN+PJwhkMOPg9SUC4636EbwGm/e5YHB33TW?=
 =?us-ascii?Q?vgWTclJl/NJUsVr2HWALAvYgBee3AYDoz+u6CRUkUtuxKTQdBLwa8r7SbuOj?=
 =?us-ascii?Q?u8pC7+NqSz4gEr3IkcC6G0ItCl0dH97/Zu1BTN11fE0P7K7ZE31ELCy/8/Km?=
 =?us-ascii?Q?+prs86nnrF7VTPmAou0bs2nXUbHDdfpLhok3P0z7/il0jnA7vAi7Ah1QM1Xx?=
 =?us-ascii?Q?6tb/y/wiyoEo5o3qtOenz8Pqo/3SqBibr8R3hrSSWpQO+HrjzsCKDBMeaPUE?=
 =?us-ascii?Q?lXlRo3V+QVRZNXKh05d7psCv5/a4NRr0pfugReeVYh84m3bcqpZdDuAhy7Kc?=
 =?us-ascii?Q?5j6oq8dv293IR4SJjTiwKvsBG2a06AzKTclKsTvZBZx/2XfEUEDP9zjqioYL?=
 =?us-ascii?Q?EPF8PWV4QwVcyxWbuNvXo77BMXWjTcLr0NwMsLX17rWjb9xdY58Jchnx0Zsi?=
 =?us-ascii?Q?kowdl3Lf+9GUbn+gt0IIs+fFdzfz0k0Na0oPpKnDwYsowop4/jrfhsCLMeHc?=
 =?us-ascii?Q?HpGC5o39OyUVg/8Lnv0DBe4JBuo+9S9QKdyFiU/a5GnUh1MVwXxW/qdMSHdD?=
 =?us-ascii?Q?VpDWgeyD2uIZtcGetzh2bDuFbd3lXozH8brJeOllKOhD3qk1XyboNQJWpho7?=
 =?us-ascii?Q?nv3OtqxVjUonntEhX9EwmF84vI4NoJCC5iRMbw4AonSA/CXCRrbPtJ5PjPTW?=
 =?us-ascii?Q?ioMTpWTORfc37uVILVcOm1IYsQqIfEDTA0gKYq620H0O61FZM7xZ/VyoxtgK?=
 =?us-ascii?Q?hmhO8xDLta/jpTtMzw7aHGapyEmHVzNI0RhkyCupYA5vNxV5sNe/3+XAnlfF?=
 =?us-ascii?Q?6tSQTCwJfdQeiZn++EPYnPv3wJ3koWT7OXWlbirOdLhyPxl+s7l9oGVc7URx?=
 =?us-ascii?Q?s909sxyJVNH23cOdljlhmX7tKuVUsXfuDt4FisG3peD5S6aszcch0L6CUPqC?=
 =?us-ascii?Q?yVuldaXJwfcBUtm0zy1i44541dlWOx6u9KmEEodoBaJZx70AxY/zDM/9/3ko?=
 =?us-ascii?Q?IM1qGnq11zShUCT5aChCUtVd048kB9B0fdC1+lqQPaGWI2EY09/7W3nPOAob?=
 =?us-ascii?Q?ucav/OJEjw3oeXLKUrssUqwhOU0vKsuxz2Mi2Z81Mhp7I8FKWNWDp0JGe3QA?=
 =?us-ascii?Q?mvQmrhIxHUbBsPbADVuUC0X02Ncskh07nm2NNpguoyWXgsHI22VDbAyAWta8?=
 =?us-ascii?Q?7BiYbFAe3DxhG/h9pxiSj1QbqYsHn8isyPunJKKc6oDSIJB2ofjN8H+sU3nP?=
 =?us-ascii?Q?3HITDcUCDstMT2TQwacP1XMONgXY04R5XD1V0R+i0Szv6Cvdkd2TA4WVfWht?=
 =?us-ascii?Q?K+uxU4pOT0ZOygIcfF8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51113308-37f3-42a3-41ec-08dbcfec6959
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 15:10:48.9319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DFPyefBwBnD+YgvHYi6CeH4a2f599kkX+ptjIYB70+2Lw/BJ8bP9JvTLX3v5nfqViI9571wI6AeMvLNfsvdQbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4871
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: don't repin a userptr if mm is
 closed
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

> On Wed, Oct 04, 2023 at 04:47:21PM -0700, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> Ran into a problem where xe_vma_userptr_pin_pages failed with -EFAULT
>> due to the mmu_notifier.mm had been closed. In such case, the userptr
>> vma should not had been added to the invalidated list in the first
>> place.
>>
>
> A few questions here. First how / where did you hit this problem? i.e.
> What IGT test or UMD? What platform? How often can you reproduce this?
> Do you have a dmesg or other debug info?

VLK-50463

> Also by design xe_vma_userptr_pin_pages returns -EFAULT when the mm is
> closed from a kthread which seems correct. Is this the case you are
> hitting? If so, unsure if this is a problem.

Agreed that it's not a real problem, but the warning is distracting.
<4> [1977.900715] xe 0000:03:00.0: [drm] VM worker error: -14

> Matt
>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_vm.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index ea17d026546c..14ba3fb9defd 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -715,11 +715,13 @@ static bool vma_userptr_invalidate(struct mmu_inte=
rval_notifier *mni,
>>       * userptr.
>>       */
>>      if (!xe_vm_in_fault_mode(vm) &&
>> +        mmget_not_zero(vma->userptr.notifier.mm) &&
>>          !(vma->gpuva.flags & XE_VMA_DESTROYED) && vma->tile_present) {
>>              spin_lock(&vm->userptr.invalidated_lock);
>>              list_move_tail(&vma->userptr.invalidate_link,
>>                             &vm->userptr.invalidated);
>>              spin_unlock(&vm->userptr.invalidated_lock);
>> +            mmput(vma->userptr.notifier.mm);
>>      }
>>
>>      up_write(&vm->userptr.notifier_lock);
>> --
>> 2.25.1
>>=20
