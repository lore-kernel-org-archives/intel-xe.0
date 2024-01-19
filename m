Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C393FC47DB7
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 13:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6343A10E9E5;
	Fri, 19 Jan 2024 13:09:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BDB10E9E5
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 13:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705669775; x=1737205775;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tkJFO6BKHl7lOcRe9tczc9Jq4vA9a+qDGO4gtpZKC4U=;
 b=RtHHrFeJByplazgObjo3gj5HQZaZ91KmR1WO/raEeGMrVippQm4NzK3g
 BDC7MfLck5/bBmM2nGFGZ3xJLc8O/ICAOnesEUr3BoN161q1RNpaBy540
 7yYeIsxBrN/J9ocIggBwsv2VTt0rSIRJESkMZH4hYcnG5aSNl3HT+3yLS
 mNUGw9dl2vunzkPOfQElTmIXa0ixxWljuo2ytbfJHNXplmZWcldLqYbRG
 iI+qfAHm1CJp39x5V2SmQ3tjbn0aTAiXy9ZV2rdY9PVYxFMklBRsoDDhK
 RMIgiPsIgR/q3wOIaZjaIxv7TfMZROIeVaH7p7+xcpWLfCqeNub0nQfUb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7497272"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7497272"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 05:09:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="19406448"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 05:09:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 05:09:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 05:09:31 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 05:09:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOan+nhetkSJT0ybk/BmMghV6XPOA70W9BngzHq9Ghfj++CMkFH97NlBrX4U2JjY4J+O26un/ijq2uK/7p9/NxhBxjASn4ozyhwN/4F4/9MpkQd0A5to1DQJYjPBqDC/hMkXjfuGosY9sKKHQ9s+uxZkdmH6ZRUhPCAsrI7IfKiJ+8x9Ua0lY7SNesHt8nOjaWlaieoTUOQSDcVmzzRQCm2ilKrg9ShR6nPdF+Cb/iwzZy3Nb/WXvczI7gRYNKFgxMbnyaCRZvnBfuam+S04XHr1HotKrdsZRVCHAdIFJNYYSqCm89axDu0lZINKkz6XZRWBazSywayAHXDppTSX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seqIs044hrjLMLXIW+bHak3a1/VT2SRW3d+UYIxzLLs=;
 b=UGZgHfJPLYkqUH9/2HtmazoDNwFA3yhy9GQctD4ZSqddRR3iYjB/sf1FPIOb7GDxMJzYjA1uq7z35NsHB5ulP2DJH0kT42TQ1Vh1Z0eZQsMvrSkbi/UxdLlrN51iJOj7extmywCTPFs0YeCafe7PvtACVnY1OVwE3y60CZV1aXtiyRLAR3W9zWac6Gl13rmUxvO0ONr3KsNMAorfmap/xaCVFOlA/gJ6NJxU9WtbOx7PSdg0ua4OrPirup+mI5m2/Saq7PEin4kgZFa8a/2BUWkh6Vb9RijVL70MYzo8EesFre0PujKWrNBH+hlKoAAyRjGt09y+MoufyTUGz40cAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW3PR11MB4587.namprd11.prod.outlook.com (2603:10b6:303:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 13:09:29 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::f3c8:b435:76a3:b957]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::f3c8:b435:76a3:b957%5]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 13:09:29 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/xe_debugfs: Print skip_guc_pc in xe info
