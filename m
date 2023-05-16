Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF69BC77B75
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 11:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846D210E343;
	Tue, 16 May 2023 11:41:38 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04D310E34B
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 11:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684237296; x=1715773296;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KYANPIMvMQPj/BKg0DBSBfmObNDcTcfIHY743KXDIHQ=;
 b=gH7T6aDLoHcam1AZyuiXN0ZhPdce658mdObrEkdL1a0FsGwcHY9G3RNh
 CYYjBMh2wUifTInlnto4xmwORdKWXF6cg8SIbq9xYpmdZK0B3OtZHNdWp
 RqM0ITvwMLp0UFPXc9oatyhODv/55dErBgLg9iqkt0qy8TUE2CKDyJeZJ
 gSog1fq0n3CjE+8PVvjjDo2K/JpDcZhh1jSn3mDgU58VrhUf7B7Yej2fT
 +LVpffiMxy6214pvlBbI6fqOshdOfyWOD0DGhrORSp6EkTLoXXnB5/V7N
 trVPzBU7gnkeHqmekXTz6Yz28tREgD15ZWUQgxRAZJIfMVLi5wpA2/flt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="331073117"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="331073117"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 04:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="791050840"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="791050840"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 16 May 2023 04:41:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 04:41:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 04:41:35 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 04:41:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZcovsd0MRsxGwJt3bUhDUUc6UEeM1kPdnsgkAtgLJDz++43DANTEaqCVV0drCpEYt1LUsVaCeTmecExcFepyIaLtWSLLTRmQVm9JepCWlKvNqbPFFV8zkFU2JUtTbV5qOdqVr1JKBK+sGRVoUurYa+tYz1vcXOsXC9Xpon2saDtVLXtlug+3QwdNo2tRItAdz80duVR80/3XbY6IT9atn5TmcpCRBW/yhyJr2m4tWEgCF3kVAgOO3aF0Ac6XLy/GEpqN0nHs+tebRv4FsUUWkITjhex/MVwJvbQJ4y/G8AjRl20t7hKCkWERlPgw45ItyRBLCUKS0wzVkP/FNhXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSZqJQ4rr2UktxxA9EaXYR+ItXgQPu+xkRDH9D14oaQ=;
 b=FnDCpco96TMm1UQcMu7m5JWUK6AD9XeBY2ggel8OFfKOuJtEf1EKr5nkUl5FJjXcM/gdo+mdWwaul+H5bcokGKKv/xOoohrR8Z2ur2iNPDZS+3hCl6VajQdb/xQFsdl/rL+263DCzHox77uVhCvaM0bCukwTau5vKVZ38P13+Mdhz+S8JGu4P9Ufyt6pDXElPI0IdsH+FD7iaUFL5cqSe0K/SLC8XgpaZ20yj2LvSlMusAsWYU7GxW5+rM9YLzsxG9iaZwkYLWlAluI/Z7qbu+Y9MbqA7ioOQX9ft6QmachJlHsMTgMHCn94mK9UGllpMoVsa98PQRlg09fp9UeFuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA0PR11MB7329.namprd11.prod.outlook.com (2603:10b6:208:437::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 11:41:33 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6387.033; Tue, 16 May 2023
 11:41:33 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
 engine/gt reset fails.
Thread-Index: AQHZgk9opp0VN5cF5kicAhdiYtpyCq9Uf8YAgAB2WzCABpaLgIAAjssAgACy4RA=
Date: Tue, 16 May 2023 11:41:32 +0000
Message-ID: <MW4PR11MB7056BEA4EE6416780502E933B3799@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230509082558.614913-1-himal.prasad.ghimiray@intel.com>
 <def394d8-f723-d036-d5c1-a249ede937d4@intel.com>
 <MW4PR11MB70569ED202909F1F60C3F578B3749@MW4PR11MB7056.namprd11.prod.outlook.com>
 <a5b88190-7bc1-70c0-b729-dd9cf3292c08@intel.com>
 <ZGLSsQjGdV7WmQ8i@rdvivi-mobl4>
In-Reply-To: <ZGLSsQjGdV7WmQ8i@rdvivi-mobl4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|IA0PR11MB7329:EE_
x-ms-office365-filtering-correlation-id: 4e0c6b75-1734-4f37-47b0-08db56027f0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OG2fT8H2U85kJsJPF9gGzZRlnXCi2MNBxcS569sTYaRsrt7W1I0Em0ztcfddZR3+i/b42+mAtj+wPQSsZeEG2Kjrnq9emFQRCxHmEjCPekY49L34dKYclanI5hqWBniJaMOSVDWo4xEBjJSaF6RpKhE17mGH7QrDZbwbiCP4OYiHPs5XpstEwlkFDwaUld6bo5BpFfeb3anW+iE5jiza8hFIjgX36oq/Xqt+dEgsz66izP5SiFP5Ii37b82iGHzLUvCPWnOxIsST72O4E+4giFRGVtfOeKn/0INE8tZ99KgWdr0mKI76bwX58oIA82WKU4wGljz7DuWW0Ow9KnzpO7gHHXIajg9w1g6tB8+Pg8+aBogg/m/NfEbuWyiL7dRoiqO+yLeot+9eQ9SnnlCXoUHNkGF7evHdhxbeUmm6tGrEaw/MHGuptsS/kLGHTdGWDKvQRedM34oPcG7djMnJK6fBWLttdEpC5c1w0HrpbSqDYWyPpA7i+UnF3VFuXsX9YB8uiDgCzldlH+EjJWSOQD9cuUW4XCTvVE875I2qB2MYGPvAKg6SamIkg6NqOeGKdNXpMxcpzbXIcxS5SAFTYxxULU+boaSf7DLn+deMmApoXAS6b4c6GOo8YnQ0ymfM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(478600001)(54906003)(110136005)(8676002)(86362001)(52536014)(8936002)(5660300002)(2906002)(33656002)(38070700005)(76116006)(6636002)(64756008)(66556008)(4326008)(82960400001)(66446008)(66476007)(66946007)(122000001)(316002)(41300700001)(38100700002)(186003)(107886003)(53546011)(26005)(55016003)(9686003)(83380400001)(6506007)(7696005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Hz5k6CPU2ogwbHJs0MF5agEoSipXRrKxUBrzFUzqhAmTCChpzkKPxrVV8oFg?=
 =?us-ascii?Q?Z4RZOCdRsObxFTRCDffKuZsdKS0je69IQyAQAq+CW2Cf1jA80Hgd2J9nmJGm?=
 =?us-ascii?Q?5hfCW+Od818eAddbP9AGZCJnWZbYKwePU+mWUqNe3VsaSpvIG2KJh+5XtcAL?=
 =?us-ascii?Q?cPyAQy9kPtvZwXnt/hRPQ8MbrMMHJgABBKel8qFjDJzXk8KzcklyGi7xgexv?=
 =?us-ascii?Q?gqg03ocMaPugap0si3xiKDZqSi7bMbYsyktpkpnHSdQbS8Qd16kHTnC8tfgw?=
 =?us-ascii?Q?8zOIae4/OBwGI36WShADZcpqKq1+0MaXLGMxx0GblVj7NJJOWQ7zZ/NhYU1z?=
 =?us-ascii?Q?06zW//qdpQ/bNWbgOxH3oYeoeWQxoY63S+XYQ8TCiHeyd8LJOpSoSZN/e3v3?=
 =?us-ascii?Q?F/GWXvcxQvH+pbqqekwi/SJMN1LnKcPpDrvdhaFC0F0T2axdtsby/18ZPcHq?=
 =?us-ascii?Q?0NTc0pKXYUApEmH7chRaRV7t0kX5RVEtI9Cf/Dz7Y6xLhgKdCFcErI0x3ZoK?=
 =?us-ascii?Q?jl5+a7tKC31wS3g0GDGIz423PddbzZjMr+/I7yTjQ3ninHHfVmivY6ThdwmD?=
 =?us-ascii?Q?1WEpm8AXgZkE7aEIIkeWRJlKvnm3FvJSMDK3ahCVezB+tvnbWklXQFHlZm8Z?=
 =?us-ascii?Q?uNDhI+2j8Qw00o1B/c/E7t3CYJyLqcUjeB45QLKnLlm/rvqmxFAGLoqybnkM?=
 =?us-ascii?Q?TTjY/BVUjMSrSTLEOHZ9cNrLP1Q+MmSm4OGSVonPpuURBK3UStLcIKCEl4hA?=
 =?us-ascii?Q?xc023RnUJYWC6ev/8oyZLLGTD+QpXhrXaKLC+FhC3T5ojZGYy0ufmEjkd6nS?=
 =?us-ascii?Q?YXE644FEsxweZM6SIrzCVrc/iO+8Uda7fwUpEQECvI71NcY2YI4z5Pg8iEfc?=
 =?us-ascii?Q?Gag5IYQt4doQJWui94TtzYSrCEfkF/zUfzsH3WpbI3SWt6wnXeYJwshD4WG/?=
 =?us-ascii?Q?J9oOu1mTmzGdNsOXxoiKW3CSMfUPrYaWt+HTryUTMaH5aR/3FvTe+pCt2qzj?=
 =?us-ascii?Q?3LUC5hxDy2FKlHSljyiR0TtTOBuY6itQimVHX3195zC+5WFu58ZUghhQj/fh?=
 =?us-ascii?Q?o0v2RQjrbUiMiRG9JfaXq8KfPIYGHNIcCRLrhMe+VWdmN0nPKIXtr/AhrOLX?=
 =?us-ascii?Q?ym+RhYxnUMpPAsZezYLPE+4AA9mU+5SqIDj0Kp72dwnkpgMgfwq95j49KiTD?=
 =?us-ascii?Q?HWykilN0BP4ec2OXZYDfE30ptAK46q54mfG/Rew6Q5fKr3BhMQ38MazDN0Ny?=
 =?us-ascii?Q?R7FSF07F2EDNSzXGy8pQgYPAYiBHpjU+mzG5NJ0nnxJhj7Jm2p+tfT1mnt9w?=
 =?us-ascii?Q?aV9yf4RHIX/O8VsMPdh1rCHKuh3Tdqn6NvJENrhSnCrLPjusOGKpqu17waXm?=
 =?us-ascii?Q?6DsV5utnSw8SlRS9TeGVVBszzjpxKzB/Hlxbew7fF0c9EaWMYV5aQ8kXNNMG?=
 =?us-ascii?Q?+djAd6+9q1XnIafLBwLimYqBlY7vI8Tb3bczFjPR6bS/4vzLpQBUf+EFPgFf?=
 =?us-ascii?Q?5r5h6i+kDa6SOGoKm+pwsoP3MxYA19eDATstiKFF2B7D/9qo6o4yJkyXN2rq?=
 =?us-ascii?Q?s1GWnwGNmvPUBPHfbo9od8F1YiAo9SJMc+Y+tLLYaAfDnfyd+dgKo46v1CZF?=
 =?us-ascii?Q?6Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0c6b75-1734-4f37-47b0-08db56027f0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2023 11:41:32.4096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1jn0Ozaz92dV4oJfjY4wLIyThTLrGSPp4UcXaPXs10hDCYznEJMc/XDno612LUP94J+2KQZkWQUJwEBjF21Gptg6j7wC6bJnDHrAtg2ffI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7329
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
 engine/gt reset fails.
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Argenziano, Antonio" <antonio.argenziano@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> Sent: 16 May 2023 06:18
> To: Nilawar, Badal <badal.nilawar@intel.com>
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> xe@lists.freedesktop.org; Harrison, John C <john.c.harrison@intel.com>;
> Argenziano, Antonio <antonio.argenziano@intel.com>
> Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
> engine/gt reset fails.
>=20
> On Mon, May 15, 2023 at 09:46:47PM +0530, Nilawar, Badal wrote:
> >
> >
> > On 11-05-2023 17:13, Ghimiray, Himal Prasad wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Nilawar, Badal <badal.nilawar@intel.com>
> > > > Sent: 11 May 2023 10:07
> > > > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>;
> > > > intel- xe@lists.freedesktop.org
> > > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > > Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace
> > > > when engine/gt reset fails.
> > > >
> > > > Hi Himal,
> > > >
> > > > On 09-05-2023 13:55, Himal Prasad Ghimiray wrote:
> > > > > Send uevent in case of engine reset or gt reset failure.
> > > > > This intimation can be used by userspace monitoring tool to do
> > > > > the device level reset/reboot when GT reset fails. udevadm can
> > > > > be used to monitor the uevents.
> > > > >
> > > > > v2:
> > > > > -Add NULL check for xe_gt_hw_engine return(Aravind) -Arrange
> > > > > variables in Christmas tree order(Tejas) -Check
> > > > > GUC_GSC_OTHER_CLASS(Tejas)
> > > > >
> > > > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > Signed-off-by: Himal Prasad Ghimiray
> > > > > <himal.prasad.ghimiray@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_gt.c         | 18 ++++++++++++++++++
> > > > >    drivers/gpu/drm/xe/xe_guc.h        | 19 +++++++++++++++++++
> > > > >    drivers/gpu/drm/xe/xe_guc_submit.c | 23
> +++++++++++++++++++++++
> > > > >    include/uapi/drm/xe_drm.h          |  8 ++++++++
> > > > >    4 files changed, 68 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c
> > > > > b/drivers/gpu/drm/xe/xe_gt.c index 3afca3dd9657..2c3ffa1db74e
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > > @@ -8,6 +8,7 @@
> > > > >    #include <linux/minmax.h>
> > > > >
> > > > >    #include <drm/drm_managed.h>
> > > > > +#include <drm/xe_drm.h>
> > > > >
> > > > >    #include "regs/xe_gt_regs.h"
> > > > >    #include "xe_bb.h"
> > > > > @@ -590,6 +591,20 @@ static int do_gt_restart(struct xe_gt *gt)
> > > > >    	return 0;
> > > > >    }
> > > > >
> > > > > +static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 =
id)
> {
> > > > > +	char *reset_event[5];
> > > > > +
> > > > > +	reset_event[0] =3D XE_RESET_FAILED_UEVENT "=3D1";
> > > > > +	reset_event[1] =3D "RESET_ENABLED=3D1";
> > > > > +	reset_event[2] =3D "RESET_UNIT=3Dgt";
> > > > > +	reset_event[3] =3D kasprintf(GFP_KERNEL, "RESET_ID=3D%d",
> id);
> > > > > +	reset_event[4] =3D NULL;
> > > > > +	kobject_uevent_env(&xe->drm.primary->kdev->kobj,
> KOBJ_CHANGE,
> > > > > +reset_event);
> > > > > +
> > > > > +	kfree(reset_event[3]);
> > > > > +}
> > > > > +
> > > > >    static int gt_reset(struct xe_gt *gt)
> > > > >    {
> > > > >    	struct xe_device *xe =3D gt_to_xe(gt); @@ -639,6 +654,9 @@
> > > > > static int gt_reset(struct xe_gt *gt)
> > > > >    	xe_device_mem_access_put(gt_to_xe(gt));
> > > > >    	drm_err(&xe->drm, "GT reset failed, err=3D%d\n", err);
> > > > >
> > > > > +	/* Notify userspace about gt reset failure */
> > > > > +	xe_uevent_gt_reset_failure(xe, gt->info.id);
> > > > > +
> > > > >    	return err;
> > > > >    }
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc.h
> > > > > b/drivers/gpu/drm/xe/xe_guc.h index 74a74051f354..a3637eeaaa37
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > > > > @@ -56,4 +56,23 @@ static inline u16
> > > > > xe_engine_class_to_guc_class(enum
> > > > xe_engine_class class)
> > > > >    	}
> > > > >    }
> > > > >
> > > > > +static inline u16 xe_guc_class_to_engine_class(u8 guc_class) {
> > > > > +	switch (guc_class) {
> > > > > +	case GUC_RENDER_CLASS:
> > > > > +		return XE_ENGINE_CLASS_RENDER;
> > > > > +	case GUC_VIDEO_CLASS:
> > > > > +		return XE_ENGINE_CLASS_VIDEO_DECODE;
> > > > > +	case GUC_VIDEOENHANCE_CLASS:
> > > > > +		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
> > > > > +	case GUC_BLITTER_CLASS:
> > > > > +		return XE_ENGINE_CLASS_COPY;
> > > > > +	case GUC_COMPUTE_CLASS:
> > > > > +		return XE_ENGINE_CLASS_COMPUTE;
> > > > > +	case GUC_GSC_OTHER_CLASS:
> > > > > +	default:
> > > > > +		XE_WARN_ON(guc_class);
> > > > > +		return -1;
> > > > > +	}
> > > > > +}
> > > > >    #endif
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > index e857013070b9..d068af0ca7df 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > @@ -12,6 +12,7 @@
> > > > >    #include <linux/dma-fence-array.h>
> > > > >
> > > > >    #include <drm/drm_managed.h>
> > > > > +#include <drm/xe_drm.h>
> > > > >
> > > > >    #include "regs/xe_lrc_layout.h"
> > > > >    #include "xe_device.h"
> > > > > @@ -1589,10 +1590,26 @@ int
> > > > xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32
> > > > *msg,
> > > > >    	return 0;
> > > > >    }
> > > > >
> > > > > +static void xe_uevent_engine_reset_failure(struct xe_device
> > > > > +*xe, const char *name) {
> > > > > +	char *reset_event[5];
> > > > > +
> > > > > +	reset_event[0] =3D XE_RESET_FAILED_UEVENT "=3D1";
> > > > > +	reset_event[1] =3D "RESET_ENABLED=3D1";
> > > > > +	reset_event[2] =3D "RESET_UNIT=3Dengine";
> > > > > +	reset_event[3] =3D kasprintf(GFP_KERNEL, "RESET_ID=3D%s",
> name);
> > > > > +	reset_event[4] =3D NULL;
> > > > > +	kobject_uevent_env(&xe->drm.primary->kdev->kobj,
> KOBJ_CHANGE,
> > > > > +reset_event);
> > > > > +
> > > > > +	kfree(reset_event[3]);
> > > > > +}
> > > > > +
> > > > >    int xe_guc_engine_reset_failure_handler(struct xe_guc *guc,
> > > > > u32 *msg,
> > > > u32 len)
> > > > >    {
> > > > >    	struct xe_device *xe =3D guc_to_xe(guc);
> > > > > +	struct xe_hw_engine *hwe;
> > > > >    	u8 guc_class, instance;
> > > > > +	u16 engine_class;
> > > > >    	u32 reason;
> > > > >
> > > > >    	if (unlikely(len !=3D 3)) {
> > > > > @@ -1608,6 +1625,12 @@ int
> > > > > xe_guc_engine_reset_failure_handler(struct
> > > > xe_guc *guc, u32 *msg, u32 len)
> > > > >    	drm_err(&xe->drm, "GuC engine reset request failed on
> %d:%d
> > > > because 0x%08X",
> > > > >    		guc_class, instance, reason);
> > > > >
> > > > > +	/* Notify userspace about engine reset failure */
> > > > > +	engine_class =3D xe_guc_class_to_engine_class(guc_class);
> > > > > +	hwe =3D xe_gt_hw_engine(guc_to_gt(guc), engine_class,
> instance,
> > > > > +false);The The instance here is considered as physical instance
> > > > > +of hwe but while
> > > > submitting contexts kmd passes logical instance to guc. With that
> > > > I assume guc might be passing logical instance or for this
> > > > notification it is passing physical instance?
> > > AFAIK for reset failure notification the instance passed by guc in g2=
h
> payload is physical instance .
> > > @Harrison, John C Can you please confirm ?
> >
> > Spoke to @Antonio, he confirmed that to notify engine reset failure
> > guc is reporting physical instance to host.
> >
> > Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>=20
> I don't believe this is what we want here still. At least not from the sy=
sman
> perspective.
>=20
> After guc reset fails, we will try to reset the GT ourselves and if we su=
cceed
> we don't need to request user space interference.
>=20
> That should only happen if we also fail our gt_reset after the guc_reset
> failed.
>=20
> That would be the similar point on when i915 gets wedged?
> We probably also need the wedge point here before we can issue this
> notification?

Hi Rodrigo,
You are right, In case of engine reset failure the driver tries to do the  =
gt reset
and if gt reset fails there are two notifications one for engine failure an=
d another for gt
reset failure. The changes to send uevent in case of gt failure are added i=
n xe_uevent_gt_reset_failure.

Level0 UMD does sends the RESET_REQUIRED uevent in case of only gt reset fa=
ilure.=20
Engine reset failure notification is not used for this purpose, it is to pr=
ovide information that engine reset was required and it failed.

>=20
> Anyway, we also need IGT for the uevent itself.
The IGT for uevent listener will be helpful only if we can inject errors in=
 such a way that they lead to engine/gt reset failure.
I am unable to find a mechanism to do so. Can you provide some input on the=
 same ?
BR
Himal=20
>=20
> Thanks,
> Rodrigo.
>=20
> >
> > Regards,
> > Badal
> > >
> > > >
> > > > Regards,
> > > > Badal
> > > > > +	if (hwe)
> > > > > +		xe_uevent_engine_reset_failure(xe, hwe->name);
> > > > > +
> > > > >    	xe_gt_reset_async(guc_to_gt(guc));
> > > > >
> > > > >    	return 0;
> > > > > diff --git a/include/uapi/drm/xe_drm.h
> > > > > b/include/uapi/drm/xe_drm.h index b0b80aae3ee8..79ef5947c172
> > > > > 100644
> > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > @@ -36,6 +36,14 @@ extern "C" {
> > > > >     * subject to backwards-compatibility constraints.
> > > > >     */
> > > > >
> > > > > +/*
> > > > > + * Uevents generated by xe on it's device node.
> > > > > + *
> > > > > + * XE_RESET_FAILED_UEVENT - Event is generated when attempt to
> > > > > +reset
> > > > engine
> > > > > + *	or gt fails. The value supplied with the event is always 1.
> > > > > + */
> > > > > +#define XE_RESET_FAILED_UEVENT "RESET_FAILED"
> > > > > +
> > > > >    /**
> > > > >     * struct xe_user_extension - Base class for defining a chain =
of
> extensions
> > > > >     *
