Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: "Lecluse, Philippe" <philippe.lecluse@intel.com>
Date: Tue, 24 Jan 2023 16:25:16 +0000
Message-ID: <DM6PR11MB45291BB4644955E0CED4447995C99@DM6PR11MB4529.namprd11.prod.outlook.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
 <20230112222538.2000142-38-rodrigo.vivi@intel.com>
 <Y8/9Sn1LAkpDW+Ex@intel.com>
In-Reply-To: <Y8/9Sn1LAkpDW+Ex@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 37/37] drm/xe: enforce GSMBASE for DG1
 instead of BAR2
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
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>

On DG1, BAR2 is not reliable for reporting Vram size, need to use GSMBASE.
Simplify xe_mmio_total_vram_size to report vram size and usable size.

-----Original Message-----
From: Vivi, Rodrigo <rodrigo.vivi@intel.com> =

Sent: Tuesday, January 24, 2023 4:46 PM
To: intel-xe@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com=
>; maarten.lankhorst@linux.intel.com; Lecluse, Philippe <philippe.lecluse@i=
ntel.com>; mchehab@kernel.org
Cc: Auld, Matthew <matthew.auld@intel.com>
Subject: Re: [Intel-xe] [PATCH 37/37] drm/xe: enforce GSMBASE for DG1 inste=
ad of BAR2

On Thu, Jan 12, 2023 at 05:25:38PM -0500, Rodrigo Vivi wrote:
> From: Philippe Lecluse <philippe.lecluse@intel.com>

Hi Phil, could you please reply with a commit message to this patch?
I will add on the next interaction or while merging it.

Thanks,
Rodrigo.
---------------------------------------------------------------------
Intel Benelux B.V.
Registered in The Netherlands under number 24134020
Statutory seat: Rotterdam
Registered address: Capronilaan 37, 1119NG Schiphol-Rijk

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