Thread-Topic: [PATCH] drm/xe/xe_debugfs: Print skip_guc_pc in xe info
Thread-Index: AQHaStc93HOiPsOn3UKGxQMSwZrfebDhGz2w
Date: Fri, 19 Jan 2024 13:09:29 +0000
Message-ID: <MW4PR11MB7056B920FEBF8641697ED54DB3702@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240119131025.1872947-1-badal.nilawar@intel.com>
In-Reply-To: <20240119131025.1872947-1-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|MW3PR11MB4587:EE_
x-ms-office365-filtering-correlation-id: 3aa8ed5c-2f34-4e5d-09bd-08dc18efded4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zurjmYW8dP3wu04bXXuA5XY9hgTsB33vidzofHNuqVcpWQ4mta/N38ch0owRoW6hYrO5CsKg1vIo+t4pp4WwnRGL+rK29ZgackaMB7IWHfZojWZRI34KL5fvlcdWF5AsYlijLRQ6VwZwT84xPt+l9FOgGNzMLqVALQQBa0o+BJvtt3cMrP+7WBubYQ9/LODCB3ue5eCau04eZHlPphyi93RbwCtXb96L9794LlINUzqZ2PWOx4F0rDwws+Wi3AVbT1/LLxArcLAVGVEFul/bEcgD5ZbpxEbxJnlIdgqOQ5p5srCtoVR8T1JD9uMEGTDa8tPTDcwMJ2acug6GsXJcb3OTIa5lIoU+viQqp9nZ2HFQy3cbq1Tlb72Ot6B8MFxdtI66qxciW+p1NQmK3jf7V0k39eCY9mRekl4n3pQa7iOTkFBMUR4sD27n3GG/ZycEQPOh11XdZFJLACxKRbdQaHMMB05pvkwXizDmrC5Yyyw4v2Ew2DfDIFMndEfDY0CK0QyrIRpCGe6EIwPOD7LVdhCzBM46MFFrjxlAO6RuZ6JgqI6V0TN8l+/kl9MaCLVxJYyDn5qh/8KjhJgnzDnJY7h5PIq6CjNtI3dEV+GWd15FqqquKxWyNUQnZLmsXAWG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(366004)(376002)(396003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(55016003)(53546011)(38100700002)(38070700009)(82960400001)(122000001)(86362001)(33656002)(107886003)(2906002)(5660300002)(83380400001)(26005)(478600001)(71200400001)(9686003)(7696005)(6506007)(4326008)(8676002)(8936002)(52536014)(41300700001)(66446008)(66476007)(64756008)(54906003)(110136005)(316002)(76116006)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9e5XKoN4kUTdOKMYbpwjgmJMkHSwyj7WLYqO9Jff2fMy4UO+c84yKmhiG48E?=
 =?us-ascii?Q?cJ7g6WJ8GsRPFrEi28cbH+0Kf1UUlNNI5OXV8W5YFSj3+vj+QNEWAXkCsgX1?=
 =?us-ascii?Q?t+tXWpIxbA4MjHu06kp0wKkQH34zNQfYyBc18/2CXx1/Szx2CVo3WqCnJeqc?=
 =?us-ascii?Q?WVAe8tGseSz6a0vv56JooP71XE3PXA8dNDGY/dP6FfnY50EnZjOuSQ74zELJ?=
 =?us-ascii?Q?8pSmig7mzucVuKXtcGCjNLY7wZ4ZIlWpvLXSL2WFiyeBIJC47PXKk4gx+1M2?=
 =?us-ascii?Q?yWbRiFqqcXlg1GwOV6B9ab+JW55ythajUIh4brIQS+RueazyXlWaGZv18CFJ?=
 =?us-ascii?Q?AAQxXbnRJObpj7z4NwUdM6GYlUJ2ANqRPVsPbCEF9FGOcDv0R0y7SNW6noKq?=
 =?us-ascii?Q?uMS5U04plKIrTodYUNtYzsb8RLNR4x3BP75l8KIZbRM02r5bpNdiNm2yi2Pb?=
 =?us-ascii?Q?IyYk2zwRc1FnCKNEU01NbdeZsxA7YJK+Nbnb/PtEycxQ3+TcYlCYs2nZKzOD?=
 =?us-ascii?Q?x2Sg4UMrG0pbDlQoncuLU/pqFqsJ5Z624re40NX74fnoZRKz87rzw8jsf0RD?=
 =?us-ascii?Q?zXVHpmu7QuQ+sjac6G0dxbfxTnf2qUZOc1SUPKeCuLvE8xWRjc3Ug6EucBDY?=
 =?us-ascii?Q?WV2tjYRPtuB9OBL+Ht+oH9jHo7Mf9fg0BTm0FxBOyVv0OvYlTPphtjo+j5TH?=
 =?us-ascii?Q?Ab2xuTsEfr2K3cxT4meKpyI47KXEUNvVo7laPMlI6LKJo1YNTc9InrIdp65i?=
 =?us-ascii?Q?N7RqvWyIiY3mnbmiMsSzcaPmoIRD8AUI6xPuELFbPMDZuH71y0Wrvz7LJSg5?=
 =?us-ascii?Q?gvVl/4ADtUbeDDaTJ6d6fZ81eFgjobvrxY44ZcmNEGQt0NiZzbJdbw8UC8+6?=
 =?us-ascii?Q?YoUjdVvQT65kK4VAJowSumnvnC3FKN/CDYwr7V+yqcf5dlKV6FZciv6+vViA?=
 =?us-ascii?Q?wDY0Y3hj4yj0MRzdZBxEbk+/UIrPUl07tdGPJTgZokA0se8g6tmCfp09ykeB?=
 =?us-ascii?Q?3Ks+LnegZA8/zvQY3SF+KyQfE46xlPVxxIztEAgAp3X40CiMCAlG1t6t4CkV?=
 =?us-ascii?Q?+758m3q4OgdOqFlUh049ljlGPpJipE0n2Zm8em6Gw3pjXf+30gpym3mIwYvp?=
 =?us-ascii?Q?zmHHjKzAoYWmVUVc+IvP2NeghUPhIYLK/F3aSkMljnYrGOvsPqSTmejBSiYe?=
 =?us-ascii?Q?ZvL1P+EPyGfxTtiZp0rha3ETsee5Ex7JnPQS/fXvx8ahF4Q2DRoMZ1qjii6c?=
 =?us-ascii?Q?+0I2OJxpLSdx09PU2lYr2UmR3M58koReCPgpTV8VcOvHGDA4hlVytGOhdpjG?=
 =?us-ascii?Q?pLYfkGjT/aYvpZyKzb8WV5Afhh0COqjPA/y4iG1HJPz0Tju0QX9cB8lt5JzD?=
 =?us-ascii?Q?C32aZMr4j9Y5/XT7ZXl64HLKz1SUPF6GaObM4yrmA0Aw5K4e+KttgHuacdIg?=
 =?us-ascii?Q?hKQV1fXijtfOIOIpN23txyGk2IlieOxKFtWCTKrFEUepveYdmqdmsjZstqIA?=
 =?us-ascii?Q?EKtJwmv67Yzx/MqhA7Hf2u5wwnHzSDz8pHrcFyY7O1BMDiIjwOtVwFfxPvfK?=
 =?us-ascii?Q?b2Ou35C54NYQn+W4RDSiK/h3LiQ2NuM2PYKhMbovy38LAY8Ae4YvJajnfXfg?=
 =?us-ascii?Q?5g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa8ed5c-2f34-4e5d-09bd-08dc18efded4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 13:09:29.3821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zw65Eif1OqeCrjP2MiEeFuxE1LQFQ7oGZdmFGVC92y7MOTjbRvg8EQcL586bUCQ/YdymxIDZTg9T7urKMb+Zl3xvCbyvmOV+3pKJvkdiXbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4587
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Bada=
l
> Nilawar
> Sent: 19 January 2024 18:40
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH] drm/xe/xe_debugfs: Print skip_guc_pc in xe info
>=20
> Print xe->info.skip_guc_pc in xe info
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> b/drivers/gpu/drm/xe/xe_debugfs.c index c56fd7d59f05..01db5b27bec5 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -55,6 +55,7 @@ static int info(struct seq_file *m, void *data)
>  	drm_printf(&p, "force_execlist %s\n", str_yes_no(xe-
> >info.force_execlist));
>  	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
>  	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
> +	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));

LGTM.=20
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>  	for_each_gt(gt, xe, id) {
>  		drm_printf(&p, "gt%d force wake %d\n", id,
>  			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
> --
> 2.25.1

